


import 'package:flutter/cupertino.dart';

class Bannerwidget{

  showErrorBanner(BuildContext context, String title,  String message){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context){
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],

          );
        }
    );
  }
}