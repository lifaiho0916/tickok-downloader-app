//import 'dart:async';
//import 'dart:developer';
import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:video_player/video_player.dart';

import 'models/chewie_model.dart';
//var myMainState;

List<File> listFiles = [];
File file = File('');
List<FileSystemEntity> filesPresent = [];
int currPlayIndex = 0;
bool isPlaying = false;
String currentTime = "0:00:00";
String completeTime = "0:00:00";
bool playerIsOpen = false;
bool rightDir = false;
bool showDir = false;
bool stillPressing = false;
// ignore: prefer_typing_uninitialized_variables
var theState;
List<ChewieModel> chewies = [];

class TkScroller extends StatefulWidget {
  const TkScroller({
    Key? key,
  }) : super(key: key);

  @override
  State<TkScroller> createState() => _TkScrollerState2();
}

class _TkScrollerState2 extends State<TkScroller>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;

  SwiperController swipecontroller = SwiperController();

  bool _showControl = false;

  double currentvolume = 10;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  List<File> listFiles2 = [];
  late File lastfile;
  final Controller tikTokScrController = Controller();
  final List<Color> colors = <Color>[Colors.red, Colors.blue, Colors.green];
  PageController? _pageController;
  int pageIndex = 0;
  @override
  void initState() {
    _showControl = false;
    // lastfile = listFiles.last;

    playerIsOpen = true;
    currentTime = "0:00:00";
    completeTime = "0:00:00";
    super.initState();
    _controller = AnimationController(vsync: this);
    _pageController = PageController(initialPage: 0);
    _pageController!.addListener(() {
      print(pageIndex);
    });

    initialize();
    // initializePlayer();
    // initializeFirst();
  }

  @override
  void dispose() {
    _controller.dispose();

    currPlayIndex = 0;
    theState = null;
    isPlaying = false;
    currentTime = "0:00:00";
    completeTime = "0:00:00";
    playerIsOpen = false;
    //dispose the listeners
    tikTokScrController.disposeListeners();
    _pageController!.dispose();
    super.dispose();
  }

  Widget customContr() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            //onHorizontalDragStart: ff,
            child: SizedBox(
          width: MediaQuery.of(context).size.width,
          //  height: 80,
          child: SliderTheme(
            data: const SliderThemeData(
              thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 6,
                  pressedElevation: 4,
                  elevation: 2,
                  disabledThumbRadius: 2),
              trackHeight: 4,
              thumbColor: Color(0XFFEED9DE), //Color(0xfffe2c55),
              inactiveTrackColor: Colors.transparent, //Colors.white
              activeTrackColor: Color(0XFFEED9DE), //Color(0xfffe2c55),
              overlayColor: Color(0XFFEED9DE), //Color(0xfffe2c55),
            ),
            child: Slider(
                autofocus: true,
                thumbColor: Colors.transparent,
                value: //_position != null?
                    chewies[currPlayIndex]
                                .chewie
                                .controller
                                .videoPlayerController
                                .value
                                .position
                                .inMilliseconds
                                .toDouble() >
                            chewies[currPlayIndex]
                                .chewie
                                .controller
                                .videoPlayerController
                                .value
                                .duration
                                .inMilliseconds
                                .toDouble()
                        ? 0.0
                        : chewies[currPlayIndex]
                            .chewie
                            .controller
                            .videoPlayerController
                            .value
                            .position
                            .inMilliseconds
                            .toDouble()
                //: 0.0
                ,
                min: 0.0,
                max: chewies[currPlayIndex]
                    .chewie
                    .controller
                    .videoPlayerController
                    .value
                    .duration
                    .inMilliseconds
                    .toDouble(),
                label:
                    '${chewies[currPlayIndex].chewie.controller.videoPlayerController.value.position.inHours > 0 ? "${chewies[currPlayIndex].chewie.controller.videoPlayerController.value.position.inHours}:" : "x:"}${chewies[currPlayIndex].chewie.controller.videoPlayerController.value.position.inMinutes > 0 ? "${chewies[currPlayIndex].chewie.controller.videoPlayerController.value.position.inMinutes}:" : "xx:"}${chewies[currPlayIndex].chewie.controller.videoPlayerController.value.position.inSeconds > 0 ? "${chewies[currPlayIndex].chewie.controller.videoPlayerController.value.position.inSeconds}:" : "xxx"}',
                onChanged: (double value) async {
                  await chewies[currPlayIndex]
                      .chewie
                      .controller
                      .videoPlayerController
                      .seekTo(Duration(milliseconds: value.toInt()));

                  //_position = Duration(milliseconds: value.toInt());
                },
                onChangeStart: (double value) async {
                  setState(() {
                    //_showControl2 = true;
                  });
                },
                onChangeEnd: (double value) async {
                  setState(() {
                    //_showControl2 = false;
                  });
                }),
          ),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    theState = setState;
    if (theState != null) {
      theState(() {});
    }

    //myMainState=setState;
    return Scaffold(
      // backgroundColor: Colors.black12,
      body:

          // PageView(
          //     scrollDirection: Axis.vertical,
          //     controller: _pageController,
          //     onPageChanged: (val) {
          //       pageIndex = val;
          //       setState(() {});
          //     },
          //     children: colors
          //         .map((e) => Container(
          //               color: colors[colors.indexOf(e)],
          //               child: Center(
          //                 child: GestureDetector(
          //                   onTap: () {
          //                     tikTokScrController.jumpToPosition(01);
          //                     _pageController!.jumpToPage(1);
          //                     print('object');
          //                   },
          //                   child: Text(
          //                     '${colors.indexOf(e)}',
          //                     style: const TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
          //                   ),
          //                 ),
          //               ),
          //             ))
          //         .toList())

          TikTokStyleFullPageScroller(
        contentSize: colors.length,
        swipePositionThreshold: 0.2,
        // ^ the fraction of the screen needed to scroll
        swipeVelocityThreshold: 2000,
        // ^ the velocity threshold for smaller scrolls
        animationDuration: const Duration(milliseconds: 400),
        // ^ how long the animation will take
        controller: tikTokScrController,
        // ^ registering our own function to listen to page changes
        builder: (BuildContext context, int index) {
          return Container(
            color: colors[index],
            child: Center(
              child: GestureDetector(
                onTap: () {
                  tikTokScrController.jumpToPosition(01);
                  print('object');
                },
                child: Text(
                  '$index',
                  style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),

      // PageView.builder(
      //   scrollDirection: Axis.vertical,
      //   itemCount: chewies.length,
      //   controller: PageController(initialPage: currPlayIndex),

      //   onPageChanged: (i) async {
      //     if (chewies.isNotEmpty && chewies.length > currPlayIndex) {
      //       chewies[currPlayIndex].chewie.controller.videoPlayerController.pause();
      //       // Fluttertoast.showToast(msg: 'length 3');
      //     }
      //     currPlayIndex = i;
      //     if (chewies.isNotEmpty && chewies.length > currPlayIndex && !chewies[currPlayIndex].chewie.controller.videoPlayerController.value.isInitialized) {
      //       await chewies[currPlayIndex].chewie.controller.videoPlayerController.initialize();
      //     }
      //     if (chewies.isNotEmpty && chewies.length > currPlayIndex) {
      //       chewies[currPlayIndex].chewie.controller.videoPlayerController.play();
      //     }
      //     setState(() {});
      //     //}
      //   }, //toggleVideo,//onIndexChanged: toggleVideo,

      //   itemBuilder: (BuildContext context, int index) {
      //     return Stack(
      //       children: [
      //         GestureDetector(
      //           //onDoubleTapDown:(x){debugPrint('Direction: ${x.globalPosition.direction}');},
      //           onDoubleTapDown: (x) {
      //             rightDir = x.localPosition.dx >= 180;
      //           },
      //           onDoubleTap: () async {
      //             //debugPrint('Direction: $rightDir');
      //             showDir = true;
      //             setState(() {});
      //             if (rightDir) {
      //               chewies[index]
      //                   .chewie
      //                   .controller
      //                   .videoPlayerController
      //                   .seekTo(chewies[index].chewie.controller.videoPlayerController.value.position + const Duration(seconds: 10));
      //             } else {
      //               chewies[index]
      //                   .chewie
      //                   .controller
      //                   .videoPlayerController
      //                   .seekTo(chewies[index].chewie.controller.videoPlayerController.value.position - const Duration(seconds: 10));
      //             }
      //             await Future.delayed(const Duration(milliseconds: 600), () {
      //               showDir = false;
      //               setState(() {});
      //             });
      //           },
      //           onLongPressDown: (x) {
      //             rightDir = x.localPosition.dx >= 180;
      //           },
      //           onLongPressMoveUpdate: (x) async {
      //             showDir = true;
      //             setState(() {});
      //             //while(stillPressing){
      //             if (rightDir) {
      //               chewies[index]
      //                   .chewie
      //                   .controller
      //                   .videoPlayerController
      //                   .seekTo(chewies[index].chewie.controller.videoPlayerController.value.position + const Duration(seconds: 10));
      //             } else {
      //               chewies[index]
      //                   .chewie
      //                   .controller
      //                   .videoPlayerController
      //                   .seekTo(chewies[index].chewie.controller.videoPlayerController.value.position - const Duration(seconds: 10));
      //             }
      //             //}
      //             await Future.delayed(const Duration(milliseconds: 1000), () {
      //               showDir = false;
      //               setState(() {});
      //             });
      //           },

      //           onTap: () {
      //             setState(() {
      //               _showControl = !_showControl;
      //               //isPlaying=!isPlaying;
      //               chewies[index].chewie.controller.videoPlayerController.seekTo(
      //                   chewies[index].chewie.controller.videoPlayerController.value.position.inMilliseconds.toDouble() >
      //                           chewies[index].chewie.controller.videoPlayerController.value.duration.inMilliseconds.toDouble()
      //                       ? const Duration(seconds: 0)
      //                       : chewies[index].chewie.controller.videoPlayerController.value.position);
      //               if (!chewies[index].chewie.controller.videoPlayerController.value.isPlaying) {
      //                 chewies[index].chewie.controller.videoPlayerController.play();
      //               } else {
      //                 chewies[index].chewie.controller.videoPlayerController.pause();
      //                 // Fluttertoast.showToast(msg: 'length 4');
      //               }
      //             });
      //           },
      //           child: chewies.isEmpty || chewies.length < index || !chewies[index].chewie.controller.videoPlayerController.value.isInitialized
      //               ? const Center(
      //                   child: CircularProgressIndicator(
      //                     color: Colors.white,
      //                   ),
      //                 )
      //               : Stack(children: [
      //                   chewies[index].chewie,
      //                   if (!chewies[index].chewie.controller.videoPlayerController.value.isPlaying)
      //                     const Center(child: Icon(Icons.play_arrow, size: 80, color: Colors.white)),
      //                   Center(
      //                       child: Row(
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           mainAxisAlignment: showDir && !rightDir ? MainAxisAlignment.start : MainAxisAlignment.end,
      //                           mainAxisSize: MainAxisSize.max,
      //                           children: [
      //                         if (showDir && !rightDir) ...[
      //                           const Icon(Icons.keyboard_double_arrow_left, size: 35, color: Colors.white),
      //                           const Text('10 sec', style: TextStyle(fontSize: 14, color: Colors.white))
      //                         ],
      //                         if (showDir && rightDir)
      //                           ...[
      //                             Transform(
      //                                 alignment: Alignment.center,
      //                                 transform: Matrix4.rotationY(math.pi),
      //                                 child: const Icon(
      //                                   Icons.keyboard_double_arrow_left,
      //                                   size: 35,
      //                                   color: Colors.white,
      //                                 )),
      //                             const Text('10 sec', style: TextStyle(fontSize: 14, color: Colors.white))
      //                           ].reversed.toList()
      //                       ]))
      //                 ]),
      //         ),
      //         if (chewies.isNotEmpty && chewies.length > index && chewies[index].chewie.controller.videoPlayerController.value.isInitialized)
      //           Align(alignment: Alignment.center, child: customContr()),
      //       ],
      //     );
      //   },
      // ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  initialize() {
    tikTokScrController.addListener((event) {
      print(event.pageNo);
    });

    if (_pageController!.hasClients) {
      _pageController!.jumpToPage(2);
    }
    // if (tikTokScrController.feedback!.hasListener) {

    // }
    Future.delayed(Duration(microseconds: 100)).whenComplete(() {
      tikTokScrController.jumpToPosition(2);
      if (_pageController!.hasClients) {
        _pageController!.jumpToPage(2);
        tikTokScrController.jumpToPosition(2);
      }
      // Fluttertoast.showToast(msg: 'msg');
    });
    // if(tikTokScrController.)

    // print(tikTokScrController.feedback.)
  }
}

//(controller: chewieController)

void initializePlayer([int index = 0, bool playIndexVideo = false]) async {
//for(var chewie in chewies){chewie.controller.videoPlayerController.dispose();}
  // Fluttertoast.showToast(msg: '${listFiles.length}');
  // theState(() {
  stillPressing = true;
  // });
  print(chewies);
  for (var chewie in chewies) {
    await chewie.chewie.controller.videoPlayerController.dispose();
    chewie.chewie.controller.dispose();
  }
  Timer.periodic(const Duration(milliseconds: 100), (timer) {
    if (playerIsOpen && theState != null) {
      theState(() {});
    }
  });
  chewies.clear();

  for (var file in listFiles) {
    String id = file.path.substring(
        file.path.lastIndexOf('_') + 1, file.path.lastIndexOf('.mp4'));
    try {
      chewies.add(
        ChewieModel(
            chewie: await () async {
              var ctrl2 = Chewie(
                  controller: await () async {
                var ctrl1 = ChewieController(
                    videoPlayerController: await () async {
                      var ctrl = VideoPlayerController.file(file);
                      await ctrl.initialize();
                      await ctrl.pause();
                      // await ctrl.dispose();
                      return ctrl;
                    }.call(),
                    autoInitialize: true,
                    showControls: false,
                    zoomAndPan: true, //false
                    showControlsOnInitialize: false,
                    autoPlay: true //false//
                    );
                await ctrl1.pause();
                // await ctrl1.in
                return ctrl1;
              }.call());
              // await ctrl2.controller.i
              await ctrl2.controller.pause();
              print('autoplay  is ${ctrl2.controller.autoPlay}');
              return ctrl2;
            }.call(),
            id: id),
      );
    } catch (e) {
      print(e.toString());
    }
  }
  // Future.delayed(Duration(seconds: 400)).whenComplete(() {});
  // Fluttertoast.showToast(msg: 'FilesNum:${listFiles.length}:${chewies.length}');
  debugPrint('FilesNum:${listFiles.length}:${chewies.length}');
  debugPrint(listFiles
      .expand((element) => {element.path})
      .join(',')
      .replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', '')
      .split(',')
      .toList()
      .where((element) => !chewies
          .expand((element) =>
              {element.chewie.controller.videoPlayerController.dataSource})
          .contains(element))
      .join(','));

  // if (theState != null) {
  //   theState(() {
  stillPressing = false;
  // });
  // }
}
