import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../widgets/custom-text.dart';
import 'package:http/http.dart' as http;
import 'sec-main.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  Barcode result;
  bool sideA = false;
  bool sideB = false;
  bool frontSideCheck = false;
  bool backSideCheck = false;
  String clc = "";
  String address = "";

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        validateQRCode(result.code);
      });
    });
  }

  validateQRCode(String code) async {
    ///validate back side
    var uri = Uri.dataFromString(code);

    String queryParams;
    try{
       queryParams = uri.queryParameters['c'].substring(0,3);
    }
    catch(e){
       queryParams = "";
    }

    // if(code.substring(0,3)=='OES'&&!backSideCheck){
    if(queryParams=='OES'&&!backSideCheck){
      backSideCheck = true;
      clc = Uri.decodeFull(uri.queryParameters['c']);
      if(sideA){
        sideB = true;
      }
      else{
        sideA = true;
      }
    }
    ///validate front side
    else if(code.length==34&&!frontSideCheck){
      frontSideCheck = true;
      address = code;
      if(sideA){
        sideB = true;
      }
      else{
        sideA = true;
      }
    }

    ///if both side are validated do the api validations
    if(backSideCheck&&frontSideCheck){
      await controller.pauseCamera();
      validateCard(clc);
    }
  }

  validateCard(String clc) async {
    SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(context: context, barrierDimisable:  false);
    _dialog.show(message: 'Please wait', type: SimpleFontelicoProgressDialogType.normal);
    String clcSha512 = sha512.convert(utf8.encode(clc)).toString();

    ///perform online validation
    try{
      String url = "https://api.chainlock.com/api/v1/validate/$clcSha512";
      var response = await http.get(Uri.parse(url));
      if(response.statusCode==200 || response.statusCode==201){
        var body = jsonDecode(response.body);
        print(body);

        if(body['valid']){
          print('online validation successful');
          _dialog.hide();
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => SecMain()),
          );
        }
        else{
          _dialog.hide();
          print("online validation failed");
        }

      }
      else{
        _dialog.hide();
        print(response.statusCode);
      }

    }
    catch(e){
      _dialog.hide();
      print("Error");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 150.0 : 300.0;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Check a Card',color: Colors.white,),
      ),
      body: Column(
        children: [
          Expanded(
            child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea
                ),
                onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                result!=null?Text(result.code):Text("Scanning..."),
                CheckboxListTile(
                  title: CustomText(text: 'Please scan one side of the Card',),
                    value: sideA,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (x){}
                ),
                CheckboxListTile(
                    title: CustomText(text: 'Please scan other side of the Card',color: !sideA?Colors.grey:Colors.black,),
                    value: sideB,
                    activeColor: !sideA?Colors.grey:Theme.of(context).accentColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (x){}
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
