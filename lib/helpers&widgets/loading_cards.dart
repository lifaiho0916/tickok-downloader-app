import 'package:flutter/material.dart';

import 'package:skeleton_text/skeleton_text.dart';
import 'package:provider/provider.dart';

class LoadingFeaturedCard extends StatelessWidget {
  final Color? color;
  const LoadingFeaturedCard({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
        child: Container(
            margin: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: color ?? Colors.purple, borderRadius: BorderRadius.circular(5))));
  }
}

class LoadingCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  const LoadingCard({Key? key, required this.height, this.width, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: SkeletonAnimation(
        child: Container(
          decoration: BoxDecoration(color: color ?? Colors.purple, borderRadius: BorderRadius.circular(5)),
          height: height,
          width: width ?? MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
