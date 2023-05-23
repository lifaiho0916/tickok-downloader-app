import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color? color;
  const Loading({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    // _getThingsOnStartup(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      color: Colors.black.withOpacity(.4),
      child: Container(
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(0)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SpinKitSpinningLines(
            color: Theme.of(context).backgroundColor,
            lineWidth: 4,
          ),
        ),
      ),
    );
  }
}

class Loading2 extends StatelessWidget {
  final Color? color;
  const Loading2({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    // _getThingsOnStartup(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      color: Color(0xffffffff),
      child: Container(
        // decoration: BoxDecoration(color:color?? Colors.white, borderRadius: BorderRadius.circular(0)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 100.0,horizontal: 20.0),
                child: Image.asset("images/Gorilla-Downloader.png"),
              ),
              CircularProgressIndicator(color: Color(0x80ee1d52)),
            ],
          ),
        ),
      ),
    );
  }
}
