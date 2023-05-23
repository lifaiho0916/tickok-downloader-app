import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_app/helpers&widgets/custom_text.dart';
import 'package:new_app/helpers&widgets/styling.dart';
import 'package:new_app/playvedeo.dart' as plv;
import 'package:new_app/video_viewer.dart';
import 'package:new_app/responsive/responsive.dart';
import 'package:new_app/thumbnails_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cross_file/cross_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers&widgets/custom_button.dart';

Map<String, Uint8List?> thumbnailBytes = {};

//var myMainState;
class Download extends StatefulWidget {
  const Download({
    Key? key,
  }) : super(key: key);

  @override
  State<Download> createState() => DownloadState();
}

class DownloadState extends State<Download>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin,
        WidgetsBindingObserver {
  bool isSwitched = false;

  //static const _pageSize = 2;

  bool selectall = false;
  bool showVideos = false;
  bool loading = true;
  late AnimationController _controller;
  late List<FileSystemEntity> _foldersinit = [];

  late final List<FileSystemEntity> _selectedfolders = [];
  bool permStatus = false;
  String _localPath =
      "/storage/emulated/0/Documents/Gorilla TikTok Downloader/";
  List<int> listselected = [];
  bool showCounter = true;
  ScrollController? gridScrollc;

  Timer? countdownTimer;
  int timerTime = 0;
  int lastseen = 0;
  bool isVisibleX = true;
  double opacityScroll = 1;

  // FToast? fToast;
  bool isVisible = true;
  Timer? _timer;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    gridScrollc = ScrollController(initialScrollOffset: 0);
    gridScrollc!.addListener(() {});

    // fToast = FToast();
    // fToast?.init(context);
    getDir();
    _prepareSaveDir();
    super.initState();
  }
  //
  // void _startTimer() {
  //   _timer = Timer(Duration(milliseconds: 1000), () {
  //     setState(() {
  //       isVisible = true;
  //     });
  //   });
  // }
  //
  // void _resetTimer() {
  //   if (_timer != null) {
  //     _timer!.cancel();
  //   }
  //   setState(() {
  //     isVisible = false;
  //   });
  //   _startTimer();
  // }

  @override
  void dispose() {
    _timer!.cancel();
    _controller.dispose();
    _foldersinit.clear();
    listselected.clear();
    thumbnailBytes.clear();
    _selectedfolders.clear();

    currPlayIndex = 0;
    for (var chewie in chewies) {
      chewie.chewie.controller.videoPlayerController.dispose();
      chewie.chewie.controller.dispose();
    }
    chewies.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ScrollController scrollController = ScrollController();
    //myMainState=setState;
    return Scaffold(
      // backgroundColor: black,
      body: myWidget(MediaQuery.of(context).size.width, scrollController),
    );
  }

  Widget myWidget(currentWidth, scrollController) {
    int i = getSliver(currentWidth);

    return (_foldersinit.isNotEmpty)
        ? Stack(
            children: [
              RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                onRefresh: () async {
                  // if (_foldersinit.length != thumbnailBytes.length) {
                  //   Fluttertoast.showToast(msg: 'Please wait ...');
                  // } else {
                  //   await getDir();
                  // }
                  getDir();
                },
                child: Column(
                  children: [
                    selectall == false
                        ? SizedBox.shrink()
                        : Container(
                            height: kToolbarHeight,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            // alignment: Alignment.center,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              // backgroundColor: Colors.red,
                                              onPressed: () {
                                                log("----> set State 4");
                                                //  isSwitched = !isSwitched;
                                                //  selectall = false;
                                                // if (isSwitched == true) {
                                                // } else {
                                                _selectedfolders.clear();
                                                listselected.clear();

                                                selectall = false;
                                                //}
                                                setState(() {});
                                              },
                                              icon: SvgPicture.asset(
                                                'images/icons/x-lg.svg',
                                                semanticsLabel: 'Acme Logo',
                                                color: black,
                                                height: 25,
                                                width: 25,
                                              )

                                              // ignore: deprecated_member_use
                                              //     const Icon(
                                              //   FontAwesomeIcons.xmark,
                                              //   size: 20,
                                              // )

                                              ),
                                        ],
                                      )),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 25,
                                      padding: const EdgeInsets.only(left: 0),
                                      child: FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: GestureDetector(
                                          onTap: () async {
                                            // Widget toast = Container(
                                            //   padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                                            //   decoration: BoxDecoration(
                                            //     borderRadius: BorderRadius.circular(25.0),
                                            //     color: Colors.red,
                                            //   ),
                                            //   child: const Text(
                                            //     "This is a Custom Toast Message",
                                            //     style: TextStyle(color: Colors.white),
                                            //   ),
                                            // );

                                            // fToast?.showToast(
                                            //   child: toast,
                                            //   toastDuration: const Duration(seconds: 3),
                                            // );
                                          },
                                          child: SizedBox(
                                            // height: 25,
                                            // width: 25,
                                            child: AutoSizeText(
                                              _selectedfolders.length
                                                  .toString(),
                                              // minFontSize: 26,maxFontSize: 26,
                                              // presetFontSizes: [22],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Spacer(),
                                  Align(
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          // backgroundColor: _selectedfolders.isNotEmpty ? Colors.blue : Colors.blueGrey,
                                          onPressed: () {
                                            log("----> set State 3");
                                            isSwitched = !isSwitched;
                                            if (isSwitched == true) {
                                              _selectedfolders.clear();
                                              listselected.clear();
                                              _selectedfolders
                                                  .addAll(_foldersinit);
                                              selectall = true;

                                              debugPrint('true');
                                              /*  for (int i = 0; i < _folders.length; i++) {
                        listselected.add(i);
                      } */
                                            } else {
                                              selectall = true;

                                              _selectedfolders.clear();
                                              listselected.clear();
                                            }
                                            setState(() {});
                                          },
                                          icon: SvgPicture.asset(
                                            'images/icons/check2-all.svg',
                                            semanticsLabel: 'Acme Logo',
                                            color: black,
                                            height: 25,
                                            width: 25,
                                          ))),
                                  Align(
                                    alignment: Alignment.center,
                                    child: IconButton(
                                        // backgroundColor: Colors.green,
                                        onPressed: () async {
                                          if (_selectedfolders.isNotEmpty) {
                                            List<XFile> paths = _selectedfolders
                                                .map((e) => XFile(e.path))
                                                .toList();
                                            sharemultiFiles(paths);
                                          }
                                        },
                                        icon: SvgPicture.asset(
                                          'images/icons/share.svg',
                                          semanticsLabel: 'Acme Logo',
                                          color: black,
                                          height: 25,
                                          width: 25,
                                        )),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: IconButton(
                                          // backgroundColor: Colors.red,
                                          onPressed: () async {
                                            if (_selectedfolders.isNotEmpty) {
                                              alertDialog(context);
                                            }
                                          },
                                          icon: SvgPicture.asset(
                                            'images/icons/trash.svg',
                                            semanticsLabel: 'Acme Logo',
                                            color: black,
                                            height: 25,
                                            width: 25,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    Expanded(
                      child: Listener(
                          onPointerMove: (moveEvent) {
                            FadeOnInactive.globalKey.currentState
                                ?.showContent();
                            FadeOnInactive.globalKey.currentState?.resetTimer();
                          },
                          child: GridView.builder(
                            // shrinkWrap: true,
                            controller: scrollController,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: _foldersinit.length,
                            padding: EdgeInsets.only(
                                bottom: (kBottomNavigationBarHeight + 2),
                                left: 2,
                                right: 2,
                                top: 2),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.75,
                                    //  mainAxisExtent: 300,
                                    // mainAxisExtent: 150,
                                    mainAxisSpacing:
                                        _selectedfolders.isNotEmpty ||
                                                selectall == true
                                            ? 2
                                            : 2,
                                    crossAxisSpacing:
                                        _selectedfolders.isNotEmpty ||
                                                selectall == true
                                            ? 2
                                            : 2,
                                    crossAxisCount: i),
                            itemBuilder: (context, index) {
                              String thumPath =
                                  '/storage/emulated/0/Download/Gorilla TikTok Downloader/thumbnails/${_foldersinit[index].path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', '').replaceAll('.mp4', '.jpeg')}';


                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          _selectedfolders.isNotEmpty ||
                                                  selectall == true
                                              ? 0
                                              : 0),
                                      child: ThumbnailWidget(
                                        isPlayVisible: !selectall,
                                        thumbnailByteslist: thumbnailBytes,
                                        list: thumbnailBytes[_foldersinit[index]
                                            .path
                                            .replaceAll(
                                                '/storage/emulated/0/Download/Gorilla TikTok Downloader/',
                                                '')],
                                        selectall: selectall,
                                        item: _foldersinit[index],
                                        selectedfolders: _selectedfolders,
                                        path: _foldersinit[index].path,
                                        thumbnailFile: File(thumPath),
                                        onLongPress: () {
                                          if (_selectedfolders.isNotEmpty) {
                                            if (_selectedfolders.contains(
                                                    _foldersinit[index]) ||
                                                _selectedfolders.any(
                                                    (element) => element.path ==
                                                            _foldersinit[index]
                                                                .path
                                                        ? true
                                                        : false)) {
                                              debugPrint("existtt");
                                              _selectedfolders.removeWhere(
                                                  (element) =>
                                                      element ==
                                                      _foldersinit[index]);
                                              listselected.removeWhere(
                                                  (element1) =>
                                                      element1 == index);
                                            } else {
                                              selectall = true;

                                              _selectedfolders
                                                  .add(_foldersinit[index]);
                                              listselected.add(index);
                                            }
                                          } else {
                                            _selectedfolders
                                                .add(_foldersinit[index]);
                                            listselected.add(index);

                                            selectall = true;
                                          }

                                          log("----> set State 5");
                                          setState(() {});
                                        },
                                        onTap: () async {
                                          // print(_selectedfolders.any((element) => element.path == _foldersinit[index].path ? true : false));
                                          // print(listselected);
                                          if ((_selectedfolders.isNotEmpty) ||
                                              selectall) {
                                            if (_selectedfolders.any(
                                                (element) => element.path ==
                                                        _foldersinit[index].path
                                                    ? true
                                                    : false)) {
                                              _selectedfolders.removeWhere(
                                                  (element) =>
                                                      element.path ==
                                                      _foldersinit[index].path);
                                              listselected.removeWhere(
                                                  (element1) =>
                                                      element1 == index);
                                              // print(listselected);
                                            } else {
                                              _selectedfolders
                                                  .add(_foldersinit[index]);
                                              listselected.add(index);
                                            }

                                            log("----> set State 6");
                                            setState(() {});
                                          } else {
                                            currPlayIndex = index;
                                            playerIsOpen = true;
                                            // print(listFiles);
                                            await Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              // return plv.TkScroller();
                                              return VideoViewer(
                                                currentFile: listFiles[index],
                                                thumbnailBytes: thumbnailBytes,
                                              );
                                            }));
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 6,
                                      right: 6,
                                      // height: 21,
                                      // width: 21,
                                      child: _selectedfolders.any((element) =>
                                              element.path ==
                                                      _foldersinit[index].path
                                                  ? true
                                                  : false)
                                          ? Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff69C9D0)
                                                        .withOpacity(0.9)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(1.0),
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 27.0,
                                                    color: white,
                                                  ),
                                                ),
                                              )
                                          : (_selectedfolders.isNotEmpty) ||
                                                  selectall
                                              ?  Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: unselectedColor
                                                            .withOpacity(0.9)),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(1.0),
                                                      child: Icon(
                                                        Icons.check,
                                                        size: 27.0,
                                                        color: white,
                                                      ),
                                                    ),
                                                  )

                                              // CircleAvatar(
                                              //     backgroundColor: const Color.fromARGB(
                                              //       255,
                                              //       148,
                                              //       148,
                                              //       150,
                                              //     ).withOpacity(0.9),
                                              //     child: Icon(
                                              //       Icons.check,
                                              //       color: Colors.white,
                                              //       size: 15,
                                              //     ),
                                              //   )
                                              : const SizedBox()),

                                ],
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
              // stillPressing == true
              //     ? Loading(
              //         color: grey.shade100.withOpacity(.8),
              //       )
              //     : SizedBox.shrink()

              if (_foldersinit.isNotEmpty)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: kBottomNavigationBarHeight + 6),
                    child: FadeOnInactive(
                        child: Container(
                      // height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _foldersinit.isEmpty
                              ? Colors.transparent
                              : white),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(text: 'Total ', size: 16),
                          stillPressing == true
                              ? SizedBox(
                                  height: 12,
                                  width: 12,
                                  child: SpinKitCircle(
                                    color: Color(0xffee1d52),
                                    size: 12,
                                  ),
                                )
                              : CustomText(
                                  text: ' ${_foldersinit.length}', size: 16),
                        ],
                      ),
                    )),
                  ),
                )
            ],
          )
        : stillPressing == true
            ? SizedBox.shrink()
            : Container(
                padding: const EdgeInsets.all(0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/icons/collection.svg',
                        semanticsLabel: 'Acme Logo',
                        color: Color(0xff808080),
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "No videos to show",
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff808080)),
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              );
  }

  getLocalStorageView() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    showVideos = preferences.getBool('localStorage') ?? false;
    if (showVideos == true) {}
    getDir();
    loading = false;
    setState(() {});
  }

  void alertDialog(BuildContext context) {
    var alert = Dialog(
      insetPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

      // title: const Text('Delete Video'),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: InkWell(
      //       onTap: () async {
      //         Navigator.of(context).pop();

      //         //List<Uint8List> listselectedtmp = [];
      //         if (await Permission.storage.request().isGranted && await Permission.manageExternalStorage.request().isGranted) {
      //           debugPrint("listselectedtmp${_selectedfolders.length}");

      //           //images.clear();
      //           for (var element in _selectedfolders) {
      //             await deleteFileall(File(element.path));
      //           }
      //           // await getDir(hideMenu: true);
      //           listselected.clear();
      //           _selectedfolders.clear();

      //           //const snackBar = SnackBar(content: Text('Videos Deleted'),);
      //           //ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //         } else {
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             const SnackBar(
      //               content: Text('NeeD Permission'),
      //             ),
      //           );
      //           //    Navigator.of(context).pop();
      //           //  Navigator.of(context).pop();
      //         }
      //       },
      //       child: Container(
      //         height: 38,
      //         alignment: Alignment.center,
      //         decoration: const BoxDecoration(color: Color.fromARGB(255, 218, 34, 10), borderRadius: BorderRadius.all(Radius.circular(8))),
      //         child: const Text(
      //           'Ok',
      //           style: TextStyle(color: Colors.white, fontSize: 15),
      //         ),
      //       ),
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: InkWell(
      //       onTap: () {
      //         Navigator.of(context).pop();
      //       },
      //       child: Container(
      //         height: 38,
      //         alignment: Alignment.center,
      //         decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(8))),
      //         child: const Text(
      //           'Cancel',
      //           style: TextStyle(color: Colors.white, fontSize: 15),
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
      // title: const Text('Delete Video'),
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          // height: 100,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Are you sure you want to delete? This cannot be undone.'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFlatButton(
                      // radius: 10,
                      text: 'No',
                      color: tikTokBlack,
                      width: MediaQuery.of(context).size.width / 3,
                      callback: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomFlatButton(
                      text: 'Yes',
                      // radius: 10,
                      color: tikTokRed,
                      width: MediaQuery.of(context).size.width / 3,
                      callback: () async {
                        Navigator.of(context).pop();

                        //List<Uint8List> listselectedtmp = [];
                        if (await Permission.storage.request().isGranted &&
                            await Permission.manageExternalStorage
                                .request()
                                .isGranted) {
                          debugPrint(
                              "listselectedtmp${_selectedfolders.length}");

                          //images.clear();
                          for (var element in _selectedfolders) {
                            await deleteFileall(File(element.path));
                          }
                          // await getDir(hideMenu: true);
                          listselected.clear();
                          _selectedfolders.clear();

                          //const snackBar = SnackBar(content: Text('Videos Deleted'),);
                          //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Need permission'),
                            ),
                          );
                          //    Navigator.of(context).pop();
                          //  Navigator.of(context).pop();
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Future<void> deleteFile(File file, int index) async {
    const snackBar = SnackBar(
      content: Text('Video deleted'),
    );
    // await Permission.manageExternalStorage.request().isGranted;
    if (await Permission.storage.request().isGranted) {
      try {
        if (await file.exists()) {
          await file.delete().then((value) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.of(context).pop();
          });
        }
      } catch (e) {
        log(e.toString());
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Need permission'),
      ));
      Navigator.of(context).pop();
      //
    }
  }

  Future<void> deleteFileall(File file) async {
    try {
      if (await file.exists()) {
        await file.delete(recursive: true);
        await File(
                '/storage/emulated/0/Download/Gorilla TikTok Downloader/thumbnails/${file.path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', '').replaceAll('.mp4', '.jpeg')}')
            .delete();
        listFiles
            .removeWhere((element) => element.path == file.path ? true : false);
        _foldersinit
            .removeWhere((element) => element.path == file.path ? true : false);
        thumbnailBytes.remove(file.path.replaceAll(
            '/storage/emulated/0/Download/Gorilla TikTok Downloader/', ''));
        setState(() {});
      } else {
        print('unable to delete');
        Fluttertoast.showToast(msg: 'Unable to delete');
      }
    } catch (e) {
      print(e.toString());
      // await Permission.manageExternalStorage.request();
      // await file.create().then((value) {
      //   print(value.path);
      // });
      // Fluttertoast.showToast(msg: e.toString());
    }
  }

  // ignore: prefer_typing_uninitialized_variables

  Future getDir({bool hideMenu = false}) async {
    _foldersinit.clear();

    if (selectall == true && hideMenu == true) {
      selectall = false;
      listselected.clear();
      _selectedfolders.clear();
    }

    // setState(() {
    //   stillPressing = true;
    // });
    final Directory photoDir =
        Directory('/storage/emulated/0/Download/Gorilla TikTok Downloader');
    // Fluttertoast.showToast(msg: photoDir.listSync().length.toString());
    _foldersinit = photoDir
        .listSync()
        .where((e) =>  e.path.endsWith('.mp4') && File('/storage/emulated/0/Download/Gorilla TikTok Downloader/thumbnails/${
        e.path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', '').replaceAll(".mp4", ".jpeg")}').existsSync())
        .toList()
      ..sort((l, r) => r.statSync().modified.compareTo(l.statSync().modified));
    _foldersinit.sort((l, r) => r.statSync().modified.compareTo(l.statSync().modified));

    listFiles = _foldersinit.map((e) => File(e.path)).toList();


    // for (var folder in _selectedfolders) {
    //   // print(folder)
    //   _foldersinit.any((element) {
    //     if (element.path == folder.path) {
    //       // Fluttertoast.showToast(msg: folder.path);
    //       return true;
    //     } else {
    //       return false;
    //     }
    //   });
    // }
    thumbnailBytes.clear();
    // Future.delayed(Duration(microseconds: 100)).whenComplete(() async {
    //   for (var file in listFiles) {
    //     await VideoThumbnail.thumbnailData(
    //       video: file.path,
    //       imageFormat: ImageFormat.JPEG,
    //       // maxHeight: 480,
    //       // maxWidth: 360,
    //       quality: 100,
    //     ).then((value) async {
    //       // thumbnailBytes.addAll({file.path.replaceAll('/storage/emulated/0/Download/New App/', ''): value});
    //       // print(value!.length);
    //       try {
    //         String filePath =
    //             '/storage/emulated/0/Download/New App/thumbnails/${file.path.replaceAll('/storage/emulated/0/Download/New App/', '').replaceAll('.mp4', '')}.jpeg';
    //         if (!Directory(filePath).existsSync()) {
    //           File x = await File(filePath).create();
    //           x.writeAsBytesSync(value!);
    //           setState(() {

    //           });
    //         }
    //       } catch (e) {
    //         print('e.toString()');
    //       }
    //     });
    //     setState(() {});
    //   }
    // });

    log("----> set State 7");
    setState(() {
      stillPressing = false;
    });
  }

  Future<void> shareFile(path) async {
    await Share.shareXFiles([XFile(path)]);
    /*
    await FlutterShare.shareFile(
      title: ' ',
      filePath: path,
    );
    */
  }

  Future<void> sharemultiFiles(List<XFile> files) async {
    await Share.shareXFiles(files, text: ' ');
  }

  getListStatus() async {
    bool status = true;
    int length = 0;
    int finalLength = 0;
    int counter = 5;
    await Future.delayed(Duration(seconds: 5)).whenComplete(() async {
      length = chewies.length;
      print('length on start is$length');
      await Future.delayed(Duration(seconds: 3)).whenComplete(() {
        finalLength = chewies.length;
        if (finalLength == chewies.length) {
          stillPressing = false;
          print('loading done final length is$finalLength');
          setState(() {});
        } else {
          // Fluttertoast.showToast(msg: 'test msg');
        }
      });
    });
  }

  Future<void> _prepareSaveDir() async {
    // Fluttertoast.showToast(msg: '${await Permission.storage.status}');
    if (!permStatus &&
        !(permStatus =
            (await Permission.storage.status == PermissionStatus.granted))) {
      await Permission.storage.request();
      await Permission.manageExternalStorage.request();
      getDir();
    } else {
      permStatus = await Permission.storage.isGranted;
      getDir();
      if (mounted) {
        setState(() {});
      }
    }
    _localPath = "/storage/emulated/0/Download/Gorilla TikTok Downloader/";
    var _thumbnailPath =
        "/storage/emulated/0/Download/Gorilla TikTok Downloader/thumbnails/";
    final savedDir = Directory(_localPath);
    final thumbnailPath = Directory(_thumbnailPath);
    final hasExisted = savedDir.existsSync();
    final hasExistedThumbnail = thumbnailPath.existsSync();
    // Fluttertoast.showToast(msg: 'videos dir ${hasExisted.toString()} and thumbnails dir${hasExistedThumbnail.toString()}');
    if (!hasExisted) {
      await savedDir.create();
    }
    if (!hasExistedThumbnail) {
      await thumbnailPath.create();
    }
  }

  updateList() async {
    print('updating ${listFiles.length}');
    // await Future.delayed(Duration(seconds: 2));
    final Directory photoDir =
        Directory('/storage/emulated/0/Download/Gorilla TikTok Downloader');
    List<FileSystemEntity> latestFiles = photoDir
        .listSync()
        .where((e) => e.path.endsWith('.mp4'))
        .toList()
      ..sort((l, r) => r.statSync().modified.compareTo(l.statSync().modified));
    latestFiles
        .sort((l, r) => r.statSync().modified.compareTo(l.statSync().modified));
    final Directory thumbnailsDir = Directory(
        '/storage/emulated/0/Download/Gorilla TikTok Downloader/thumbnails');
    List<FileSystemEntity> latestThumbnailFiles = thumbnailsDir
        .listSync()
        .where((e) => e.path.endsWith('.jpeg'))
        .toList();
    // latestThumbnailFiles.any((element) {
    //   if (element.path.replaceAll('/storage/emulated/0/Download/New App/thumbnails/', '').replaceAll('.jpeg', '') ==
    //       latestFiles
    //           .where((element1) => element1.path.replaceAll('/storage/emulated/0/Download/New App/', '').replaceAll('.mp4', '') ==
    //                   element.path.replaceAll('/storage/emulated/0/Download/New App/thumbnails/', '').replaceAll('.jpeg', '')
    //               ? true
    //               : false)
    //           .first
    //           .path) {
    //     print('cdcdc');
    //     return true;
    //   } else {
    //     return false;
    //   }
    // });
    for (var file in latestFiles) {
      if (latestThumbnailFiles.any((element) => element.path.contains(file.path
              .replaceAll(
                  '/storage/emulated/0/Download/Gorilla TikTok Downloader/', '')
              .replaceAll('.mp4', ''))
          ? true
          : false)) {
        if (!_foldersinit
            .any((element) => element.path == file.path ? true : false)) {
          _foldersinit.insert(0, file);
          listFiles.insert(0, File(file.path));
          _foldersinit.sort(
              (l, r) => r.statSync().modified.compareTo(l.statSync().modified));
          listFiles.sort(
              (l, r) => r.statSync().modified.compareTo(l.statSync().modified));
          setState(() {});
          // }
        } else {
          // print('contained');
        }
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class FadeOnInactive extends StatefulWidget {
  final Widget child;
  final Duration inactiveDuration;
  static final GlobalKey<FadeOnInactiveState> globalKey = GlobalKey();

  FadeOnInactive(
      {Key? key,
      required this.child,
      this.inactiveDuration = const Duration(seconds: 3)})
      : super(key: globalKey);

  @override
  FadeOnInactiveState createState() => FadeOnInactiveState();
}

class FadeOnInactiveState extends State<FadeOnInactive> {
  // bool _isTouched = true;
  Timer? timer;
  double opacity = 1;

  void resetTimer() {
    timer?.cancel();
    timer = Timer(widget.inactiveDuration, hideContent);
  }

  void hideContent() {
    setState(() {
      opacity = 0;
    });
  }

  void showContent() {
    setState(() {
      opacity = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showContent();
        resetTimer();
      },
      child: AnimatedOpacity(
          opacity: opacity,
          duration: Duration(milliseconds: 500),
          child: widget.child),
    );
  }
}
