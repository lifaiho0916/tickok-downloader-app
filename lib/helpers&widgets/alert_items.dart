import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'custom_button.dart';
import 'custom_text.dart';
import 'styling.dart';


class CustomDialog {
  static customDialogDisplay(
    BuildContext context,
    Widget icon,
    String title,
    String description, {
    Widget? widgetItems,
    String dismissText = 'back',
    String proceedText = 'proceed',
    Color confirmColor = Colors.green,
    Color dismissColor = Colors.red,
    VoidCallback? popAction,
    bool? reverse,
    VoidCallback? callback,
  }) {
    return showDialog(
        barrierDismissible: false,
        useRootNavigator: false,
        // routeSettings: RouteSettings(),
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  // height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                
                      // CustomText(
                      //   text: title,
                      //   size: 25,
                      //   fontWeight: FontWeight.w800,
                      //   textAlign: TextAlign.center,
                      //   letterSpacing: .4,
                      //   maxLines: 3,
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      CustomText(
                        maxLines: 3,
                        text: description,
                        size: 20,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        letterSpacing: .4,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      widgetItems ??
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: 
                                  [
                                      CustomFlatButton(
                                        width: 200,
                                        callback: popAction ?? () => Navigator.pop(context),
                                        text: dismissText,
                                        textColor: white,
                                        iconColor: white,
                                        icon: Icons.cancel,
                                        fontSize: 16,
                                        color:reverse == true?Colors.green: Colors.red,
                                        iconSize: 26,
                                        radius: 25,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomFlatButton(
                                        width: 200,
                                        color:reverse == true?Colors.red: Colors.green,
                                        fontSize: 16,
                                        callback: callback ?? () => print('ppcdc'),
                                        text: proceedText,
                                        icon: Icons.check,
                                        textColor: white,
                                        iconColor: white,
                                        iconSize: 26,
                                        radius: 25,
                                      )
                                    ],
                            ),
                          )
                    ],
                  )),
            ),
          );
        });
  }
}

