import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_app/helpers&widgets/styling.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final double? letterSpacing;
  final double? wordSpacing;
  final Color? color;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final String? fontFam;
  final FontStyle? fontStyle;
  const CustomText(
      {Key? key,
      @required this.text,
      this.size,
      this.color,
      this.fontWeight,
      this.letterSpacing,
      this.wordSpacing,
      this.overflow,
      this.maxLines,
      this.textAlign,
      this.textDecoration,
      this.fontFam,
      this.fontStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',  softWrap: false,
      textAlign: textAlign,
      maxLines: maxLines ??20,
      overflow: overflow ?? TextOverflow.visible,
      style: TextStyle(
        fontStyle: fontStyle,
        decoration: textDecoration ?? TextDecoration.none,
        fontSize: size,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: letterSpacing ?? 0,
        wordSpacing: wordSpacing ?? 0,
        // fontFamily: Theme.of(context).textTheme.subtitle1!.fontFamily,
      ),
    );
  }
}

class CartItemRich extends StatelessWidget {
  final String? lightFont;
  final String? thirdText;
  final String? boldFont;
  final double? lightFontSize;
  final double? boldFontSize;
  final double? letterSpacing;
  final Color? lightColor;
  final Color? boldColor;
  final TextAlign? textAlign;
  final int? maxlines;

  final LongPressGestureRecognizer? longPressGestureRecognizer;
  final VoidCallback? callback;
  const CartItemRich(
      {Key? key,
      this.lightFont,
      this.thirdText,
      this.boldFont,
      this.lightFontSize,
      this.boldFontSize,
      this.letterSpacing,
      this.longPressGestureRecognizer,
      this.callback,
      this.lightColor,
      this.boldColor,this.maxlines,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxlines??5,
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(children: [
        TextSpan(
            text: lightFont,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.subtitle1!.fontFamily,
              color: lightColor ?? Theme.of(context).textTheme.subtitle1!.color,
              fontSize: lightFontSize ?? 13,
              fontWeight: FontWeight.w500,
            )),
        TextSpan(
            recognizer: TapGestureRecognizer()..onTap = callback,
            text: boldFont,
            style: TextStyle(
                fontFamily: Theme.of(context).textTheme.subtitle1!.fontFamily,
                color: callback != null ? primaryBlue : boldColor ?? Theme.of(context).textTheme.subtitle1!.color,
                fontSize: boldFontSize ?? 15,
                fontWeight: FontWeight.w600,
                letterSpacing: letterSpacing,
                decoration: callback != null ? TextDecoration.underline : TextDecoration.none)),
        // TextSpan(
        //     text: thirdText,
        //     style: TextStyle(
        //       fontFamily: Theme.of(context).textTheme.subtitle1!.fontFamily,
        //       color: lightColor ?? Theme.of(context).textTheme.subtitle1!.color,
        //       fontSize: lightFontSize ?? 13,
        //       fontWeight: FontWeight.w500,
        //     )),
      ]),
    );
  }
}
