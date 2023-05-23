// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_app/helpers&widgets/styling.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';

class CustomFlatButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final VoidCallback callback;
  final double? height;
  final double? width;
  final double? radius;
  final double? iconSize;
  final bool? verifying;
  final bool isSpinner;
  final bool isDisabled;
  final IconData? icon;
  final double? fontSize;
  final double? elevation;

  const CustomFlatButton(
      {Key? key,
      this.text,
      this.isSpinner = false,
      this.isDisabled = false,
      this.color,
      required this.callback,
      this.textColor,
      this.height,
      this.width,
      this.radius,
      this.icon,
      this.fontSize,
      this.iconColor,
      this.iconSize,
      this.verifying = false,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var themeVal = context.read<ThemeModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 4),
        elevation: elevation ?? 1,
        height: height ?? 50,
        minWidth: width ?? 200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 3))),
        onPressed:
        (isDisabled)?null:
        verifying == true
            ? () {
                Fluttertoast.showToast(msg: 'Please wait');
              }
            : callback,
        color: color ?? Colors.blue,
        disabledColor: Colors.grey,
        child: Container(
          width: width ?? 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSpinner)
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                        strokeWidth: 3, color: Colors.white),
                  ),
                ),

              // icon == null
              //     ? SizedBox.shrink()
              //     : Icon(
              //         icon,
              //         size: iconSize ?? 17,color: white,
              //       ),
              // icon == null
              //     ? SizedBox.shrink()
              //     : SizedBox(
              //         width: 0,
              //       ),
              Expanded(

                child: verifying == true
                    ? Container(
                        height: 14,
                        child: SpinKitChasingDots(color: white, size: 14))
                    : Padding(
                    padding: EdgeInsets.only(right: (isSpinner)?20:0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: CustomText(
                            text: (isSpinner)? 'Preparing...': text == null ? 'action' : text!,
                            color: textColor ??
                                (MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                    ? white
                                    : white),
                            size: fontSize,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
