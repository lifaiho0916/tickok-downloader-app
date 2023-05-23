//import 'dart:async';
//import 'dart:developer';
import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_app/helpers&widgets/custom_text.dart';
import 'package:new_app/helpers&widgets/styling.dart';
import 'package:new_app/thumbnails_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:tiktoklikescroller/controller.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:video_player/video_player.dart';

import 'models/chewie_model.dart';
import 'models/custom_track.dart';

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
bool stillPressing = true;
// ignore: prefer_typing_uninitialized_variables
var theState;
List<ChewieModel> chewies = [];

class VideoViewer extends StatefulWidget {
  final File? currentFile;

  final Map<String, Uint8List?> thumbnailBytes;

  const VideoViewer({
    Key? key,
    this.currentFile,
    required this.thumbnailBytes,
  }) : super(key: key);

  @override
  State<VideoViewer> createState() => _VideoViewer();
}

class _VideoViewer extends State<VideoViewer>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;

  SwiperController swipecontroller = SwiperController();

  bool _showControl = false;

  double currentvolume = 10;

  //current file
  File? currentFile;
  VideoPlayerController? currentFileVideoPcontroller;
  ChewieController? currentFileVideoCcontroller;
  Chewie? chewie;
  String? duration;

//previous file
  File? previousFile;
  VideoPlayerController? previousFileVideoPcontroller;
  ChewieController? previousFileVideoCcontroller;
  Chewie? previouschewie;

//next file
  Size? size;
  double? deviceRatio;
  final Controller controller = Controller();
  bool permStatus = false;
  String _localPath =
      "/storage/emulated/0/Documents/Gorilla TikTok Downloader/";

  // ...addListener((event) {
  //   _handleCallbackEvent(event.direction, event.success);
  // });
  bool loadingNext = true;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  List<File> listFiles2 = [];
  late File lastfile;
  double videoContainerRatio = 0.5;

  PageController? _pageController;
  int _selectedIndex = 0;
  bool hideControlls = false;
  String valOnScroll = '';

  @override
  void initState() {
    _showControl = false;
    lastfile = listFiles.last;
// pageController.
    // print(listFiles.where((element) => element.path == widget.currentFile!.path ? true : false).first.path);
    // listFiles.indexOf(element)
    // Fluttertoast.showToast(
    //     msg: listFiles.indexOf(File(listFiles.where((element) => element.path == widget.currentFile!.path ? true : false).first.path)).toString());
    _pageController = PageController(
        keepPage: true, initialPage: listFiles.indexOf(widget.currentFile!));
    _pageController!.addListener(() {
      currPlayIndex = _pageController!.page!.toInt();

      if (_pageController!.page == currPlayIndex) {
        print(currPlayIndex);
        setState(() {
          hideControlls = false;
        });
        valOnScroll = '';
      } else {
        if (hideControlls == false) {
          print('object');
          setState(() {
            hideControlls = true;
          });
        }
      }
    });
    initializeVideo();

    playerIsOpen = true;
    currentTime = "0:00:00";
    completeTime = "0:00:00";
    super.initState();
    _controller = AnimationController(vsync: this);
    // initializePlayer();
    // initializeFirst();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController!.dispose();
    currentFileVideoPcontroller!
        .dispose()
        .whenComplete(() => currentFileVideoCcontroller!.dispose());
    controller.disposeListeners();
    currPlayIndex = 0;
    theState = null;
    isPlaying = false;
    currentTime = "0:00:00";
    completeTime = "0:00:00";
    playerIsOpen = false;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    theState = setState;
    if (theState != null) {
      theState(() {});
    }
    size = MediaQuery.of(context).size;
    deviceRatio = size!.width /
        ((size!.height - MediaQuery.of(context).viewPadding.top) - 0);
    //  final scale = 1 / (currentFileVideoPcontroller!.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
    // final mediaSize = MediaQuery.of(context).size;
    // final scale = 1 / (currentFileVideoPcontroller!.value.aspectRatio * mediaSize.aspectRatio);

    //myMainState=setState;
    return SafeArea(
      // bottom: true,
      child: Scaffold(
        extendBody: false,
        // appBar: AppBar(
        //   toolbarHeight: 0,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: black,
        // ),
        bottomNavigationBar: BottomAppBar(
          height: 0,
          child: Container(
            color: black,
          ),
        ),
        backgroundColor: Colors.black12,
        body: Container(
          // height: MediaQuery.of(context).size.height - (0+12),
          child: PageView.builder(
            padEnds: false,
            scrollDirection: Axis.vertical,
            itemCount: listFiles.length,
            controller: _pageController,
            onPageChanged: (i) async {
              currentFile = listFiles[i];
              currPlayIndex = i;
              initializeVideo();
            },
            //toggleVideo,//onIndexChanged: toggleVideo,

            itemBuilder: (BuildContext context, int index) {
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  GestureDetector(
                    //onDoubleTapDown:(x){debugPrint('Direction: ${x.globalPosition.direction}');},
                    onDoubleTapDown: (x) {
                      rightDir = x.localPosition.dx >= 180;
                    },
                    onDoubleTap: () async {
                      //debugPrint('Direction: $rightDir');
                      showDir = true;
                      setState(() {});
                      if (rightDir) {
                        currentFileVideoPcontroller!.seekTo(
                            currentFileVideoPcontroller!.value.position +
                                const Duration(seconds: 10));
                      } else {
                        currentFileVideoPcontroller!.seekTo(
                            currentFileVideoPcontroller!.value.position -
                                const Duration(seconds: 10));
                      }
                      await Future.delayed(const Duration(milliseconds: 600),
                          () {
                        showDir = false;
                        setState(() {});
                      });
                    },
                    onLongPressDown: (x) {
                      rightDir = x.localPosition.dx >= 180;
                    },
                    onLongPressMoveUpdate: (x) async {
                      print('moving');
                      showDir = true;
                      setState(() {});
                      //while(stillPressing){
                      if (rightDir) {
                        currentFileVideoPcontroller!.seekTo(
                            currentFileVideoPcontroller!.value.position +
                                const Duration(seconds: 10));
                      } else {
                        currentFileVideoPcontroller!.seekTo(
                            currentFileVideoPcontroller!.value.position -
                                const Duration(seconds: 10));
                      }
                      //}
                      await Future.delayed(const Duration(milliseconds: 1000),
                          () {
                        showDir = false;
                        setState(() {});
                      });
                    },

                    onTap: () {
                      setState(() {
                        _showControl = !_showControl;
                        //isPlaying=!isPlaying;
                        currentFileVideoPcontroller!.seekTo(
                            currentFileVideoPcontroller!
                                        .value.position.inMilliseconds
                                        .toDouble() >
                                    currentFileVideoPcontroller!
                                        .value.duration.inMilliseconds
                                        .toDouble()
                                ? const Duration(seconds: 0)
                                : currentFileVideoPcontroller!.value.position);
                        if (!currentFileVideoPcontroller!.value.isPlaying) {
                          currentFileVideoPcontroller!.play();
                        } else {
                          currentFileVideoPcontroller!.pause();
                          // Fluttertoast.showToast(msg: 'length 4');
                        }
                      });
                    },
                    child: chewie == null
                        ? Center(
                            child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            child:
                                // widget.thumbnailBytes[listFiles[index].path.replaceAll('/storage/emulated/0/Download/New App/', '')] == null
                                //     ? Container()
                                //     :
                                Image.file(
                              File(
                                  '/storage/emulated/0/Download/Gorilla TikTok Downloader/thumbnails/${listFiles[index].path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', '').replaceAll('.mp4', '.jpeg')}'),
                              // widget.thumbnailBytes[listFiles[index].path.replaceAll('/storage/emulated/0/Download/New App/', '')]!,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ))
                        : Stack(fit: StackFit.passthrough, children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                              child:

                                  // widget.thumbnailBytes[listFiles[index].path.replaceAll('/storage/emulated/0/Download/New App/', '')] == null
                                  //     ? Container()
                                  //     :

                                  Image.file(
                                File(
                                    '/storage/emulated/0/Download/Gorilla TikTok Downloader/thumbnails/${listFiles[index].path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', '').replaceAll('.mp4', '.jpeg')}'),
                                // widget.thumbnailBytes[listFiles[index].path.replaceAll('/storage/emulated/0/Download/New App/', '')]!,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            if (currentFile == listFiles[index])
                              FadeIn(
                                curve: Curves.easeIn,
                                duration: Duration(milliseconds: 500),
                                child: Container(
                                  color: Colors.black,
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0.0),
                                    child: Transform.scale(
                                      scale: currentFileVideoPcontroller!
                                              .value.aspectRatio /
                                          deviceRatio!,
                                      child: AspectRatio(
                                        aspectRatio:
                                            currentFileVideoPcontroller!
                                                .value.aspectRatio,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: chewie!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (!currentFileVideoPcontroller!.value.isPlaying)
                              Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black38,
                                        shape: BoxShape.circle),
                                    padding: EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      'images/icons/play-fill.svg',
                                      semanticsLabel: 'Acme Logo',
                                      color: white,
                                      height: 60,
                                      width: 60,
                                    )),
                              ),
                            Center(
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: showDir && !rightDir
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                  if (showDir && !rightDir) ...[
                                    const Icon(Icons.keyboard_double_arrow_left,
                                        size: 35, color: Colors.white),
                                    const Text('10 sec',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white))
                                  ],
                                  if (showDir && rightDir)
                                    ...[
                                      Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.rotationY(math.pi),
                                          child: const Icon(
                                            Icons.keyboard_double_arrow_left,
                                            size: 35,
                                            color: Colors.white,
                                          )),
                                      const Text('10 sec',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white))
                                    ].reversed.toList()
                                ]))
                          ]),
                  ),
                  // if (chewies.isNotEmpty && chewies.length > index && currentFileVideoPcontroller!.value.isInitialized)

                  (currentFile != listFiles[index]) || hideControlls == true
                      ? Container(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                        )
                      : Align(
                          alignment: Alignment.center,
                          child: FadeIn(
                              curve: Curves.easeIn,
                              duration: Duration(microseconds: 100),
                              child: customContr())),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  initializeVideo() async {
    setState(() {
      loadingNext = true;
    });

    if (currentFileVideoPcontroller != null) {
      await currentFileVideoPcontroller!.dispose().whenComplete(() {});
    }

    // currentFileVideoCcontroller!.dispose();
    currentFile ??= widget.currentFile;
    currentFileVideoPcontroller =
        VideoPlayerController.file(currentFile ?? widget.currentFile!);
    // Fluttertoast.showToast(msg: controller.)
    await currentFileVideoPcontroller!.initialize();
    currentFileVideoPcontroller!.addListener(() {
      // print(currentFileVideoPcontroller!.value.position.inMilliseconds);
      duration = printDuration(Duration(
          milliseconds:
              currentFileVideoPcontroller!.value.position.inMilliseconds));
      // print(printDuration(Duration(milliseconds: currentFileVideoPcontroller!.value.position.inMilliseconds)));
      setState(() {});
    });
    // await currentFileVideoPcontroller!.pause();

    currentFileVideoCcontroller = ChewieController(
        videoPlayerController: currentFileVideoPcontroller!,
        autoInitialize: true,
        showOptions: false,
        allowFullScreen: true,
        showControls: false,
        // customControls: customContr(),
        // fullScreenByDefault: true,
        // aspectRatio: currentFileVideoPcontroller!.value.aspectRatio,
        looping: true,
        zoomAndPan: true,
        //false
        showControlsOnInitialize: false,
        autoPlay: true);
    chewie = Chewie(controller: currentFileVideoCcontroller!);
    // await chewie!.controller.pause();
    currentFileVideoPcontroller!.play();
    Future.delayed(Duration(milliseconds: 300)).whenComplete(() {
      setState(() {
        loadingNext = false;
      });
    });
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success,
      {int? currentIndex}) {
    print(
        "Scroll callback received with data: {direction: $direction, success: $success and index: ${currentIndex ?? 'not given'}}");

    currentFile = listFiles[currentIndex!];
    initializeVideo();
  }

  Widget customContr({bool transparent = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: duration ?? '0:00',
                color: transparent == true ? Colors.transparent : white,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              //onHorizontalDragStart: ff,
              child: SizedBox(
            width: MediaQuery.of(context).size.width,
            //  height: 80,
            child: SliderTheme(
              data: SliderThemeData(
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 6,
                    pressedElevation: 2,
                    elevation: 1,
                    disabledThumbRadius: 2),
                trackHeight: 1,
                trackShape: CustomTrackShape(),
                overlayShape: SliderComponentShape.noOverlay,
                thumbColor:
                    transparent == true ? Colors.transparent : selectionColor,
                //Color(0xfffe2c55),
                inactiveTrackColor: transparent == true
                    ? Colors.transparent
                    : Colors.transparent,
                //Colors.white
                activeTrackColor:
                    transparent == true ? Colors.transparent : selectionColor,
                //Color(0xfffe2c55),
                overlayColor:
                    transparent == true ? Colors.transparent : selectionColor,
              ),
              child: Slider(
                  autofocus: true,
                  // thumbColor: Colors.transparent,
                  value: //_position != null?
                      currentFileVideoPcontroller!.value.position.inMilliseconds
                                  .toDouble() >
                              currentFileVideoPcontroller!
                                  .value.duration.inMilliseconds
                                  .toDouble()
                          ? 0.0
                          : currentFileVideoPcontroller!
                              .value.position.inMilliseconds
                              .toDouble()
                  //: 0.0
                  ,
                  min: 0.0,
                  max: currentFileVideoPcontroller!
                      .value.duration.inMilliseconds
                      .toDouble(),
                  label:
                      '${currentFileVideoPcontroller!.value.position.inHours > 0 ? "${currentFileVideoPcontroller!.value.position.inHours}:" : "x:"}${currentFileVideoPcontroller!.value.position.inMinutes > 0 ? "${currentFileVideoPcontroller!.value.position.inMinutes}:" : "xx:"}${currentFileVideoPcontroller!.value.position.inSeconds > 0 ? "${currentFileVideoPcontroller!.value.position.inSeconds}:" : "xxx"}',
                  onChanged: (double value) async {
                    await currentFileVideoPcontroller!
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
      ),
    );
  }

  double getScale() {
    double videoRatio = currentFileVideoPcontroller!.value.aspectRatio;

    if (videoRatio < videoContainerRatio) {
      ///for tall videos, we just return the inverse of the controller aspect ratio
      return videoContainerRatio / videoRatio;
    } else {
      ///for wide videos, divide the video AR by the fixed container AR
      ///so that the video does not over scale

      return videoRatio / videoContainerRatio;
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

//(controller: chewieController)

// void initializePlayer([int index = 0, bool playIndexVideo = false]) async {
// //for(var chewie in chewies){chewie.controller.videoPlayerController.dispose();}
//   // Fluttertoast.showToast(msg: '${listFiles.length}');
//   // theState(() {
//   stillPressing = true;
//   // });
//   print(chewies);
//   for (var chewie in chewies) {
//     await chewie.chewie.controller.videoPlayerController.dispose();
//     chewie.chewie.controller.dispose();
//   }
//   Timer.periodic(const Duration(milliseconds: 100), (timer) {
//     if (playerIsOpen && theState != null) {
//       theState(() {});
//     }
//   });
//   chewies.clear();

//   for (var file in listFiles) {
//     String id = file.path.substring(file.path.lastIndexOf('_') + 1, file.path.lastIndexOf('.mp4'));
//     try {
//       chewies.add(
//         ChewieModel(
//             chewie: await () async {
//               var ctrl2 = Chewie(
//                   controller: await () async {
//                 var ctrl1 = ChewieController(
//                     videoPlayerController: await () async {
//                       var ctrl = VideoPlayerController.file(file);
//                       await ctrl.initialize();
//                       await ctrl.pause();
//                       // await ctrl.dispose();
//                       return ctrl;
//                     }.call(),
//                     autoInitialize: true,
//                     showControls: false,
//                     zoomAndPan: true, //false
//                     showControlsOnInitialize: false,
//                     autoPlay: true //false//
//                     );
//                 await ctrl1.pause();
//                 // await ctrl1.in
//                 return ctrl1;
//               }.call());
//               // await ctrl2.controller.i
//               await ctrl2.controller.pause();
//               print('autoplay  is ${ctrl2.controller.autoPlay}');
//               return ctrl2;
//             }.call(),
//             id: id),
//       );
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//   debugPrint('FilesNum:${listFiles.length}:${chewies.length}');
//   debugPrint(listFiles
//       .expand((element) => {element.path})
//       .join(',')
//       .replaceAll('/storage/emulated/0/Download/New App/', '')
//       .split(',')
//       .toList()
//       .where((element) => !chewies.expand((element) => {element.chewie.controller.videoPlayerController.dataSource}).contains(element))
//       .join(','));

//   // if (theState != null) {
//   //   theState(() {
//   stillPressing = false;
//   // });
//   // }
// }

// class _MediaSizeClipper extends CustomClipper<Rect> {
//   final Size mediaSize;
//   const _MediaSizeClipper(this.mediaSize);
//   @override
//   Rect getClip(Size size) {
//     return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
//   }
//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) {
//     return true;
//   }
// }
