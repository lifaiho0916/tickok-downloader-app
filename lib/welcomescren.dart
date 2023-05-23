//import 'dart:developer';
import 'dart:io';
import 'dart:ui';

//import 'dart:isolate';
//import 'dart:ui';

//import 'package:connectivity_plus/connectivity_plus.dart';
//import 'package:device_info_plus/device_info_plus.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:device_apps/device_apps.dart';
import 'package:dio/dio.dart';
import 'package:disk_space/disk_space.dart';
import 'package:firebase_storage/firebase_storage.dart';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_app/helpers&widgets/custom_button.dart';
import 'package:new_app/helpers&widgets/custom_text.dart';
import 'package:new_app/helpers&widgets/helper_class.dart';
import 'package:new_app/helpers&widgets/loading_cards.dart';
import 'package:new_app/helpers&widgets/styling.dart';

//import 'package:webview_flutter/webview_flutter.dart';
import 'package:new_app/local/cache_helper.dart';
import 'package:new_app/video_viewer.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

//import 'package:new_app/single_video.dart';
import 'package:permission_handler/permission_handler.dart';

//import 'models/video.dart';
import 'dart:async';
import 'dart:convert';
import 'package:html/parser.dart' show parse;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

//import 'package:http/http.dart' as http;
import 'Margin.dart';
import 'helpers&widgets/loading.dart';
import 'main.dart' as main; // show httpREAD,checkConectivity;
//import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:flutter_background/flutter_background.dart';

import 'main.dart';
import 'models/downloading_model.dart';
import 'package:html_unescape/html_unescape.dart';
import 'dart:io' as io;
import 'package:http/http.dart' as http;

// ignore: prefer_typing_uninitialized_variables

// ignore: prefer_typing_uninitialized_variables

//var myMainState1;
//var myMainState2;

//var myMainContext1;
//var myMainContext2;
/*
class WelcomScreen extends StatefulWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
*/
//RThis
//DON'T FORGET TO GO main.dart and UNCOMMENT getSharedText(); AND UNCOMMENT dataShared = widget.title; INSIDE initstate
//String vidToDownload='';
bool checkedData = false;
String? dataShared;
var myHomeState;
var myHomecontext;
//='https://www.tiktok.com/@mohamed.khalidx/video/7106573388394630405?lang=en';
//='https://www.tiktok.com/@helda_lolipop?lang=en';
//='https://vm.tiktok.com/ZMFArF5MC/'

String originalDataShared =
//dataShared!
    '';
//;
MethodChannel platform = const MethodChannel('app.channel.shared.data');
bool profile = true; //better
//false;
bool video = false;

Future<void> getSharedText(String sharedData, BuildContext context) async {
  //بيتم استدعائها لمن افتح الشاشة بدون مشاركة شي عليها
  //debugPrint("getSharedText *******");
  try {
    debugPrint("url welcome screen is : $sharedData");
    if (sharedData != null || (dataShared != null && dataShared != '')) {
      if (sharedData != null) {
        originalDataShared = dataShared = sharedData;
      }
      debugPrint("getSharedText$dataShared");
      if (dataShared!.contains('/video/') ||
              dataShared!.contains('https://vm.') //('https://vm.')
          ) {
        //if(dataShared!.contains('https://vm.')){await main.httpGET(dataShared!).then((res){res.headers;});}
        //vidToDownload=dataShared!;//.split('/video/').last.split('?').first;
        //video = true;
      } // else {profile = true;}//defained as true
      //if(myHomeState!=null){myHomeState((){});}
      downloadedVideos.clear();
      // inAppWebViewFunc(context: context);
      //Timer.periodic(const Duration(seconds:5),(timer)async{if(selectedVideos.isEmpty){timer.cancel();}else if(headlessWebView1!=null&&webViewController!=null&&headlessWebView1!.isRunning()&&!await webViewController!.isLoading()){timer.cancel();downloadFiles();}});
    }
  } catch (e) {
    //
  }
  checkedData = true;
}

/*
class WelcomScreen extends StatelessWidget {
  //عندما تكون الشاشة فارغة
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //myMainState1=myHomeState;
    //myMainContext1=context;
    //الشاشة عندما ما اكون مشارك عليها شي
    return Stack(
      children: [
        profile
            ? MyHomePage(
                title: dataShared!,
              )
            : video
                ? SingleVideoPage(
                    sharedUrl: dataShared!,
                  )
                : Container(
                    //child:Text(DateTime.now().millisecondsSinceEpoch.toString()),
                    color: Colors.white,
                  ),
      ],
    );
  }
/*
  @override
  void initState() {
    super.initState();
    //الخاصة ب الشاشة وهي فارغة
    //myMainState1=myHomeState;
    //myMainContext1=context;
    //Timer.periodic(const Duration(seconds:1),(timer){if(myHomeState!=null){myHomeState((){});}});
    //getSharedText();
  }
  */
}
*/
//List<TaskInfo>? _tasks;
//late List<ItemHolder> _items;
//late bool _loading; //جلبنا بيانات اعطي صح
//late bool _permissionReady;
String _localPath = '/storage/emulated/0/Download/Gorilla TikTok Downloader/';
//final SendPort _sendport = SendPort();
//final ReceivePort _port = ReceivePort();

HeadlessInAppWebView? headlessWebView;
//static const platform = MethodChannel('app.channel.shared.data');
//String? dataShared='https://www.tiktok.com/@sarahhanyy?lang=ar';//='https://vm.tiktok.com/ZMNpKfgRb/?k=1';

InAppWebViewController? webViewController;
//InAppWebViewController? headlessWebViewController;
String? avatar;
String? name = '';
String? atname = '';
String? bio = '';
//List<VideoModel> trimmedVideos = []; //قائمة الفيديوهات الي جبناها عنا عتطبيق
int allVideosCount = 0; // عدد الفيديوهات الي جاية من التيك توك
dynamic data;
dynamic images;
dynamic titles;
List audios = [];
Map mapres = {};
Map userMap = {};
dynamic urls;
List noTitleIds = [];
dynamic watches;
bool isLoading = false;
bool isLoadingMore = false;
bool isloadingVideos = true;
bool isMetaChanged = false;
int counter = 0;
bool checkingStatus = false;
int initialCounterVal = 0;
int triesCount = 0;
bool selectAll = false;
dynamic initialVideosListData;
String htmlstore = '';
final htmlstorecontroller = TextEditingController();

//List//<VideoModel>
//<Map<String,dynamic>>
Map<int, Map<String, dynamic>> videos = {};
// []; //قائمة الفيديوهات ليست الي من التيك توك
//List//<VideoModel>
//<Map<String,dynamic>>
Map<int, Map<String, dynamic>> selectedVideos = {}
//[]
    ; //الفيديوهات الي حددناها
//List//<VideoModel>
//<Map<String,dynamic>>
Map<int, Map<String, dynamic>> downloadedVideos = {};
//[]; //الفيديوهات الي حددناها

//bool isPageLoaded1=false;//for inappwebview, goto //vinappweb
//bool isPageLoaded2=false;//for inappwebview, goto //vinappweb
//bool isPageLoaded3=false;//for inappwebview, goto //vinappweb
bool isDownloading = false; //for download process
bool isGetMore = false; //for download process
bool isFail = false;
bool? showSaved = false;
String videoQuality = '';
bool? removingExistingSelected = true;
double downloadProgress = 0;
ValueNotifier<int> downloadFile = ValueNotifier<int>(0);
ValueNotifier<double> downloadProgress2 = ValueNotifier<double>(0.0);
CancelToken _cancelToken = CancelToken();
String? isPermission = CacheHelper.getData(key: 'isPermission') ?? "perm1";
bool isCanceled =
    false; // هاد عملتو عشان امنع ظهور الرسالة اكثر من مرة تعت الكانسل
//ConnectivityResult _connectionStatus = ConnectivityResult.none;
//final Connectivity _connectivity = Connectivity();
//late StreamSubscription<ConnectivityResult> connectivitySubscription;
bool isBotmoConectivity = true;
bool isTopConectivity = true;
bool isSuccessOK = false;
bool isDownloadAll = false;
bool cancelingDl = false;
bool visible = false;
bool visibletitle = false;
ValueNotifier<bool> visibletitleValue = ValueNotifier<bool>(false);
bool isErrorConnection = false;
bool isErrorStorage = false;
bool circularProgressRetry = false;
double? diskFree = 0;
double? totalDisk = 1350;
bool permStatus = false;
ScrollController? _scrollController;
FToast? fToast;

Future<bool> initDiskSpace() async {
  //if(!permStatus&&!(permStatus=(await Permission.storage.status==PermissionStatus.granted))){await Permission.storage.request();}
  diskFree = await DiskSpace.getFreeDiskSpace;
  totalDisk = await DiskSpace.getTotalDiskSpace;
  return (diskFree! > (totalDisk! * .035));
}

void _showErrorDialog(String message, BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    useSafeArea: false,
    useRootNavigator: false,
    builder: (ctx) => Dialog(
        insetPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

        // insetPadding: ,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message),
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
                        Navigator.of(ctx).pop();
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
                        Navigator.pop(ctx);
                        isCanceled = true;
                        _cancelToken.cancel();
                        isSuccessOK = true;
                        isDownloading = false;
                        if (myHomeState != null) {
                          myHomeState(() {});
                        }
                        //_modalBottomSheetMenu("cancel", "eee");
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
        // content: Text(message),
        // actions: <Widget>[
        //   TextButton(
        //     child: const Text(
        //       "No",
        //       style: TextStyle(
        //         color: Color.fromRGBO(254, 44, 85, 1.0),
        //         fontSize: 14,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //     onPressed: () async {
        //       Navigator.of(ctx).pop();
        //       //_tasks?.sublist(downloadFile.value).forEach((element) async {await _retryDownload(element);});\nfor(var element in _tasks!.sublist(downloadFile.value)){await _retryDownload(element);}
        //       //isDownloading = true;
        //       //if(myHomeState!=null){myHomeState((){});}
        //     },
        //   ),
        //   TextButton(
        //     child: const Text(
        //       "Yes",
        //       style: TextStyle(
        //         color: Color.fromRGBO(254, 44, 85, 1.0),
        //         fontSize: 14,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //     onPressed: () async {
        //       Navigator.pop(ctx);
        //       //await FlutterDownloader.cancelAll();
        //       //_tasks?.sublist(downloadFile.value).forEach((element) async {await _delete(element);});
        //       //for(var element in selectedVideos.sublist(downloadFile.value)){await _delete(element);}
        //       isCanceled = true;
        //       _cancelToken.cancel();

        //       isSuccessOK = true;
        //       isDownloading = false;
        //       if (myHomeState != null) {
        //         myHomeState(() {});
        //       }
        //       //_modalBottomSheetMenu("cancel", "eee");
        //     },
        //   ),
        // ],
        ),
  );
}

/*
Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  //myHomeState(() {
  //RThis
  //_connectionStatus = result;
  //});
}
*/
int numberOfDownReq = 0;
bool allPageLoaded = false;
bool initiated = false;
AnimationController? animationController;

void initTheState() {
  initiated = true;

  initDiskSpace();
}

class MyHomePage extends StatefulWidget {
  final String title;
  final PageController? pageController;
  final callback;

  const MyHomePage(
      {Key? key,
      required this.title,
      required this.pageController,
      this.callback})
      : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    // Fluttertoast.showToast(msg: 'messge');
    fToast = FToast();
    animationController = BottomSheet.createAnimationController(this);
    animationController!.duration = Duration(microseconds: 20);
    animationController!.reverseDuration = Duration(microseconds: 20);
    fToast?.init(context);
    super.initState();
    visibletitleValue.addListener(() {
      // Fluttertoast.showToast(msg:'${ visibletitleValue.value}');
      print(visibletitleValue.value);
      setState(() {});
    });
    if (dataShared!.contains('tiktok')) {
      debugPrint("data: $dataShared");

      dbRef();
      if (visible == false &&
          (videos.isNotEmpty || downloadedVideos.isNotEmpty)) {
        setState(() {
          removingExistingSelected = true;
        });
        getSharedPref(context: context);
      }
      // dlStatusinit();
      if (dataShared != null &&
          checkedData &&
          videos.isEmpty &&
          allVideosCount >= 0) {
        // Fluttertoast.showToast(msg: 'msg');
        if (!initiated) {
          inAppWebViewFunc(context: context);
          _scrollController = ScrollController()
            ..addListener(() async {
              if (await _isAppBarExpanded()) {
                // print('expanded');
                // setState(() {});
              }
            });
          // print('gwtting existing videos ${getExistingVideos()}');
          getToken();
        } else {
          // Fluttertoast.showToast(msg: 'msg');
          more().catchError((e) {
            debugPrint(e.toString());
            isLoading = false;
            isGetMore = false;
            removingExistingSelected = false;
            // print('getting more existing videos ${getExistingVideos()}');
            if (myHomeState != null) {
              myHomeState(() {});
            }
            inAppWebViewFunc(context: context);
            getToken();
          });
        }
      }

      if (!initiated) {
        initTheState();
      }
    } else {
      print('data not loaded completely...exiting');
      Fluttertoast.showToast(msg: 'Invalid Link. Please try again');
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  Future<bool> _isAppBarExpanded() async {
    return _scrollController!.hasClients &&
        _scrollController!.offset > (kToolbarHeight);
  }

  @override
  void dispose() {
    super.dispose();
    myHomecontext = null;
    myHomeState = null;
  }

  Widget metaChangedWidget() {
    return Center(
        child: Text(
      'Meta changed text',
      textAlign: TextAlign.center,
    ));
  }

  @override
  Widget build(BuildContext context) {
    myHomecontext = context;
    myHomeState = setState;
    //myMainState2=myHomeState;
    //myMainContext2=context;

    //البداية لمن  يكون في بيانات جاية

//vscaf
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     name != null ? name! : '',
      //     style: TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      //   centerTitle: true,
      //   toolbarHeight: visible == true || isloadingVideos == true || _isAppBarExpanded ? 0 : Theme.of(context).appBarTheme.toolbarHeight,
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     // uploadFile(File('storage/emulated/0/Documents/New App/webview.txt'));
      //   },child: Icon(Icons.print),
      // ),
      body: isloadingVideos == true && !isGetMore
          ? ((isMetaChanged) ? metaChangedWidget() : Loading2())
          : visible == true
              ? downloadingWidget()
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: (originalDataShared.contains('https://vm.') ||
                          originalDataShared.contains('https://vt.'))
                      ? Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: topWidget(context)),

                            removingExistingSelected == true
                                ? Expanded(
                                    flex: 5,
                                    child: Center(
                                      child: SpinKitSpinningLines(
                                        color:
                                            Theme.of(context).backgroundColor,
                                        lineWidth: 4,
                                      ),
                                    ),
                                  )
                                : (!isLoading &&
                                        videos.isEmpty &&
                                        downloadedVideos.isNotEmpty &&
                                        ((downloadedVideos.length +
                                                videos.length) ==
                                            allVideosCount) &&
                                        removingExistingSelected == false)
                                    ? Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            child: CustomText(
                                                text: (removingExistingSelected ==
                                                            true &&
                                                        videos.isEmpty)
                                                    ? ''
                                                    : 'No Video to download')),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        decoration: BoxDecoration(
                                          color: Color(0XFFEED9DE),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          // boxShadow: [BoxShadow(offset: Offset(1, 2), blurRadius: 1, spreadRadius: 2, color: grey.shade200)],
                                        ),
                                        // padding: EdgeInsets.all(4),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // width: 200,
                                              // padding: EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child:

                                                  //CachedNetworkImage(imageUrl://Image.network(
                                                  AspectRatio(
                                                aspectRatio: 0.8,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(6),
                                                          topLeft:
                                                              Radius.circular(
                                                                  6)),
                                                  child: CachedNetworkImage(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            5,
                                                    fadeInCurve: Curves.easeIn,
                                                    imageUrl: videos
                                                        .entries
                                                        .first
                                                        .value["thumbUrl"],
                                                    fit: BoxFit.cover,
                                                    placeholder:
                                                        (context, url) =>
                                                            Container(
                                                      color: Color(0xff181d39),
                                                      alignment:
                                                          Alignment.center,
                                                      child:
                                                          CircularProgressIndicator(
                                                              color: Color(
                                                                  0xff7391c3)),
                                                    ),
                                                    errorWidget:
                                                        //errorWidget:
                                                        (_, obj, trace) {
                                                      return Container(
                                                        color: Colors.black,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        alignment:
                                                            Alignment.center,
                                                        child: SizedBox(
                                                          width: MediaQuery.of(
                                                                      myHomecontext)
                                                                  .size
                                                                  .height *
                                                              .07,
                                                          height: MediaQuery.of(
                                                                      myHomecontext)
                                                                  .size
                                                                  .height *
                                                              .07,
                                                          child: Image.asset(
                                                              'images/generic_thumbnail.png'),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),

                                            Expanded(
                                              child: Container(
                                                // alignment: Alignment.center,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    5,
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: AutoSizeText(
                                                  removingExistingSelected ==
                                                              true &&
                                                          videos.isEmpty
                                                      ? ''
                                                      // : '${videos.entries.first.value['title'].isEmpty ? bio == 'No bio yet.' || bio!.isEmpty ? audios[0].toString().isNotEmpty ? audios[0] : 'Video -1' : '${bio!.replaceAll("\n", "")}-1' : videos.entries.first.value['title']} ', // fontWeight: FontWeight.normal,
                                                      : '${videos.entries.first.value['title'].isEmpty ? bio == 'No bio yet.' ? '${bio!.replaceAll("\n", "")}-1' : audios[0].toString().isNotEmpty ? audios[0] : 'Video -1' : ' ${videos.entries.first.value['title']}'} ',
                                                  // fontWeight: FontWeight.normal,

                                                  // : '${videos.isEmpty ? downloadedVideos.entries.first.value['title'] : videos.entries.first.value['title']}', // fontWeight: FontWeight.normal,
                                                  // size: 12,
                                                  style: TextStyle(
                                                      color: selectionColor),
                                                  maxLines: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height /
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              5))
                                                      .floor(),
                                                  presetFontSizes: [14],
                                                  wrapWords: false,
                                                  // maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  softWrap: false,
                                                ),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),

                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: selectionColor),
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsets.all(1.0),
                                                      child: Icon(
                                                        Icons.check,
                                                        size: 27.0,
                                                        color: white,
                                                      )),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                            // Expanded(
                            //     flex: 5,
                            //     child: FittedBox(
                            //       fit: BoxFit.scaleDown,
                            //       child: (!isLoading &&
                            //               videos.isEmpty &&
                            //               downloadedVideos.isNotEmpty &&
                            //               ((downloadedVideos.length + videos.length) == allVideosCount) &&
                            //               removingExistingSelected == false)
                            //           ? CustomText(text: (removingExistingSelected == true && videos.isEmpty) ? '' : 'No Video to download')
                            //           : Container(
                            //               height: MediaQuery.of(context).size.height *
                            //                   (MediaQuery.of(myHomecontext).size.width / MediaQuery.of(myHomecontext).size.height),
                            //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                            //               child: AspectRatio(
                            //                 aspectRatio: 0.8,
                            //                 child: ClipRRect(
                            //                   borderRadius: BorderRadius.circular(5),
                            //                   child: videos.isEmpty
                            //                       ? SizedBox.shrink()
                            //                       : CachedNetworkImage(
                            //                           imageUrl: videos.entries.first.value["thumbUrl"],
                            //                           fit: BoxFit.cover,
                            //                           placeholder: (context, url) => Container(
                            //                             color: Colors.black,
                            //                             alignment: Alignment.center,
                            //                             child: Image.asset('images/loading.gif'),
                            //                           ),
                            //                           errorWidget:
                            //                               //errorWidget:
                            //                               (_, obj, trace) {
                            //                             return Container(
                            //                               color: Colors.black,
                            //                               width: double.infinity,
                            //                               height: double.infinity,
                            //                               alignment: Alignment.center,
                            //                               child: SizedBox(
                            //                                 width: MediaQuery.of(myHomecontext).size.height * .07,
                            //                                 height: MediaQuery.of(myHomecontext).size.height * .07,
                            //                                 child: Image.asset('images/generic_thumbnail.png'),
                            //                               ),
                            //                             );
                            //                           },
                            //                         ),
                            //                 ),
                            //               ),
                            //             ),
                            //     ),
                            //   ),
                            SizedBox(
                              height: 10,
                            ),
                            // if (videos.isNotEmpty && removingExistingSelected == false)
                            //   CustomFlatButton(
                            //     callback: () => handleDownload(),
                            //     text: 'Download Video',
                            //   ),
                            SizedBox(
                              height: kBottomNavigationBarHeight + 10,
                            ),
                          ],
                        )
                      : Stack(
                          children: [
                            AbsorbPointer(
                                absorbing: (isLoading &&
                                    (dataShared != null &&
                                        !dataShared!.contains('https://vm.'))) ||isGetMore,
                                child: NestedScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    controller: _scrollController,
                                    floatHeaderSlivers: true,

                                    //physics: videos.isEmpty&&downloadedVideos.isEmpty?const NeverScrollableScrollPhysics():null,
                                    headerSliverBuilder: (BuildContext context,
                                        bool innerBoxIsScrolled) {
                                      return <Widget>[
                                        SliverAppBar(
                                          expandedHeight: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          toolbarHeight: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                          // floating: false,
                                          // pinned: true,
                                          elevation: 0,
                                          floating: true,
                                          pinned: false,
                                          // leading: CustomText(text: '$name'),
                                          flexibleSpace: LayoutBuilder(builder:
                                              (BuildContext context,
                                                  BoxConstraints constraints) {
                                            if (constraints.biggest.height <=
                                                MediaQuery.of(context)
                                                        .padding
                                                        .top +
                                                    kToolbarHeight) {
                                              if (visibletitle == false) {
                                                visibletitle = true;
                                                // visibletitleValue.value = visibletitle;
                                                print('true');
                                              }
                                            } else {
                                              if (visibletitle == true) {
                                                visibletitle = false;
                                                // visibletitleValue.value = visibletitle;

                                                print('false');
                                              }
                                            }
                                            return Container(
                                                height: (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    5),
                                                child: topWidget(context));
                                          }),
                                        ),
                                      ];
                                    },

                                    //DraggableScrollableSheet(builder:(ctx1,scrl1){return Scaffold(
                                    body: Stack(
                                      children: [
                                        // Container(height: (MediaQuery.of(context).size.height / 5), child: topWidget(context)),
                                        if (!isLoading &&
                                            videos.isEmpty &&
                                            downloadedVideos.isNotEmpty &&
                                            (((downloadedVideos.length +
                                                        videos.length) >=
                                                    allVideosCount) &&
                                                videos.isEmpty))
                                          Container(
                                            // height: MediaQuery.of(context).size.height - 180,
                                            child: GestureDetector(
                                                onTap: () => print(
                                                    downloadedVideos.length),
                                                child: const Center(
                                                    child: Text(
                                                        'No videos to download!'))),
                                          ),
                                        if ((!isLoading &&
                                                videos.isEmpty &&
                                                downloadedVideos.isNotEmpty &&
                                                (((downloadedVideos.length +
                                                            videos.length) >=
                                                        allVideosCount) &&
                                                    videos.isEmpty)) ==
                                            false)
                                          Container(
                                            color: totalGrey,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // height: MediaQuery.of(context).size.height - 200,
                                            child: dataShared == null
                                                ? Container()
                                                : name == null ||
                                                        (dataShared != null &&
                                                            dataShared!.contains(
                                                                'https://vm.')) ||
                                                        avatar == null ||
                                                        atname ==
                                                            null /* ||  allVideosCount==0 */
                                                    ? Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child:
                                                            const CircularProgressIndicator(
                                                          color: Color.fromRGBO(
                                                              //بروجرس اساسي
                                                              254,
                                                              44,
                                                              85,
                                                              1.0),
                                                        ),
                                                      )
                                                    : //Expanded(child:ListView(shrinkWrap:true,
                                                    //vsave

                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          // ( removingExistingSelected==true)|| (downloadedVideos.length+videos.length)==allVideosCount
                                                          // isLoading == true
                                                          //     ? SizedBox
                                                          //         .shrink()
                                                          //     :
                                                          Container(
                                                            height: 55,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 8.0,
                                                            ),
                                                            child: videos
                                                                    .isEmpty
                                                                // ||
                                                                //     allVideosCount ==
                                                                //         0
                                                                ? Container()
                                                                : Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            selectAll =
                                                                                !selectAll;
                                                                            if (selectAll ==
                                                                                true) {
                                                                              if (videos.length > 100) {
                                                                                for (var element in videos.entries.toList().sublist(0, 100)) {
                                                                                  selectedVideos.addAll({
                                                                                    element.key: element.value
                                                                                  });
                                                                                }
                                                                                widget.callback(0);
                                                                                if (myHomeState != null) {
                                                                                  myHomeState(() {});
                                                                                }
                                                                              } else {
                                                                                // selectedVideos = Map<int, Map<String, dynamic>>.from(videos);
                                                                                for (var element in videos.entries.toList()) {
                                                                                  selectedVideos.addAll({
                                                                                    element.key: element.value
                                                                                  });
                                                                                }
                                                                                widget.callback(0);
                                                                                if (myHomeState != null) {
                                                                                  myHomeState(() {});
                                                                                }
                                                                              }
                                                                              // print(videos);
                                                                              // getSharedPref();
                                                                            } else {
                                                                              selectedVideos = {};
                                                                              widget.callback(0);
                                                                              if (myHomeState != null) {
                                                                                myHomeState(() {});
                                                                              }
                                                                            }
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 18.0, right: 10),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(shape: BoxShape.circle, color: (selectAll == true) ? selectionColor : unselectedColor),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(1.0),
                                                                                child: (selectAll == true)
                                                                                    ? Icon(
                                                                                        Icons.check,
                                                                                        size: 27.0,
                                                                                        color: Colors.white,
                                                                                      )
                                                                                    : Icon(
                                                                                        Icons.check,
                                                                                        size: 27.0,
                                                                                        color: white,
                                                                                      ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        // Spacer(),

                                                                        // visible == true
                                                                        //     ? Text(
                                                                        //         name != null ? name! : '',
                                                                        //         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
                                                                        //         textAlign: TextAlign.center,
                                                                        //       )
                                                                        //     : SizedBox.shrink(),

                                                                        removingExistingSelected == true &&
                                                                                selectedVideos.isNotEmpty
                                                                            ? SpinKitRing(
                                                                                lineWidth: 2,
                                                                                color: Color(0xffe1e1e1),
                                                                                size: 12,
                                                                              )
                                                                            : GestureDetector(
                                                                                onTap: () {
                                                                                  Widget toast = Padding(
                                                                                    padding: const EdgeInsets.only(bottom: 28.0),
                                                                                    child: Container(
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(6.0),
                                                                                        color: black,
                                                                                      ),
                                                                                      child: const Text(
                                                                                        "You can only select a maximum of 100 videos",
                                                                                        style: TextStyle(color: white),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                  // fToast?.showToast(
                                                                                  //   gravity: ToastGravity.CENTER,
                                                                                  //   fadeDuration: Duration(milliseconds: 1000),
                                                                                  //   child: toast,
                                                                                  //   toastDuration: const Duration(seconds: 4),
                                                                                  // );
                                                                                  // mapres = jsonDecode(htmlstore.split('"ItemModule":')[1].split(',"UserModule"')[0]);
                                                                                  // // print(mapres.length);
                                                                                  // _showErrorDialog("Are you sure to cancel the download", myHomecontext);

                                                                                  // for (var i in mapres.values.toList()) {
                                                                                  //   print(i['music']['title']);
                                                                                  //   audios.add(i['music']['title'] ?? "");
                                                                                  // }
                                                                                },
                                                                                child: Container(
                                                                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: (selectAll == true || selectedVideos.isNotEmpty) ? white : Colors.transparent),
                                                                                  child: Text(
                                                                                    selectedVideos.isEmpty
                                                                                        ? ''
                                                                                        : //selectAll?
                                                                                        '${selectedVideos.length} of ${selectedVideos.length > allVideosCount - downloadedVideos.length ? selectedVideos.length : allVideosCount < 100 ? allVideosCount - downloadedVideos.length : 100}'
                                                                                    //: '${selectedVideos.length} / ${allVideosCount-downloadedVideos.length}'
                                                                                    ,
                                                                                    style: const TextStyle(color: Colors.black, fontSize: 16),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                        Spacer(),
                                                                        // CustomText(text: visibletitleValue.value == true ? name : ''),
                                                                        // Spacer(),
                                                                        if ((!originalDataShared.contains('https://vm.') ||
                                                                                !originalDataShared.contains('https://vt.')) &&
                                                                            urls.isNotEmpty)
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: (!isLoading && videos.isEmpty && downloadedVideos.isNotEmpty && (((downloadedVideos.length + videos.length) == allVideosCount) && videos.isEmpty)) ? Colors.transparent : white),
                                                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                                                              child: Row(
                                                                                children: [
                                                                                  CustomText(text: 'Total ', size: 16),
                                                                                  removingExistingSelected == true || isLoading == true
                                                                                      ? SizedBox(
                                                                                          height: 12,
                                                                                          width: 12,
                                                                                          child: (!isLoading && videos.isEmpty && downloadedVideos.isNotEmpty && (((downloadedVideos.length + videos.length) == allVideosCount) && videos.isEmpty))
                                                                                              ? SizedBox.shrink()
                                                                                              : SpinKitRing(
                                                                                                  lineWidth: 2,
                                                                                                  color: totalGrey,
                                                                                                  size: 12,
                                                                                                ),
                                                                                        )
                                                                                      : (!isLoading && videos.isEmpty && downloadedVideos.isNotEmpty && (((downloadedVideos.length + videos.length) == allVideosCount) && videos.isEmpty))
                                                                                          ? SizedBox.shrink()
                                                                                          : CustomText(text: ' ${selectedVideos.length > allVideosCount - downloadedVideos.length ? selectedVideos.length : allVideosCount - downloadedVideos.length}', size: 16),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          )
                                                                      ]),
                                                          ),

                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 0.0),
                                                              child: videos
                                                                          .isEmpty &&
                                                                      downloadedVideos
                                                                          .isEmpty
                                                                  ? Container(
                                                                      child: Center(
                                                                          child:
                                                                              Text('No videos to download!')))
                                                                  : thumbNail(), //ليست
                                                            ),
                                                          ),
                                                          //const SizedBox(height:20)
                                                        ],
                                                      ),
                                            //),
                                          ),
                                        if (isLoading &&
                                                (dataShared != null &&
                                                    !dataShared!.contains(
                                                        'https://vm.')) ||
                                            isGetMore)
                                          Container(
                                            color: Colors.white.withAlpha(128),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                          ),
                                      ],
                                    )
                                    //;}),
                                    )),
                            if (isLoading &&
                                    (dataShared != null &&
                                        !dataShared!.contains('https://vm.')) ||
                                isGetMore)
                              //Center(child:
                              Container(
                                // height: MediaQuery.of(context).size.height - 200,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        //color: Colors.white.withAlpha(50),
                                        alignment: Alignment.center,
                                        child:
                                            // Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.center,
                                            //     children: [
                                            //       Text(
                                            //         'Fetching',
                                            //         style: TextStyle(
                                            //             fontWeight: FontWeight.w700,
                                            //             fontSize: 22,
                                            //             letterSpacing: .3,
                                            //             color: Color.fromRGBO(
                                            //                 254, 44, 85, 1.0)),
                                            //       ),
                                            //       AnimatedTextKit(
                                            //         repeatForever: true,
                                            //         animatedTexts: [
                                            //           WavyAnimatedText('....',
                                            //               textStyle: TextStyle(
                                            //                   color: Color.fromRGBO(
                                            //                       254,
                                            //                       44,
                                            //                       85,
                                            //                       1.0))),
                                            //         ],
                                            //         isRepeatingAnimation: true,
                                            //         onTap: () {
                                            //           print("Tap Event");
                                            //         },
                                            //       ),
                                            //     ],
                                            //   )
                                            SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: CircularProgressIndicator(
                                              strokeWidth: 6,
                                              color: Color(0xffd8d8d8)),
                                        ), //بروجرس2
                                      ),
                                      // const SizedBox(height: 50),
                                      // InkWell(
                                      //     focusColor: Colors.transparent,
                                      //     hoverColor: Colors.transparent,
                                      //     splashColor: Colors.transparent,
                                      //     highlightColor: Colors.transparent,
                                      //     onTap: () {
                                      //       isLoading = false;
                                      //       removingExistingSelected = false;
                                      //       shouldBreak = true;
                                      //       setState(() {});
                                      //     },
                                      //     //
                                      //     child: Container(
                                      //         width: 100,
                                      //         height: 38,
                                      //         alignment: Alignment.center,
                                      //         decoration: const BoxDecoration(
                                      //             color: Color.fromARGB(
                                      //                 255, 218, 34, 10),
                                      //             borderRadius:
                                      //                 BorderRadius.all(
                                      //                     Radius.circular(8))),
                                      //         child: const Text(
                                      //           'Stop',
                                      //           style: TextStyle(
                                      //               color: Colors.white,
                                      //               fontSize: 15),
                                      //         )))
                                    ]),
                              )
                          ],
                        ),
                ),

      // bottomSheet: BottomSheet(onClosing: (){}, builder: (_){
      //   return downloadingWidget();g
      // },enableDrag: false),
      bottomNavigationBar: ((isErrorConnection ||
                  main.connectivity == ConnectivityResult.none ||
                  (!main.connectedToInternet! &&
                      main.connectivity != ConnectivityResult.vpn)) &&
              visible == true)
          ? SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height ,

                    decoration: const BoxDecoration(
                      //  color: const Color.fromARGB(255, 228, 225, 225),
                      color: Colors.white,
                      /*  borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0)) */
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 13.0, right: 15, top: 25, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                child: Image.asset(
                                  'images/error-connection.png',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              const SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                    const Text(
                                      "oop something went wrong Check Your Internet Connection2",
                                      style: TextStyle(fontSize: 13
                                          //    fontWeight: FontWeight.bold
                                          ),
                                    ),
                                    Text(
                                      '${downloadFile.value} of ${selectedVideos.length}  File/s have been downloaded successfully.Failed to download ${selectedVideos.length - downloadFile.value} file/s',
                                      style: const TextStyle(
                                        fontSize: 13,

                                        //   fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    //  Text(''),
                                  ])),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: circularProgressRetry
                                  ? null
                                  : () async {
                                      //  circularProgressRetry =true;
                                      //lastDownloadingState=isDownloading;

                                      circularProgressRetry = true;
                                      if (myHomeState != null) {
                                        myHomeState(() {});
                                      }
                                      if (await main.checkConectivity()) {
                                        //isCanceled = true;
                                        //       downloadFiles2();
                                        //        await FlutterDownloader.cancelAll();
                                        isErrorConnection = false;
                                        //_tasks?.sublist(downloadFile.value).forEach((element) async {await _retryDownload(element);});\nfor(var element in _tasks!.sublist(downloadFile.value)){await _retryDownload(element);}
                                      }

                                      if (!isErrorConnection) {
                                        isDownloading = true;
                                        visible = true;
                                        if (myHomeState != null) {
                                          myHomeState(() {});
                                        }

                                        downloadFiles(true);
                                      }
                                      Timer.periodic(const Duration(seconds: 1),
                                          (timer) {
                                        timer.cancel();
                                        circularProgressRetry = false;
                                        if (myHomeState != null) {
                                          myHomeState(() {});
                                        }
                                      });
                                    },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  circularProgressRetry
                                      ? const SizedBox(
                                          width: 12,
                                          height: 12,
                                          child: CircularProgressIndicator(
                                            //بروجرس select
                                            color: Colors.grey,

                                            strokeWidth: 1,
                                          ),
                                        )
                                      : Container(),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  circularProgressRetry
                                      ? const Text(
                                          'Trying',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                254, 44, 85, 1.0),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : const Text(
                                          'RETRY',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                254, 44, 85, 1.0),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : isErrorStorage
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height ,

                        decoration: const BoxDecoration(
                          //  color: const Color.fromARGB(255, 228, 225, 225),
                          color: Colors.white,
                          /*  borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0)) */
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 13.0, right: 15, top: 25, bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 0),
                                    child: Image.asset(
                                      'images/error-storage.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        const Text(
                                          "oop no space available for these videos, please check the space on your device",
                                          style: TextStyle(fontSize: 13
                                              //    fontWeight: FontWeight.bold
                                              ),
                                        ),
                                        Text(
                                          '${downloadFile.value} of ${selectedVideos.length}  File/s have been downloaded successfully.Failed to download ${selectedVideos.length - downloadFile.value} file/s',
                                          style: const TextStyle(
                                            fontSize: 13,

                                            //   fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        //  Text(''),
                                      ])),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: circularProgressRetry
                                      ? null
                                      : () async {
                                          circularProgressRetry = true;
                                          if (myHomeState != null) {
                                            myHomeState(() {});
                                          }
                                          await initDiskSpace();
                                          if (isErrorStorage = (diskFree! <=
                                              (totalDisk! * .035))) {
                                            //_modalBottomSheetMenu("space", "");
                                          }
                                          if (!isErrorStorage) {
                                            isDownloading = true;
                                            if (myHomeState != null) {
                                              myHomeState(() {});
                                            }
                                            /*
                                            for (var element in selectedVideos
                                                .keys.toList().sublist(downloadFile.value)) {
                                              await _retryDownload(element);
                                            }
                                                if (downloadFile.value ==
                                                    selectedVideos.length) {
                                                  isSuccessOK = true;
    if(myHomeState!=null){myHomeState((){});}
                                                }
                                            */

                                            downloadFiles(true);
                                          }
                                          Timer.periodic(
                                              const Duration(seconds: 1),
                                              (timer) {
                                            timer.cancel();
                                            circularProgressRetry = false;
                                            if (myHomeState != null) {
                                              myHomeState(() {});
                                            }
                                          });
                                        },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      circularProgressRetry
                                          ? const SizedBox(
                                              width: 12,
                                              height: 12,
                                              child: CircularProgressIndicator(
                                                //بروجرس select
                                                color: Colors.grey,

                                                strokeWidth: 1,
                                              ),
                                            )
                                          : Container(),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      circularProgressRetry
                                          ? const Text(
                                              'Trying',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    254, 44, 85, 1.0),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          : const Text(
                                              'RETRY',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    254, 44, 85, 1.0),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : null,
    );
  }

  Color getColor(Set<MaterialState> states) {
    //هاي  شيك بوكس
    /*const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
*/
    return Colors.transparent;
  }

  void BtnSettings() {
    Navigator.of(context).pop();
    openAppSettings();
  }

  void showAlert1() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Text("Please allow permission in order to use this app",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Margin(
                  horizontal: -8,
                  child: Divider(
                    height: 1,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Ok'),
                  child: const Text('No',
                      style: TextStyle(
                        color: const Color(0xff35c27d),
                      )),
                ),
              ])
        ],
      ),
    );
  }

  void showAlert2() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Text("Please allow permission in order to use this app",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Margin(
                  horizontal: -8,
                  child: Divider(
                    height: 1,
                  ),
                ),
                TextButton(
                  onPressed: () => {
                    // checkStorage()
                    BtnSettings()
                  },
                  child: const Text('Open settings',
                      style: TextStyle(color: const Color(0xff35c27d))),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Ok'),
                  child: const Text('No',
                      style: TextStyle(
                        color: const Color(0xff35c27d),
                      )),
                ),
              ])
        ],
      ),
    );
  }

  handleDownload() async {
    if (isDownloading) {
      print('object');
    } else {
      print('dcdca');
      await initDiskSpace();
      //   //debugPrint("**DiskSpace****$x***");

      const permission = Permission.storage;
      final status = await permission.status;
      debugPrint('>>>Status $status');

      /// here it is coming as PermissionStatus.granted
      if (status != PermissionStatus.granted) {
        await permission.request();
      }

      if (await permission.status.isDenied) {
        debugPrint("*************مرفوووض**************************");
        if (isPermission == "perm1") {
          CacheHelper.saveData(
            key: 'isPermission',
            value: "perm",
          );
          isPermission = "perm";
          // _modalBottomSheetMenu(
          //     "perm1",
          //     '');
          showAlert1();
        } else if (isPermission == "perm") {
          // _modalBottomSheetMenu(
          //     "perm",
          //     '');
          showAlert2();
        }
      }
      if (await permission.status.isGranted &&
          !isErrorConnection &&
          !isErrorStorage) //اذ تم السماح
      {
        showModalBottomSheet(
            elevation: 10,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            useSafeArea: true,
            enableDrag: false,
            isDismissible: false,
            transitionAnimationController: animationController,
            context: context,
            builder: (
              BuildContext context,
              /*"Animation<double> animation, Animation<double> secondaryAnimation"*/
            ) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: StatefulBuilder(builder: (BuildContext context1,
                    StateSetter setState1 /*You can rename this!*/) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    color: white,
                    padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                        top: 25 + (MediaQuery.of(context).viewPadding.top * 2),
                        bottom: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.s,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Download',
                        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          //true?
                          'Are you sure you want to continue and download the selected TikToks? You will find them in your Files app, Downloads folder.'
                          //: 'Are you want to download this video?'
                          ,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          //    textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            // padding: EdgeInsets.symmetric(horizontal: 40.0, ),
                            width: MediaQuery.of(context).size.width,

                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFlatButton(
                                  // radius: 10,
                                  text: 'No',
                                  color: tikTokBlack,
                                  width:
                                      (MediaQuery.of(context).size.width - 20) /
                                          3,
                                  // fontSize: 14,
                                  callback: () {
                                    Navigator.pop(context1);
                                    circularProgressRetry = false;
                                    isDownloading = false;
                                    if (myHomeState != null) {
                                      myHomeState(() {});
                                    }
                                  },
                                )
                                // InkWell(
                                //   onTap: () {
                                //     Navigator.pop(context1);
                                //     circularProgressRetry = false;
                                //     isDownloading = false;
                                //     if (myHomeState != null) {
                                //       myHomeState(() {});
                                //     }
                                //   },
                                //   child: const Text(
                                //     'NO',
                                //     style: TextStyle(
                                //       color: Color.fromRGBO(38, 38, 38, 1.0),
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w600,
                                //     ),
                                //     textAlign: TextAlign.center,
                                //   ),
                                // ),
                                ,
                                SizedBox(
                                  width: 60,
                                ),

                                CustomFlatButton(
                                  // radius: 10,
                                  text: 'Yes',
                                  color: tikTokRed,
                                  // fontSize: 14,
                                  width:
                                      (MediaQuery.of(context).size.width - 20) /
                                          3,
                                  callback: () async {
                                    await getDownloadingStatus()
                                        .then((value) async {
                                      if (value == true) {
                                        print('download started');
                                        Fluttertoast.showToast(
                                            msg: 'download started');
                                      } else {
                                        print('download not started');
                                        if (originalDataShared
                                                .contains('https://vm.') ||
                                            originalDataShared
                                                .contains('https://vt.')) {
                                          selectedVideos = {
                                            videos.entries.first.key:
                                                videos.entries.first.value
                                          };
                                        }
                                        Navigator.pop(context1);
                                        circularProgressRetry = false;
                                        isDownloading = true;
                                        visible = true;
                                        widget.callback(0);
                                        if (myHomeState != null) {
                                          myHomeState(() {});
                                        }
                                        if (!FlutterBackground
                                            .isBackgroundExecutionEnabled) {
                                          const androidConfig =
                                              FlutterBackgroundAndroidConfig(
                                            notificationTitle: " ",
                                            notificationText: "",
                                            notificationImportance:
                                                AndroidNotificationImportance
                                                    .Default,
                                            notificationIcon: AndroidResource(
                                                name: 'background_icon',
                                                defType:
                                                    'drawable'), // Default is ic_launcher from folder mipmap
                                          );

                                          await FlutterBackground.initialize(
                                                  androidConfig: androidConfig)
                                              .whenComplete(() async {
                                            await FlutterBackground
                                                .enableBackgroundExecution();
                                          });
                                        }
                                        await initDiskSpace();
                                        if (isErrorStorage = (diskFree! <=
                                            (totalDisk! * .035))) {
                                          //_modalBottomSheetMenu("space", "");
                                        } else if (await main
                                            .checkConectivity()) {
                                          //isCanceled = true;
                                          isErrorConnection = false;
                                          isDownloading = true;
                                          downloadFile.value = 0;
                                          downloadFiles();
                                          //if (!mounted) return;
                                        } else {
                                          isErrorConnection = true;
                                        }
                                        if (myHomeState != null) {
                                          myHomeState(() {});
                                        }
                                      }
                                    });
                                  },
                                ),
                                // InkWell(
                                //   onTap: () async {
                                //     await getDownloadingStatus().then((value) async {
                                //       if (value == true) {
                                //         print('download started');
                                //         Fluttertoast.showToast(msg: 'download started');
                                //       } else {
                                //         print('download not started');
                                //         if (originalDataShared.contains('https://vm.') || originalDataShared.contains('https://vt.')) {
                                //           selectedVideos = {videos.entries.first.key: videos.entries.first.value};
                                //         }
                                //         Navigator.pop(context1);
                                //         circularProgressRetry = false;
                                //         isDownloading = true;
                                //         visible = true;
                                //         widget.callback(0);
                                //         if (myHomeState != null) {
                                //           myHomeState(() {});
                                //         }
                                //         if (!FlutterBackground.isBackgroundExecutionEnabled) {
                                //           const androidConfig = FlutterBackgroundAndroidConfig(
                                //             notificationTitle: " ",
                                //             notificationText: "",
                                //             notificationImportance: AndroidNotificationImportance.Default,
                                //             notificationIcon:
                                //                 AndroidResource(name: 'background_icon', defType: 'drawable'), // Default is ic_launcher from folder mipmap
                                //           );

                                //           await FlutterBackground.initialize(androidConfig: androidConfig).whenComplete(() async {
                                //             await FlutterBackground.enableBackgroundExecution();
                                //           });
                                //         }
                                //         await initDiskSpace();
                                //         if (isErrorStorage = (diskFree! <= (totalDisk! * .035))) {
                                //           //_modalBottomSheetMenu("space", "");
                                //         } else if (await main.checkConectivity()) {
                                //           //isCanceled = true;
                                //           isErrorConnection = false;
                                //           isDownloading = true;
                                //           downloadFile.value = 0;
                                //           downloadFiles();
                                //           //if (!mounted) return;
                                //         } else {
                                //           isErrorConnection = true;
                                //         }
                                //         if (myHomeState != null) {
                                //           myHomeState(() {});
                                //         }
                                //       }
                                //     });
                                //   },
                                //   child: const Text(
                                //     //كونتنتيو
                                //     'CONTINUE',
                                //     style: TextStyle(
                                //       color: Color.fromRGBO(254, 44, 85, 1.0),
                                //       fontSize: 15,
                                //       fontWeight: FontWeight.w600,
                                //     ),
                                //     textAlign: TextAlign.center,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            }).whenComplete(() {
          animationController = BottomSheet.createAnimationController(this);
          animationController!.duration = Duration(microseconds: 20);
          animationController!.reverseDuration = Duration(microseconds: 20);
        });
      } else {
        // // await permission
        // //     .request();
        // //debugPrint("nexttt");
        // if(isPermission=="perm1"){
        //   CacheHelper.saveData(key: 'isPermission', value: "perm",);
        //   isPermission = "perm";
        //   _modalBottomSheetMenu("perm1", '');
        // // }else if(isPermission=="perm2"){
        // //   CacheHelper.saveData(key: 'isPermission', value: "perm",);
        // //   isPermission = "perm";
        // //   _modalBottomSheetMenu("perm2", '');
        // }
        //
        //
        // debugPrint(
        //     "Permission denied");
      }

      // List<Downloading> downloads = await getStatus();

      // dlStatusinit(checkTimer: false);
      // await getDownloadingStatus().then((value) async {
      //   if (value == false) {
      //  ********************here******************************
      //   } else {
      //     showDoawnloadingDialog(context: context);
      //   }
      // });
    }
    ;
  }

  Future<bool> getDownloadingStatus({bool checkTimer = false}) async {
    checkingStatus = true;
    List<Downloading> downloads = await getStatus();
    print(downloads);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDowloading;
    if (downloads.isNotEmpty) {
      initialCounterVal = downloads[0].counter!;
      // isDowloading = downloads[0].downloading == 0 ? false : true;
      if (downloads[0].downloading == 1) {
        await Future.delayed(Duration(seconds: 2)).whenComplete(() async {
          List<Downloading> dl2 = await getStatus();
          if (initialCounterVal == dl2[0].counter!) {
            await updateDownload(Downloading(
              downloading: 0,
              avatar: prefs.getString('avatar')!,
              counter: 0,
              id: 1,
            ));
            isDowloading = false;
            checkingStatus = false;
            myHomeState(() {});
            print('download status is set to false');
          } else {
            isDowloading = true;
            print('currently ongoing download');
            checkingStatus = false;
          }
        });
        return isDowloading!;
      } else {
        isDowloading = false;
        print('no ongoing download first');
        checkingStatus = false;
        myHomeState(() {});
        return isDowloading;
      }
    } else {
      isDowloading = false;
      print('false4');
      checkingStatus = false;
      myHomeState(() {});
      return isDowloading;
    }
  }

  dlStatusinit({bool checkTimer = false}) async {
    await getDownloadingStatus().then((value) {
      if (value == true) {
        print('value4');

        showDoawnloadingDialog(context: context);
      } else {
        print('false');
      }
    });
  }

  alterTable(String s) async {
    final db = await dbRef();
    try {
      await db.execute("ALTER TABLE status ADD "
          "COLUMN $s TEXT;");
      print('table status is ${await db.query('status')}');
    } catch (e) {
      print(e.toString());
      print('table status is ${await db.query('status')}');
    }
  }

  downloadingWidget() {
    print("downloadingWidget;");
    return (!visible) &&
            (main.connectivity != ConnectivityResult.none &&
                main.connectivity != ConnectivityResult.vpn)
        ? SizedBox.shrink()
        : ValueListenableBuilder(
            valueListenable: downloadFile,
            builder: (context1, value, _) {
              //RThis
              //setState(() {});
              return BottomSheet(
                enableDrag: false,
                builder: (context) {
                  return SizedBox(
                    //ye
                    // height: MediaQuery.of(context).size.height,
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 228, 225, 225),
                          /*  borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0)) */
                        ),
                        height: MediaQuery.of(context).size.height,
                        child: ValueListenableBuilder(
                            valueListenable: downloadProgress2,
                            builder: (context1, value, _) {
                              double percent = downloadProgress2.value /
                                      selectedVideos.length +
                                  (1.0 / selectedVideos.length) *
                                      downloadFile.value;
                              // print(
                              //     "$percent - ${selectedVideos.length} - ${downloadFile.value} - ${downloadProgress2.value} ");
                              bool isDone =
                                  downloadFile.value == selectedVideos.length;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Padding(
                                  //     padding: const EdgeInsets.only(top: 15),
                                  //     child: Image.asset(
                                  //       'images/Download.png',
                                  //       height: 70,
                                  //       width: 70,
                                  //     )),

                                  /*      Padding(
                              padding: const EdgeInsets.only(bottom: 20, top: 20),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10,
                                children: [
                                  Text('Current'),
                                  LinearProgressIndicator(value: (downloadProgress)),
                                ],
                              )), */
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.5),
                                    child: Text(
                                      '$name',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CircularPercentIndicator(
                                      radius: 100.0,
                                      animation: false,
                                      animationDuration: 1200,
                                      lineWidth: 22.0,
                                      percent: (isFail)
                                          ? 0
                                          : ((isDone) ? 1 : percent),
                                      // ((downloadFile.value + (downloadProgress < 100   ? downloadProgress / 100 : 0)) / selectedVideos.length) ==
                                      //         double.infinity
                                      //     ? 0
                                      //     : ((downloadFile.value + (downloadProgress < 100 ? downloadProgress / 100 : 0)) / selectedVideos.length) > 1
                                      //         ? 1 : (downloadFile.value + (downloadProgress < 100  ? downloadProgress / 100 : 0)) /  selectedVideos.length,
                                      center: ClipOval(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 86,
                                          child: Stack(
                                            children: [
                                              CachedNetworkImage(
                                                placeholder: (BuildContext
                                                            context,
                                                        _) =>
                                                    Image.asset(
                                                        'images/generic_author.png'),
                                                imageUrl: avatar!,
                                                height: 280,
                                                width: 280,
                                                fit: BoxFit.cover,
                                                errorWidget: (_, obj, trace) {
                                                  return Image.asset(
                                                      'images/generic_author.png');
                                                },
                                              ),
                                              GestureDetector(
                                                onTap: () => print(avatar),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  radius: 86,
                                                  child: isDownloadAll ==
                                                              true &&
                                                          !isCanceled
                                                      ? Container(
                                                          color: white
                                                              .withOpacity(.6),
                                                          child: Center(
                                                              child:
                                                                  Image.asset(
                                                            'images/download_success.png',
                                                            height: 120,
                                                            color: greenSuccess,
                                                          )),
                                                        )
                                                      : SizedBox.shrink(),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      // circularStrokeCap: CircularStrokeCap.round,
                                      backgroundColor: Colors.grey,
                                      progressColor: isDownloadAll == true &&
                                              isCanceled == false
                                          ? greenSuccess
                                          : Colors.blue,
                                    ),
                                    // LinearProgressIndicator(
                                    //   semanticsValue: downloadProgress.toString(),
                                    //   value: (downloadFile.value + (downloadProgress < 100 ? downloadProgress / 100 : 0)) / selectedVideos.length,
                                    // ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18.0, bottom: 18.0),
                                    child:
                                        // ? Text("Download faild")
                                        // :
                                       (! isCanceled && !isGetMore && isDownloading)?
                                          Text(
                                            //downloadFile.value
                                            //downloadedVideos.length
                                            (percent == 0.0 )
                                                ? 'Preparing...'
                                                : 'Video ${downloadFile.value} of ${selectedVideos.length} downloaded' /*  ' ${selectedVideos[downloadFile.value]["id"]} .mp4'*/,
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ): SizedBox.shrink(),
                                  ),
                                  /*
                   Padding(
                     padding: const EdgeInsets.only(top: 10),
                     child: LinearProgressIndicator(
                       semanticsValue: downloadProgress.toString(),
                       value: downloadProgress,
                     ),
                   ),
                   */
                                  isDownloading == false
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                // height: 100,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // isCanceled == false
                                                    //     ? SizedBox.shrink()
                                                    //     : Padding(
                                                    //         padding: const EdgeInsets.symmetric(vertical: 0),
                                                    //         child: Image.asset(
                                                    //           isCanceled ? 'images/cancelled.png' : 'images/success.png',
                                                    //           height: 60,
                                                    //           width: 60,
                                                    //         ),
                                                    //       ),
                                                    // SizedBox(
                                                    //   width: 20,
                                                    // ),
                                                    isCanceled
                                                        ? SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                30,
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '${downloadFile.value} of ${selectedVideos.length} Files have been downloaded successfully.',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      //    fontWeight: FontWeight.bold
                                                                    ),
                                                                  ),
                                                                  CustomText(
                                                                    text:
                                                                        'Failed to download ${selectedVideos.length - downloadFile.value} ',
                                                                    maxLines: 7,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ]),
                                                          )
                                                        : Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 1),
                                                            child: SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  30,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  print(downloadFile
                                                                          .value +
                                                                      downloadedVideos
                                                                          .length);
                                                                },
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      '${downloadFile.value} of ${selectedVideos.length} Files have been downloaded successfully',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        //    fontWeight: FontWeight.bold
                                                                      ),
                                                                      maxLines:
                                                                          5,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              CustomFlatButton(
                                                width: 150,
                                                radius: 25,
                                                isSpinner:isGetMore,
                                                isDisabled:isGetMore,
                                                text: (originalDataShared
                                                        .contains(
                                                            'https://www.tiktok'))
                                                    ? (downloadedVideos
                                                                    .length ==
                                                                allVideosCount) ||
                                                            (downloadFile
                                                                        .value +
                                                                    downloadedVideos
                                                                        .length ==
                                                                allVideosCount)
                                                        ? 'Exit'
                                                        : 'Get More Videos'
                                                    : 'Exit',
                                                callback: isSuccessOK ==
                                                            false
                                                    // ||
                                                    //     cancelingDl == true
                                                    ? () {
                                                        print('ongoing cancel');
                                                      }
                                                    :
                                                    () async {
                                                        print(
                                                            'restart-------------');
                                                        if ((downloadedVideos
                                                            .length ==
                                                        allVideosCount) ||
                                                        (downloadFile
                                                            .value +
                                                        downloadedVideos
                                                            .length ==
                                                        allVideosCount)) {
                                                        SystemChannels
                                                            .platform
                                                            .invokeMethod(
                                                        'SystemNavigator.pop');
                                                        } else {
                                                          isDownloading = false;
                                                          isGetMore = true;
                                                          isCanceled = false;
                                                          isSuccessOK = false;
                                                          isDownloadAll = false;
                                                          selectAll = false;
                                                          cancelingDl = true;
                                                          // visible = false;
                                                          removingExistingSelected =
                                                          true;
                                                          isloadingVideos =
                                                          true;

                                                          // selectedVideos.clear();
                                                          if (myHomeState !=
                                                              null) {
                                                            myHomeState(() {});
                                                          }
                                                          inAppWebViewFunc(
                                                              context: context);
                                                        }
                                                        return;
                                                        widget.pageController
                                                            ?.jumpToPage(1);
                                                        if (originalDataShared
                                                                .contains(
                                                                    'https://vm.') ||
                                                            originalDataShared
                                                                .contains(
                                                                    'https://vt.')) {
                                                          print(
                                                              checkWhetherExisting(
                                                                  selectedVideos
                                                                      .entries
                                                                      .first
                                                                      .key));

                                                          if (checkWhetherExisting(
                                                                  selectedVideos
                                                                      .entries
                                                                      .first
                                                                      .key) ==
                                                              true) {
                                                            SystemChannels
                                                                .platform
                                                                .invokeMethod(
                                                                    'SystemNavigator.pop');
                                                          } else {
                                                            visible = false;
                                                            if (myHomeState !=
                                                                null) {
                                                              myHomeState(
                                                                  () {});
                                                            }
                                                          }
                                                        } else {
                                                          print(
                                                              'contains vm${originalDataShared.contains('https://vm.')} contains vt${originalDataShared.contains('https://vt.')}');
                                                          if ((downloadedVideos
                                                                      .length ==
                                                                  allVideosCount) ||
                                                              (downloadFile
                                                                          .value +
                                                                      downloadedVideos
                                                                          .length ==
                                                                  allVideosCount)) {
                                                            SystemChannels
                                                                .platform
                                                                .invokeMethod(
                                                                    'SystemNavigator.pop');
                                                          } else {
                                                            isDownloading =
                                                                false;
                                                            isCanceled = false;
                                                            isSuccessOK = false;
                                                            isDownloadAll =
                                                                false;
                                                            cancelingDl = true;
                                                            visible = false;
                                                            removingExistingSelected =
                                                                true;
                                                            if (myHomeState !=
                                                                null) {
                                                              myHomeState(
                                                                  () {});
                                                            }

                                                            //vsuc1
                                                            // Navigator.pop(context);

                                                            for (int vid
                                                                in selectedVideos
                                                                    .keys
                                                                    .toList()
                                                                    .sublist(
                                                                        0,
                                                                        downloadFile
                                                                            .value)) {
                                                              downloadedVideos
                                                                  .addAll({
                                                                vid:
                                                                    selectedVideos[
                                                                        vid]!
                                                              });
                                                            }
                                                            if ((!originalDataShared
                                                                    .contains(
                                                                        'https://vm.')) &&
                                                                (!originalDataShared
                                                                    .contains(
                                                                        'https://vt.'))) {
                                                              // Fluttertoast.showToast(msg: 'msg 777777777');
                                                              videos.removeWhere((vid,
                                                                      x) =>
                                                                  selectedVideos
                                                                      .keys
                                                                      .toList()
                                                                      .sublist(
                                                                          0,
                                                                          downloadFile
                                                                              .value)
                                                                      .contains(
                                                                          vid));
                                                              noTitleIds.removeWhere((element) =>
                                                                  selectedVideos
                                                                          .containsKey(
                                                                              int.parse(element))
                                                                      ? true
                                                                      : false);
                                                            }

                                                            cancelingDl = false;

                                                            //downloadedVideoIDs.clear();
                                                            if (myHomeState !=
                                                                null) {
                                                              myHomeState(
                                                                  () {});
                                                            }
                                                            // print('VIDEOS ARE $videos');
                                                            Timer(
                                                                Duration(
                                                                    seconds: 5),
                                                                () {
                                                              downloadFile
                                                                  .value = 0;

                                                              selectedVideos
                                                                  .clear();
                                                              if (videos
                                                                      .isNotEmpty &&
                                                                  selectAll ==
                                                                      true) {
                                                                if (videos
                                                                        .length >
                                                                    100) {
                                                                  // print(videos.entries.toList().sublist(0, 100));
                                                                  // videos.
                                                                  for (var element in videos
                                                                      .entries
                                                                      .toList()
                                                                      .sublist(
                                                                          0,
                                                                          100)) {
                                                                    // print('${element.value['downloadAddr']}');
                                                                    selectedVideos
                                                                        .addAll({
                                                                      element.key:
                                                                          element
                                                                              .value
                                                                    });
                                                                  }
                                                                  // print(selectedVideos.length);
                                                                  // selectedVideos = Map<int, Map<String, dynamic>>.from(videos.entries.);
                                                                } else {
                                                                  // selectedVideos = Map<int, Map<String, dynamic>>.from(videos);
                                                                  for (var element
                                                                      in videos
                                                                          .entries
                                                                          .toList()) {
                                                                    selectedVideos
                                                                        .addAll({
                                                                      element.key:
                                                                          element
                                                                              .value
                                                                    });
                                                                  }
                                                                }
                                                              }
                                                              if (videos
                                                                  .isNotEmpty) {
                                                                // getSharedPref();
                                                                if (myHomeState !=
                                                                    null) {
                                                                  myHomeState(
                                                                      () {
                                                                    removingExistingSelected =
                                                                        false;
                                                                    widget
                                                                        .callback(
                                                                            0);
                                                                  });
                                                                }
                                                              } else {}
                                                              if (myHomeState !=
                                                                  null) {
                                                                myHomeState(
                                                                    () {});
                                                              }
                                                            });

                                                            if (videos
                                                                    .isEmpty &&
                                                                allVideosCount >=
                                                                    0) {
                                                              // Fluttertoast.showToast(msg: 'msg 3333333dcdc333333');
                                                              await more()
                                                                  .catchError(
                                                                      (e) {
                                                                isLoading =
                                                                    false;
                                                                removingExistingSelected =
                                                                    false;
                                                                isLoadingMore =
                                                                    false;
                                                                if (myHomeState !=
                                                                    null) {
                                                                  myHomeState(
                                                                      () {});
                                                                }
                                                              });
                                                            }
                                                          }
                                                        }
                                                      },
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              CustomFlatButton(
                                                width: 150,
                                                radius: 25,
                                                isDisabled:isGetMore,
                                                callback: () {
                                                  widget.callback(1);
                                                },
                                                text: 'VIEW',
                                              )
                                            ],
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: (isFail)
                                              ? InkWell(
                                                  onTap: () async {
                                                    //_tasks?.sublist(downloadFile.value).forEach((element)async{await _pauseDownload(element);});
                                                    //for(var element in selectedVideos.sublist(downloadFile.value)){await _pauseDownload(element);}

                                                    //isDownloading = false;
                                                    //if(myHomeState!=null){myHomeState((){});}
                                                    isFail = false;
                                                    myHomeState(() {});
                                                  },
                                                  child: Container(
                                                      height: 38,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8))),
                                                      child: const Text(
                                                        'Retry',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )),
                                                )
                                              : InkWell(
                                                  onTap: () async {
                                                    //_tasks?.sublist(downloadFile.value).forEach((element)async{await _pauseDownload(element);});
                                                    //for(var element in selectedVideos.sublist(downloadFile.value)){await _pauseDownload(element);}

                                                    //isDownloading = false;
                                                    //if(myHomeState!=null){myHomeState((){});}
                                                    _showErrorDialog(
                                                        "Are you sure you want to cancel downloading? This will only cancel TikToks that have not yet been downloaded",
                                                        myHomecontext);
                                                  },
                                                  child: Container(
                                                      height: 38,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: const BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8))),
                                                      child: const Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      )),
                                                ),
                                        ),
                                ],
                              );
                            })),
                  );
                },
                onClosing: () {},
              );
            });
  }

  thumbNail() {
    return ListView(
      // controller: _controller,
      padding: EdgeInsets.only(bottom: 0, top: 0),
      children: [
        Container(
          color: Color(0xffEEEEEE),
          child: (videos.isEmpty)
              ? Container(
                  child: Center(child: Text('')),
                )
              : GridView.builder(
                  padding: EdgeInsets.only(
                      top: 0, bottom: selectedVideos.isNotEmpty ? 10 : 10),
                  // itemCount: videosToShow >= videos.length ? videos.length : videosToShow, //videos.length
                  itemCount: videos.isEmpty ? 0 : videos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 3,
                    // childAspectRatio: 0.7,
                    mainAxisSpacing: 9,
                    mainAxisExtent: MediaQuery.of(context).size.height / 5,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, i) {
                    int index = videos.keys.toList()[i];
                    return
                        // getExistingVideos().contains(index.toString())
                        //   ? SizedBox.shrink()
                        //   :
                        GestureDetector(
                      onTap: allVideosCount == 0 ||
                              isLoading //||itIsLoadingAtStartUp
                          //isDownloading //بدلتها ب هاي
                          ? () async {
                              print('object');
                            }
                          : () {
                              if (selectedVideos.containsKey(index)) {
                                //trimmedVideos[index]  الفييديو  الي ضغطنا عليه
                                selectedVideos.remove(index);
                                if (selectedVideos.isEmpty) {
                                  selectAll = false;
                                }
                              } else {
                                // print(audios[i]);
                                getExistingVideos().contains(index.toString());
                                // if(selected)
                                if (selectedVideos.length == 100) {
                                  // Fluttertoast.showToast(msg: 'You can only select a maximum of 100 videos');
                                  Widget toast = Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 28.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        color: black,
                                      ),
                                      child: const Text(
                                        "You can only select a maximum of 100 videos",
                                        style: TextStyle(color: white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );

                                  fToast?.showToast(
                                    gravity: ToastGravity.CENTER,
                                    fadeDuration: Duration(milliseconds: 1000),
                                    child: toast,
                                    toastDuration: const Duration(seconds: 4),
                                  );
                                } else {
                                  selectedVideos
                                      .addAll({index: videos[index]!});
                                }
                                // print(selectedVideos.length == videos.length);
                              }
                              widget.callback(0);
                              // print(videoQuality);
                              if (myHomeState != null) {
                                myHomeState(() {});
                              }
                            },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                          color: selectedVideos.containsKey(index)
                              ? Color(0XFFEED9DE)
                              : white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 2),
                                blurRadius: 1,
                                spreadRadius: 2,
                                color: grey.shade200)
                          ],
                        ),
                        // padding: EdgeInsets.all(4),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // width: 200,
                              // padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6)),
                              child:

                                  //CachedNetworkImage(imageUrl://Image.network(
                                  AspectRatio(
                                aspectRatio: 0.8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                      topLeft: Radius.circular(6)),
                                  child: CachedNetworkImage(
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    fadeInCurve: Curves.easeIn,
                                    imageUrl: videos[index]!["thumbUrl"],
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      color: Color(0xff181d39),
                                      alignment: Alignment.center,
                                      child: CircularProgressIndicator(
                                          color: Color(0xff7391c3)),
                                    ),
                                    errorWidget:
                                        //errorWidget:
                                        (_, obj, trace) {
                                      return Container(
                                        color: Colors.black,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          width: MediaQuery.of(myHomecontext)
                                                  .size
                                                  .height *
                                              .07,
                                          height: MediaQuery.of(myHomecontext)
                                                  .size
                                                  .height *
                                              .07,
                                          child: Image.asset(
                                              'images/generic_thumbnail.png'),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),

                            Expanded(
                              child: Container(
                                // alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 5,
                                padding: const EdgeInsets.all(6),
                                child: AutoSizeText(
                                  removingExistingSelected == true &&
                                          videos.isEmpty
                                      ? ''
                                      // : '${videos[index]!["title"].toString().isEmpty ? bio == 'No bio yet.' ? audios[i].toString().isNotEmpty ? audios[i] : 'Video -${noTitleIds.indexOf(index.toString()) + 1}' : '${bio!.replaceAll("\n", "")}-${noTitleIds.indexOf(index.toString()) + 1}' : videos[index]!["title"]} ${videos[index]!["title"].toString().isEmpty ? bio == 'No bio yet.' ? audios[i].toString().isNotEmpty ? audios[i] : 'Video -${noTitleIds.indexOf(index.toString()) + 1}' : '${bio!.replaceAll("\n", "")}-${noTitleIds.indexOf(index.toString()) + 1}' : videos[index]!["title"]} ${videos[index]!["title"].toString().isEmpty ? bio == 'No bio yet.' ? audios[i].toString().isNotEmpty ? audios[i] : 'Video -${noTitleIds.indexOf(index.toString()) + 1}' : '${bio!.replaceAll("\n", "")}-${noTitleIds.indexOf(index.toString()) + 1}' : videos[index]!["title"]} ', // fontWeight: FontWeight.normal,

                                      : '${videos[index]!["title"].toString().isEmpty ? audios[i].toString().isNotEmpty ? audios[i] : bio == 'No bio yet.' ? '${bio!.replaceAll("\n", "")}-${noTitleIds.indexOf(index.toString()) + 1}' : 'Video -${noTitleIds.indexOf(index.toString()) + 1}' : videos[index]!["title"]} ',
                                  // fontWeight: FontWeight.normal,
                                  // size: 12,
                                  style: TextStyle(
                                      color: (selectedVideos.containsKey(index))
                                          ? selectionColor
                                          : black),
                                  maxLines: (MediaQuery.of(context)
                                              .size
                                              .height /
                                          (MediaQuery.of(context).size.height /
                                              5))
                                      .floor(),
                                  presetFontSizes: [14],
                                  wrapWords: false,
                                  // maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  softWrap: false,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),

                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (selectedVideos.containsKey(index))
                                          ? selectionColor
                                          : unselectedColor),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: (selectedVideos.containsKey(index))
                                        ? Icon(
                                            Icons.check,
                                            size: 27.0,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.check,
                                            size: 27.0,
                                            color: white,
                                          ),
                                  ),
                                ),
                              ),
                            )
                            // Checkbox(
                            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            //     fillColor: MaterialStateProperty.all(Color.fromRGBO(147, 242, 237, 1.0)),
                            //     value: selectedVideos.containsKey(index),
                            //     onChanged: (val) {
                            //       if (selectedVideos.containsKey(index)) {
                            //         //trimmedVideos[index]  الفييديو  الي ضغطنا عليه
                            //         selectedVideos.remove(index);
                            //         selectAll = false;
                            //       } else {
                            //         // print(selectedVideos.length);
                            //         if (selectedVideos.length == 100) {
                            //           Fluttertoast.showToast(msg: 'You can only select a maximum of 100 videos');
                            //         } else {
                            //           selectedVideos.addAll({index: videos[index]!});
                            //         }
                            //       }
                            //       widget.callback(0);
                            //       if (myHomeState != null) {
                            //         myHomeState(() {});
                            //       }
                            //     })
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
        !allPageLoaded &&
                (allVideosCount == 0 ||
                    videos.length + downloadedVideos.length >=
                        allVideosCount) // -3 //allVideosCount عدد الفيديوها الي جاية من التيك توك
            ? Container(
                height: selectedVideos.isNotEmpty ? 50 : 0,
              ) //
            : isLoading //كل الفيديوهات الي جيات من التيك توك محملات
                ? Container(
                    //الكونتينر الأزرق الي بيظهر فوق كلمة مور بقا لمن اضغط عليها
                    //  height: 54,
                    color: Colors.blue,
                    alignment: Alignment.center,
                  )
                : Container(
                    // height: 80,
                    color: isLoading ? Colors.transparent : white,
                    padding:
                        EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
                    margin: EdgeInsets.only(
                      bottom: 12,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomFlatButton(
                              elevation: 0,
                              width:
                                  (MediaQuery.of(context).size.width / 3) - 10,
                              radius: 5,
                              fontSize: 14,
                              color: Color(0xffF1F1F1),
                              callback: isLoading
                                  ? () async {}
                                  : () async {
                                      // print(allVideosCount);
                                      await more().catchError((e) {
                                        isLoading = false;
                                        isGetMore = false;
                                        removingExistingSelected = false;
                                        if (myHomeState != null) {
                                          myHomeState(() {});
                                        }
                                      });
                                    },
                              text:
                                  'Next (${allVideosCount > (videos.length + downloadedVideos.length) + 30 ? 30 : allVideosCount - (videos.length + downloadedVideos.length)})',
                              textColor: black,
                            ),
                            SizedBox(
                              width: (allVideosCount >
                                      videos.length +
                                          downloadedVideos.length +
                                          30)
                                  ? 100
                                  : 0,
                            ),
                            if (allVideosCount >
                                videos.length + downloadedVideos.length + 30)
                              CustomFlatButton(
                                elevation: 0,
                                width: (MediaQuery.of(context).size.width / 3) -
                                    10,
                                radius: 5,
                                fontSize: 14,
                                color: Color(0xffF1F1F1),
                                callback: isLoading
                                    ? () async {}
                                    : () async {
                                        more(false, true);
                                      },
                                text:
                                    'All (${allVideosCount - (videos.length + downloadedVideos.length)})',
                                textColor: black,
                              ),
                          ]),
                    ),
                  ),
        isLoading
            ? SizedBox(
                height: (selectedVideos.isNotEmpty ? 00 : 0) +
                    kBottomNavigationBarHeight,
              )
            : Container(
                height: (selectedVideos.isNotEmpty ? 0 : 0) +
                    kBottomNavigationBarHeight,
                width: MediaQuery.of(context).size.width,
                color: isLoading ||
                        (allVideosCount == 0 ||
                            videos.length + downloadedVideos.length >=
                                allVideosCount)
                    ? Colors.transparent
                    : Colors.transparent,
              )
      ],
    );
  }

  inAppWebViewFunc({BuildContext? context}) async {
//debugPrint(dataShared!);
//vinappweb
    //vinappview
    //dataShared == null? Container():
    //SizedBox(height: 1,width: 1,child:
    headlessWebView1 = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(dataShared!)),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
            preferredContentMode: UserPreferredContentMode.DESKTOP,
            useShouldInterceptFetchRequest: false
            //true, //prevent loadmore on tiktok page
            ),
      ),
      onTitleChanged: (controller, title) async {
        //if(!isPageLoaded1){isPageLoaded1=true;//if(!isDownloading&&!isLoading){
        controller.getHtml().then((value) {
          avatar = value!
              .split('property="og:image" content="')[1]
              .split('"><meta')[0];
          //bio=value.split('user-bio')[1].split('">')[1].split('<')[0];
        });
        if (avatar != null) {
          webViewController!.clearCache().then((value) {
            name = title!.split(' (@')[0];
            atname = '@${title.split(' (@')[1].split(')')[0]}';
          });
        } else {
          name = title!.split(' (@')[0];
          atname =
              '@${title.contains(' (@') ? title.split(' (@')[1].split(')')[0] : ""}';
        }
        // if (myHomeState != null) {
        //   myHomeState(() {});
        // }
        //}
      },
      onLoadStop: (controller, uri) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // if ((originalDataShared.contains('https://vm.')) &&
        //     (dataShared!.contains('https://vm.')) &&
        //    ( !(await controller.getUrl()).toString().contains('https://vm.'))) {
        //   // Fluttertoast.showToast(msg: 'dcdcdc');
        //   //if(dataShared!.contains('/video/')){dataShared=dataShared!.split('/video/').first;}
        //   String url = (await controller.getUrl()).toString();
        //   debugPrint('urlIShere:$url');
        //   await controller.loadUrl(urlRequest: URLRequest(url: Uri.parse(dataShared = url.split('/video/').first)));
        //   selectedVideos.addAll({
        //     int.parse(url.split('/video/').last.split('?').first): {
        //       "id": url.contains('/video/') ? url.split('/video/').last.split('?').first : '',
        //       "url": url,
        //       "thumbUrl": '',
        //       "watchesCount": 0,
        //       "downloadAddr": null
        //     }
        //   });
        //   // Fluttertoast.showToast(msg: 'direct to dl');
        //   // downloadFiles();
        // }
        //if(!isPageLoaded3){isPageLoaded3=true;//if(!isDownloading&&!isLoading){

        String? html;
        html = await controller.getHtml();
        avatar = html!
            .split('<meta data-rh="true" property="og:image" content="')[1]
            .split('">')[0];

        print('BIOOO STOPlOAD $bio');

        print('the avatar is is present $avatar');
        bio = html.contains('user-bio')
            ? escapeUnicodes(
                html.split('user-bio')[1].split('">')[1].split('<')[0])
            : '';
        // Fluttertoast.showToast(msg: bio.toString());
        data = parse(html);
        List<Downloading> downloads = await getStatus();
        print('runtym $downloads');

        htmlstore = '';
        // print('html $html');
        htmlstore = html;
        htmlstorecontroller.text = html;
        if (!originalDataShared.contains('https://vm.') &&
            !originalDataShared.contains('https://vt.')) {
          // Fluttertoast.showToast(msg: dataShared!);
          initialVideosListData = jsonDecode(
              html.split('"ItemModule":')[1].split(',"UserModule"')[0]);
          images = data
              .querySelectorAll(
                  'div > div > a > div > div.tiktok-1jxhpnd-DivContainer.e1yey0rl0 > img')
              .map((element) => element.attributes['src'].trim())
              .toList();
          titles = data
              .querySelectorAll(
                  'div > div > a > div > div.tiktok-1jxhpnd-DivContainer.e1yey0rl0 > img')
              .map((element) => element.attributes['alt'].trim())
              .toList();

          //  mapres = jsonDecode(html.split('type="application/json">')[1].split('</script>')[0]);

          mapres = jsonDecode(
              htmlstore.split('"ItemModule":')[1].split(',"UserModule"')[0]);

          for (var i in mapres.values.toList()) {
            print(i['music']['title']);
            audios.add(i['music']['title'] ?? "");
          }
          urls = data
              .querySelectorAll("a[href*='www.tiktok.com/$atname/video/']")
              .map((element) => element.attributes['href'].trim())
              .toList();
          watches = data
              .querySelectorAll(
                  'div > div > a > div > div.tiktok-11u47i-DivCardFooter.e148ts220 > strong')
              .map((element) => element.text)
              .toList();
          allVideosCount = int.parse(
              html.split(',"videoCount":')[1].split(',"diggCount"')[0]);
          print(
              'count${int.parse(html.split(',"videoCount":')[1].split(',"diggCount"')[0])}');
          //videos =
          print('urls ${urls.length}');
          print('images ${images.length}');
          print('-- all videos $allVideosCount');
          print('$titles');
          if (myHomeState != null && urls.length == 0 && images.length != 0) {
            isMetaChanged = true;
            myHomeState(() {});
          }
          var generated = List //<VideoModel>
              .from(List.generate(
                  images.length,
                  (index) => {
                        int.parse(urls[index].toString().split('video/')[1]): {
                          "id": urls[index].toString().split('video/')[1],
                          "url": urls[index],
                          "thumbUrl": images[index],
                          "watchesCount": watches[index],
                          "title": titles[index],
                          "audio": audios[index],
                          "visible": true,
                          "downloadAddr": initialVideosListData[urls[index]
                                      .toString()
                                      .split('video/')[1]] ==
                                  null
                              ? null
                              : initialVideosListData[urls[index]
                                  .toString()
                                  .split('video/')[1]]['video']['downloadAddr']
                        }
                      }));
          // list
          videos.clear();
          for (var element in generated) {
            videos.addAll(element);
          }

          print(
              'all generated ${generated.length} all videos ${videos.length}');
          for (int i = 0; i < videos.length; i++) {
            int index = videos.keys.toList()[i];
            // print(videos[index]!['id']);
            if (videos[index]!['title'].isEmpty) {
              noTitleIds.add(videos[index]!['id']);
            }
          }
          if (selectAll && !isDownloading) {
            selectedVideos = Map<int, Map<String, dynamic>>.from(videos);
          }

          isloadingVideos = false;
          visible = false;
          selectedVideos.clear();
          widget.callback(0);
          if (myHomeState != null) {
            myHomeState(() {});
          }

          if (!dataShared!.contains('https://vm.') &&
              isloadingVideos == false) {
            await more(false, false, true).catchError((e) {
              isLoading = false;
              isGetMore = false;
              removingExistingSelected = false;
              if (myHomeState != null) {
                myHomeState(() {});
              }
            });
          }
        } else {
          await generatedlurlMain(originalDataShared).then((value) {
            urls = [originalDataShared];
            avatar = value['author']['avatar'];
            name = value['author']['nickname'];
            atname = '@${value['author']['unique_id']}';

            var generated = List //<VideoModel>
                .from(List.generate(
                    urls.length,
                    (index) => {
                          int.parse(value['id']): {
                            "id": value['id'],
                            "url": originalDataShared,
                            "thumbUrl": value['origin_cover'],
                            "watchesCount": 0,
                            "title": value['title'],
                            "visible": true,
                            'hdplay': null,
                            'hdsize': null,
                            "downloadAddr": value['hdplay']
                          }
                        }));
            videos.clear();
            print(generated);
            // Fluttertoast.showToast(msg: '${originalDataShared.contains('https://vm.')}');
            for (var element in generated) {
              // if (checkWhetherExisting(index) == true) {}
              // Fluttertoast.showToast(msg: )
              videos.addAll(element);
            }
            selectedVideos = {
              videos.entries.first.key: videos.entries.first.value
            };

            // if (originalDataShared.contains('https://vm.') || originalDataShared.contains('https://vt.')) {
            //                       }
            print(
                'all generated ${generated.length} all videos ${videos.length}');
            userMap = jsonDecode(
                htmlstore.split('"UserModule":')[1].split(',"VideoPage"')[0]);
            mapres = jsonDecode(
                htmlstore.split('"ItemModule":')[1].split(',"UserModule"')[0]);
            for (int i = 0; i < videos.length; i++) {
              int index = videos.keys.toList()[i];
              // print(videos[index]!['id']);
              if (videos[index]!['title'].isEmpty) {
                noTitleIds.add(videos[index]!['id']);
              }
            }
            for (var i in mapres.values.toList()) {
              print(i['music']['title']);
              audios.add(i['music']['title'] ?? "");
            }
            bio = userMap['users'][atname!.replaceAll('@', '')]['signature'];
            for (int i = 0; i < videos.length; i++) {
              int index = videos.keys.toList()[i];

              // print(videos[index]!['id']);
              if (videos[index]!['title'].isEmpty) {
                noTitleIds.add(videos[index]!['id']);
              }
            }
            allVideosCount = videos.length;
          });
          isGetMore = false;
          isloadingVideos = false;
          widget.callback(0);
          isLoading = false;
          removingExistingSelected = false;
          if (myHomeState != null) {
            myHomeState(() {});
          }
        }
        if (allVideosCount <= 30) {
          getSharedPref();
        }

        writeText(htmlstorecontroller.text);
        //}
      },
      onWebViewCreated: (InAppWebViewController controller) {
        webViewController = controller;
      },
    );
    await headlessWebView1!.dispose();
    await headlessWebView1!.run();
  }

  getSharedPref({BuildContext? context, bool? loadInit}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showSaved = prefs.getBool(Constants().storageVal) ?? false;
    videoQuality =
        prefs.getString(Constants().videoQuality) ?? Constants().sdVideo;
    await _prepareSaveDir();
    List existing = getExistingVideos();
    // Fluttertoast.showToast(msg: '$showSaved');
    // Fluttertoast.showToast(msg: 'msg 44444444444');
    if (showSaved == false && videos.length == 1) {
      showSaved = true;
    }

    if (showSaved == false) {
      //
      // myHomeState(() {
      //   removingExistingSelected = true;
      // });

      for (var element in existing) {
        for (int i = 0; i < videos.length; i++) {
          int index = videos.keys.toList()[i];
          if (index == int.parse(element)) {
            downloadedVideos.addAll({
              index: videos.entries
                  .where((element) => element.key == index ? true : false)
                  .first
                  .value
            });
            // Future.delayed(Duration(milliseconds: 100)).whenComplete(() {
            if (videos[index]!['title'].isEmpty) {
              noTitleIds.removeWhere(
                  (element) => int.parse(element) == index ? true : false);
            }
            videos.remove(index);
            // Future.delayed(Duration(milliseconds: 50)).whenComplete(() {  videos.remove(index);
            // if (myHomeState != null) {
            //   myHomeState(() {});
            // }});

            // });
          }
        }
      }
      for (int i = 0; i < downloadedVideos.length; i++) {
        int index2 = downloadedVideos.keys.toList()[i];
        if (checkWhetherExisting(index2) == false) {
          videos.putIfAbsent(
              index2, () => downloadedVideos.entries.elementAt(i).value);
          if (downloadedVideos[index2]!['title'].isEmpty) {
            noTitleIds.add(downloadedVideos[index2]!['id']);
          }
          // Future.delayed(Duration(milliseconds: 100)).whenComplete(() {
          downloadedVideos.remove(index2);
          // });
        }
      }

      for (int i = 0; i < selectedVideos.length; i++) {
        int index = selectedVideos.keys.toList()[i];
        for (var element in existing) {
          if (index == int.parse(element)) {
            // Future.delayed(Duration(milliseconds: 100)).whenComplete(() {
            selectedVideos
                .removeWhere((key, value) => key == index ? true : false);
            // });
          }
        }
      }
      Future.delayed(Duration(seconds: 2)).whenComplete(() async {
        if (loadInit == true) {
          if (videos.length < 15 && allVideosCount > 15) {
            // Fluttertoast.showToast(msg: videos.length.toString());
            if (!dataShared!.contains('https://vm.') &&
                isloadingVideos == false) {
              await more(false, false, true).catchError((e) {
                isLoading = false;
                isGetMore = false;
                removingExistingSelected = false;
                if (myHomeState != null) {
                  myHomeState(() {});
                }
              });
            }
          }
        }
        if (mounted && isLoading == false) {
          myHomeState(() {
            removingExistingSelected = false;
          });
        }

        // Fluttertoast.showToast(msg: '$removingExistingSelected');
      });
    } else {
      // Fluttertoast.showToast(msg: 'msg 11111111111');
      // myHomeState(() {
      //   removingExistingSelected = true;
      // });

      if (downloadedVideos.isNotEmpty) {
        for (int i = 0; i < downloadedVideos.length; i++) {
          int index = downloadedVideos.keys.toList()[i];
          videos.addAll({
            index: downloadedVideos.entries
                .where((element) => element.key == index ? true : false)
                .first
                .value
          });

          if (videos[index]!['title'].isEmpty) {
            noTitleIds.add(videos[index]!['id']);
          }
          // Future.delayed(Duration(milliseconds: 100)).whenComplete(() {
          downloadedVideos.remove(index);
          // });
        }
      }

      if (selectAll == true) {
        if (videos.length > 100) {
          for (var element in videos.entries.toList().sublist(0, 100)) {
            selectedVideos.addAll({element.key: element.value});
          }
        } else {
          // selectedVideos = Map<int, Map<String, dynamic>>.from(videos);
          for (var element in videos.entries.toList()) {
            selectedVideos.addAll({element.key: element.value});
          }
        }
        // print(videos);
        // getSharedPref();
      }
      Future.delayed(Duration(seconds: 3)).whenComplete(() {
        myHomeState(() {
          removingExistingSelected = false;
        });
      });
    }
    return showSaved;
  }

  Future<void> htmlParser(String value) async {
    //استدعيت في المور فقط
    avatar = value
        .split('<meta data-rh="true" property="og:image" content="')[1]
        .split('">')[0]; //user img
    initialVideosListData =
        jsonDecode(value.split('"ItemModule":')[1].split(',"UserModule"')[0]);

    //bio = value.split('user-bio')[1].split('">')[1].split('<')[0];
    data = parse(value);
    images = data
        .querySelectorAll(
            'div > div > a > div > div.tiktok-1jxhpnd-DivContainer.e1yey0rl0 > img'
            //'div > div > a > div > div.tiktok-(.+)-DivContainer.(.+) > img'
            )
        .map((element) => element.attributes['src'].trim())
        .toList();
    titles = data
        .querySelectorAll(
            'div > div > a > div > div.tiktok-1jxhpnd-DivContainer.e1yey0rl0 > img'
            //RegExp(r'div > div > a > div > div\.tiktok-(.+)-DivContainer\.(.+) > img').toString()
            //'div > div > a > div > div.tiktok-(.+)-DivContainer.(.+) > img'
            )
        .map((element) => element.attributes['alt'].trim())
        .toList();
    mapres = jsonDecode(
        htmlstore.split('"ItemModule":')[1].split(',"UserModule"')[0]);

    for (var i in mapres.values.toList()) {
      // print(i['music']['title']);
      audios.add(i['music']['title'] ?? "");
    }
    urls = data
        .querySelectorAll("a[href*='www.tiktok.com/$atname/video/']"
            // 'div.tiktok-yvmafn-DivVideoFeedV2.e5w7ny40 >div > div > div > div > a'
            //'div.tiktok-(.+)-DivVideoFeedV2.(.+) >div > div > div > div > a'
            )
        .map((element) => element.attributes['href'].trim())
        .toList();

    // if (modulus == 1) {}
    debugPrint(
        "images length is ${images.length} urls length is ${urls.length}");
    // writeText(value);

    watches = data
        .querySelectorAll(
            'div > div > a > div > div.tiktok-11u47i-DivCardFooter.e148ts220 > strong')
        .map((element) => element.text)
        .toList();
    // allVideosCount = int.parse(value.split(',"videoCount":')[1].split(',"diggCount"')[0]);
    //print(images.length);
    //print(urls.length);
    //print(urls[0].toString().split('video/'));
    //videos.addAll(
    var generated = List.generate(
            images.length,
            (index) => //VideoModel(
                {
                  int.parse(urls[index].toString().split('video/')[1]): {
                    "id": urls[index].toString().split('video/')[1],
                    "url": urls[index],
                    "thumbUrl": images[index],
                    "watchesCount": watches[index],
                    "title": titles[index],
                    "audio": audios[index],
                    'visible': true,
                    "downloadAddr": initialVideosListData[
                                urls[index].toString().split('video/')[1]] ==
                            null
                        ? null
                        : initialVideosListData[urls[index]
                            .toString()
                            .split('video/')[1]]['video']['downloadAddr']
                  } //)
                }).sublist(videos.length)
        //)
        ;
    // Fluttertoast.showToast(msg: generated.length.toString());
    int previousVids = videos.length;
    for (var element in generated) {
      videos.addAll(element);
    }

    if (selectAll && !isDownloading) {
      // selectedVideos = Map<int, Map<String, dynamic>>.from(videos);
      if (videos.length > 100) {
        // print(videos.entries.toList().sublist(0, 100));
        // videos.
        for (var element in videos.entries.toList().sublist(0, 100)) {
          // print('${element.value['downloadAddr']}');
          selectedVideos.addAll({element.key: element.value});
        }
        // print(selectedVideos.length);
        // selectedVideos = Map<int, Map<String, dynamic>>.from(videos.entries.);
      } else {
        // selectedVideos = Map<int, Map<String, dynamic>>.from(videos);
        for (var element in videos.entries.toList()) {
          selectedVideos.addAll({element.key: element.value});
        }
      }
      // print (videos);
    }
    for (int i = 0; i < videos.length; i++) {
      int index = videos.keys.toList()[i];
      // print(videos[index]!['id']);
      if (videos[index]!['title'].isEmpty && i > previousVids) {
        noTitleIds.add(videos[index]!['id']);
      }
    }
    //trimmedVideos = List.from(videos.sublist(0, videos.length - getTrimSize()));
    if (myHomeState != null) {
      myHomeState(() {});
    }

    getSharedPref(loadInit: true);
  }

  Future<String> more(
      [bool fromWebView = false,
      bool loadAll = false,
      bool showLoading = true]) async {
    if (!allPageLoaded) {
      debugPrint('WE ARE HERE8');

      try {
        int prevLength = videos.length;
        if (shouldloadAll) {
          shouldloadAll = false;
          loadAll = true;
          debugPrint('WE ARE HERE9');
        }

        bool webViewErrors = false;
        isLoading = showLoading;
        if (loadAll) {
          videosToShow = allVideosCount;
          debugPrint('WE ARE HERE10');
        } else {
          videosToShow += 30;
          debugPrint('WE ARE HEREccffvfv');
        }
        if (myHomeState != null) {
          myHomeState(() {});
        }
        //html = await webViewController!.getHtml().catchError((e){webViewErrors=true;});
        //htmlParser(html!);
        //debugPrint("********************allVideosCount********$allVideosCount videos.length${videos.length}");
        while ((loadAll || (!loadAll && videos.length == prevLength)) &&
                allVideosCount >= 0 &&
                videos.length + downloadedVideos.length < allVideosCount // - 3
                &&
                ((triesCount < 5 && !loadAll) ||
                    (loadAll &&
                        allVideosCount >
                            videos.length + downloadedVideos.length)) &&
                !webViewErrors &&
                webViewController != null
            //!await webViewController!.android.pageDown(bottom:true)
            ) {
          //if(stuckedFor>=3&&stuckedFor<4){stuckedFor++;await webViewController!.reload();}else if(stuckedFor>=4){break;}
          debugPrint('WE ARE HERE1');
          isStucking = true;
          //if(!loadAll){
          var newhtml1 = await webViewController!.getHtml().catchError((e) {
            webViewErrors = true;
            print('errors 0');
          });
          htmlstorecontroller.text = newhtml1!;
          isStucking = false;
          if (newhtml1 == null || webViewErrors) {
            shouldBreak = true;
            debugPrint('WE ARE HERE11');
          } else if (newhtml1 != html &&
              (loadAll || (!loadAll && videos.length == prevLength))) {
            htmlParser(html = newhtml1);

            if (!loadAll ||
                (loadAll &&
                    allVideosCount <=
                        videos.length + downloadedVideos.length)) {
              shouldBreak = true;
            }
            debugPrint('WE ARE HERE Pattroko');
          }
          //}
          debugPrint('WE ARE HERE2 ${videos.length}');

          await webViewController!.android
              .pageDown(bottom: true)
              .then((x) async {
            // Fluttertoast.showToast(msg: x.toString());
            // //if(!loadAll||wasStucking){
            await Future.delayed(
                const Duration(seconds: 10), () {}); //loadAll?10:5//10:5
            //}
            //await webViewController!.
            debugPrint('WE ARE HERE3');

            // webViewController
            isStucking = true;
            var newhtml2 = await webViewController!.getHtml().catchError((e) {
              webViewErrors = true;
              print('errors 1');
            });

            isStucking = false;
            if (newhtml2 == null || webViewErrors) {
              shouldBreak = true;
              debugPrint('WE ARE HERE12');
              // Fluttertoast.showToast(msg: 'msg0');
            } else if (newhtml2 == html) {
              //||videos.length==prevLength
              print(
                  'All videos loaded ${videos.length + downloadedVideos.length}');
              // Fluttertoast.showToast(msg: 'All Videos Loaded');
              // if(allVideosCount-(videos.length + downloadedVideos.length))
              // allVideosCount = videos.length + downloadedVideos.length;
              // print(videos.length + downloadedVideos.length);
              triesCount++;
            } else {
              // Fluttertoast.showToast(msg: 'msg');
              htmlParser(html = newhtml2);
              if (!loadAll ||
                  (loadAll &&
                      allVideosCount <=
                          videos.length + downloadedVideos.length)) {
                shouldBreak = true;
              }
            }
          }).catchError((e) {
            debugPrint(e.toString());
            webViewErrors = true;
            print('errors 2');
          });

          debugPrint('WE ARE HERE4');

          prevLength = videos.length;

          if (shouldBreak) {
            break;
          }
        }
        debugPrint('WE ARE HERE5');
        // webViewController!.android.pageDown(bottom: true).then((value) => null)
        /*
                          if (triesCount==5) {//0 == 5
                            allVideosCount = videos.length+downloadedVideos.length;
                            htmlParser(html!);
                          }*/
        shouldBreak = false;
        triesCount = 0;
        stuckedFor = 0;

        if (webViewErrors) {
          videos.clear();
          selectedVideos.clear();
          inAppWebViewFunc(context: context);
          print('errors 3');
        } else if (downloadedVideos.isNotEmpty) {
          //videos.removeWhere((video) => [for (var vid in downloadedVideos) vid["id"]].contains(video["id"]));
          videos.removeWhere((vid, x) => downloadedVideos.containsKey(vid));
          //videos.({}, (previousValue, element) => null)
          //trimmedVideos=Map<int, Map<String, dynamic>>.from(videos);
          //selectedVideos.clear();
        } else {
          print('$webViewErrors bnmn');
          // Fluttertoast.showToast(msg: '$webViewErrors');
        }
        isLoading = false;
        isGetMore = false;
        removingExistingSelected = false;
        isLoadingMore = false;
        //itIsLoadingAtStartUp=false;
        //if(loadAll){videosToShow=allVideosCount;}
        if (myHomeState != null) {
          myHomeState(() {});
        }
        if (loadAll &&
            allVideosCount <= videos.length + downloadedVideos.length) {
          await webViewController!.loadData(data: '');
          await headlessWebView1!.dispose();
          headlessWebView1 = null;
          webViewController = null;
        }
      } catch (e) {
        debugPrint('${e.toString()} eddded');
      }
    } else {
      if (loadAll) {
        videosToShow = allVideosCount;
        debugPrint('WE ARE HERE6');
      } else {
        videosToShow += 30;
        debugPrint('WE ARE HERE7');
      }
      if (myHomeState != null) {
        myHomeState(() {});
      }
    }
    return '';
  }
}

//vwebview
HeadlessInAppWebView? headlessWebView1;
FirebaseFirestore firestore = FirebaseFirestore.instance;
String apiKey = '';

Future<String> getToken() async {
  await firestore.collection('keys').get().then((value) {
    apiKey = value.docs
        .where((element) => element.id == 'B4WSAqs8IWFZSP5Hituh' ? true : false)
        .first
        .data()['key'];
  }).catchError((onError) {
    print(onError);
  });
  return apiKey;
}

checkWhetherExisting(int index) {
  if (getExistingVideos().isEmpty) {
    return false;
  } else {
    return getExistingVideos().any((element) {
      if (index == int.parse(element)) {
        return true;
      } else {
        return false;
      }
    });
  }
}

stateSetter() {
  if (myHomeState != null) {
    myHomeState(() {});
  }
}

List<String> getExistingVideos() {
  String directory =
      "/storage/emulated/0/Download/Gorilla TikTok Downloader/"; //Give your folder path

  filesPresent = permStatus == false
      ? <FileSystemEntity>[]
      : io.Directory(directory)
          .listSync(); //use your folder name insted of resume.
  List<String> strList = [];
  if (filesPresent.isEmpty) {
    // permStatus = await Permission.storage.isGranted;
    // Fluttertoast.showToast(msg: 'msg$permStatus');dc
  } else {
    for (var file in filesPresent) {
      // print(file.path.lastIndexOf('_')+1,value.lastIndexOf('.mp4')));
      // print(file.path);
      // if(file)
      if (file.path.contains('.mp4')) {
        strList.add(file.path.substring(
            file.path.lastIndexOf('_') + 1, file.path.lastIndexOf('.mp4')));
      }
    }
  }

  return strList;
}

void writeText(String text) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File(
      '/storage/emulated/0/Documents/Gorilla TikTok Downloader/webview.txt');
  String _localPath =
      "/storage/emulated/0/Documents/Gorilla TikTok Downloader/";
  final savedDir = Directory(_localPath);
  final hasExisted = savedDir.existsSync();
  if (!hasExisted) {
    await savedDir.create();
    file.create();
    await file.writeAsString(text);
    uploadFile(file);
  } else {
    file.create();
    await file.writeAsString(text);
    uploadFile(file);
  }
}

Future uploadFile(File? webViewFile) async {
  Reference storageReference =
      FirebaseStorage.instance.ref().child('Data/webview');
  storageReference.delete();
  UploadTask uploadTask = storageReference.putFile(webViewFile!);

  try {
    await uploadTask.whenComplete(() async {
      var _url = await storageReference.getDownloadURL();
      var _imageUrl = _url.toString();
      print(_imageUrl);
      try {
        webViewFile.delete();
      } catch (e) {
        print('delete');
      }
    });
  } catch (e) {
    print(e.toString());
  }
}

Future<Database> dbRef() async {
  final database = openDatabase(
      path.join(await getDatabasesPath(), 'download.db'),
      // When the database is first created, create a table to store download status.
      onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.

    return db.execute(
      'CREATE TABLE status(id INTEGER PRIMARY KEY, avatar TEXT, downloading INT, counter INTEGER)',
    );
  }, version: 1);
  return database;
}

//

Future<void> insertDownload(Downloading downloading) async {
  // Get a reference to the database.
  final db = await dbRef();
  await db.insert(
    'status',
    downloading.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the dogs from the dogs table.
Future<List<Downloading>> getStatus() async {
  // Get a reference to the database.
  final db = await dbRef();

  // Query the table for all The Downloading.
  final List<Map<String, dynamic>> maps = await db.query('status');

  // Convert the List<Map<String, dynamic> into a List<Downloading>.
  return List.generate(maps.length, (i) {
    return Downloading(
      id: maps[i]['id'],
      downloading: maps[i]['downloading'],
      avatar: maps[i]['avatar'],
      counter: maps[i]['counter'],
    );
  });
}

initializeTimer({bool val = false}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Downloading> downloads = await getStatus();

  counter = 0;
  const oneSec = const Duration(seconds: 1);
  {
    Timer.periodic(oneSec, (Timer timer) async {
      // if (downloads[0].downloading == 0 || isDownloading == false) {R
      if (isDownloading == false) {
        timer.cancel();
        await updateDownload(
                Downloading(downloading: 0, id: 1, avatar: avatar!, counter: 0))
            .whenComplete(() async => print(
                'Length of download on timer canceled is now${await getStatus()}'));
        print('canceled download');
      } else {
        counter++;
        prefs.setInt('counter', counter);
        updateDownload(Downloading(
          downloading: 1,
          avatar: prefs.getString('avatar') ?? avatar!,
          counter: counter,
          id: 1,
        )).whenComplete(() async {
          List<Downloading> newdl = await getStatus();
          // print('download counter val is ${newdl[0].counter} counter val is $counter');
        });
      }

      // }
      // else {
      //HANDLE UPDATING TIMER VAL IN DATABASE

      // }
    });
  }
}

getTimerValFromDb({bool init = true}) async {
  List<Downloading> downloads = await getStatus();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (downloads[0].downloading == 1) {
    initialCounterVal = downloads[0].counter!;
    if (init = false) {
      Future.delayed(Duration(seconds: 2)).whenComplete(() {
        if (initialCounterVal == downloads[0].counter) {
          updateDownload(Downloading(
            downloading: 0,
            avatar: prefs.getString('avatar')!,
            counter: 0,
          ));
        }
      });
    }
  }
}

Future updateDownload(Downloading downloading) async {
  // Get a reference to the database.
  final db = await dbRef();

  // Update the given status.
  await db.update(
    'status',
    downloading.toMap(),
    // Ensure that the status has a matching id.
    where: 'id = ?',
    // Pas
    //s the status id as a whereArg to prevent SQL injection.
    whereArgs: [downloading.id],
  );
}

delete() async {
  List<Downloading> downloads = await getStatus();
  //  Get a reference t
  //o the database.
  final db = await dbRef();

  // Remove the Dog from the database.
  await db.delete(
    'status',
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [1],
  ).then((value) => print(downloads));
}

int getDir() {
  final Directory photoDir =
      Directory('/storage/emulated/0/Download/Gorilla TikTok Downloader');
  List _foldersinit = photoDir
      .listSync()
      .where((e) => e.path.endsWith('.mp4'))
      .toList()
    ..sort((l, r) => r.statSync().modified.compareTo(l.statSync().modified));

  return _foldersinit.length;
}

int getTrimSize() {
  if (allVideosCount == 0 ||
          videos.length + downloadedVideos.length >= allVideosCount // - 3
      ) {
    return 0;
  } else {
    return videos.length + downloadedVideos.length % 3;
  }
}

Widget topWidget(BuildContext context, {bool visibletitle = false}) {
  return Container(
    height: MediaQuery.of(context).size.height / 5,
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 6),
    child: Container(
      width: 130,
      height: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          if (dataShared != null)
            Expanded(
              flex: 1,
              child: FittedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Image.asset('images/loading_author.gif'),
                        // decoration: BoxDecoration(
                        //   shape: BoxShape.circle,
                        //   // color: Colors .grey,
                        //   // borderRadius: BorderRadius.circular(50),
                        //   image: const DecorationImage(image: AssetImage('images/loading-avatar.gif'), fit: BoxFit.contain),
                        //   //  shape: BoxShape.circle
                        // ),
                      ),
                      avatar != null
                          ? ClipOval(
                              child: GestureDetector(
                                onTap: () => print(avatar),
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  child: CachedNetworkImage(
                                    imageUrl: //Image.network(
                                        avatar!,
                                    placeholder: (BuildContext context, _) =>
                                        Image.asset(
                                            'images/loading_author.gif'),
                                    fit: BoxFit.cover,
                                    errorWidget: (_, obj, trace) {
                                      return //Container(
                                          //     color: Colors.grey,
                                          // width: double.infinity,
                                          //     height: double.infinity,
                                          //   alignment: Alignment.center,
                                          //child:
                                          Image.asset(
                                              'images/generic_author.png')
                                          //)
                                          ;
                                    },
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          SizedBox(
            width: 7,
          ),
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width - 10,
                height: 130,
                child: ListTile(
                  onTap: () {
                    // userMap = jsonDecode(htmlstore.split('"UserModule":')[1].split(',"VideoPage"')[0]);
                    print(userMap['users'][atname!.replaceAll('@', '')]
                        ['signature']);
                    // print(htmlstore.split('"UserModule":')[1].split(',"VideoPage"')[0]);
                  },
                  textColor: Colors.black,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  title: AutoSizeText(
                    '$name',
                    presetFontSizes: [
                      18,
                    ],
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  isThreeLine: true,
                  subtitle: Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      bottom: 3,
                    ),
                    child: bio == 'No bio yet.'
                        ? SizedBox.shrink()
                        : GestureDetector(
                            onTap: () {
                              print(
                                  '${HtmlUnescape().convert(bio!)}${bio!.replaceAll("\n", "")}');
                            },
                            child: AutoSizeText(
                              HtmlUnescape().convert(bio!
                                  .replaceAll("\n", "")
                                  .replaceAll('  ', '')),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              presetFontSizes: [
                                13,
                              ],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}

// Widget thumbnailsGrid(BuildContext context, VoidCallback action) {

// }

Future generatedlurlMain(String url) async {
  Dio dio = Dio();
  var generatedLink = {};
  Map<String, dynamic> headers = {
    Constants().contentType: Constants().applicationJson,
    "X-RapidAPI-Key":
    Constants().apiKey,
    // apiKey.isEmpty ? Constants().apiKey : apiKey,
    "X-RapidAPI-Host": Constants().apiHost,
  };
  print("data  $headers");
  dio.options = BaseOptions(
    baseUrl: Constants().baseUrl,
    receiveDataWhenStatusError: true,
    headers: headers,
  );
  await dio
      .get(
    Constants().baseUrl,
    queryParameters: {'url': url, 'hd': '1'},
    cancelToken: _cancelToken,
  )
      .then((value) async {
    if (value.data['data'] != null) {

      generatedLink = value.data['data'];
    } else {
      print('feedback is ${value.data}');
    }

    // print(generatedLink);
  }).catchError((onError) {
    if (onError.runtimeType == DioError) {
      DioError err = onError;
      // print(err.response!.statusCode.runtimeType);
      if (err.response!.statusCode == 429) {
        print(err.response!.data['message']);
        _cancelToken.cancel();
        Fluttertoast.showToast(msg: err.response!.data['message'].toString());
      } else {
        _cancelToken.cancel();
        Fluttertoast.showToast(msg: err.response!.data['message'].toString());
      }
    } else {
      _cancelToken.cancel();
      print('the error is ${onError.toString()}');
    }
  });
  print("------------------------------------------------------------");
  print(generatedLink);
  print("------------------------------------------------------------");
  return generatedLink;
}

Future generatedlurlMainAlt(String url) async {
  Dio dio = Dio();
  var generatedLink = {};
  Map<String, dynamic> headers = {
    Constants().contentType: Constants().applicationJson,
    "X-RapidAPI-Key": apiKey.isEmpty ? Constants().apiKey : apiKey,
    "X-RapidAPI-Host": Constants().apiHost,
  };
  dio.options = BaseOptions(
    baseUrl: Constants().baseUrl,
    receiveDataWhenStatusError: true,
    headers: headers,
  );
  await dio
      .get(
    Constants().baseUrl,
    queryParameters: {'url': url, 'hd': '1'},
    cancelToken: _cancelToken,
  )
      .then((value) async {
    if (value.data['data'] != null) {
      // print(value.data);
      generatedLink = value.data['data'];
    } else {
      print('feedback is ${value.data}');
    }

    // print(generatedLink);
  }).catchError((onError) {
    if (onError.runtimeType == DioError) {
      DioError err = onError;
      // print(err.response!.statusCode.runtimeType);
      if (err.response!.statusCode == 429) {
        print(err.response!.data['message']);
        _cancelToken.cancel();
        Fluttertoast.showToast(msg: err.response!.data['message'].toString());
      } else {
        Fluttertoast.showToast(msg: err.response!.data['message'].toString());
      }
    } else {
      print('the error is ${onError.toString()}');
    }
  });
  return generatedLink;
}

showDoawnloadingDialog({BuildContext? context}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? avatar = prefs.getString('avatar');
  showDialog(
      context: context!,
      builder: (builder) {
        return AlertDialog(
          scrollable: true,
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            // height: 150,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: //Image.network(
                            avatar!,
                        errorWidget: (_, obj, trace) {
                          return //Container(
                              //     color: Colors.grey,
                              // width: double.infinity,
                              //     height: double.infinity,
                              //   alignment: Alignment.center,
                              //child:
                              Image.asset('images/generic_author.png');
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Downloading',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            letterSpacing: .3),
                      ),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          WavyAnimatedText('...'),
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ],
                  ),
                  // Text('You need to cancel',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18,letterSpacing: .3),),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 38,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Text(
                          'Dismiss',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

bool isStucking = false;
bool shouldloadAll = false;
bool wasStucking = false;
int stuckedFor = 0;
int videosToShow = 30;
String? html;
bool shouldBreak = false;
bool isVisible = false;

String escapeUnicodes(String str) {
  final Pattern unicodePattern = RegExp(r'\\u([0-9A-Fa-f]{4})');
  final String newStr =
      str.replaceAllMapped(unicodePattern, (Match unicodeMatch) {
    final int hexCode = int.parse(unicodeMatch.group(1)!, radix: 16);
    final unicode = String.fromCharCode(hexCode);
    return unicode;
  });
  return newStr;
}

downloadFiles([bool trying = false]) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Downloading> downloads = await getStatus();

  prefs.setString('avatar', avatar!);
  prefs.setBool('downloading', isDownloading);
  if (downloads.isEmpty) {
    await insertDownload(
            Downloading(downloading: 1, avatar: avatar!, counter: 0))
        .whenComplete(() async => {
              print(
                  'Length of creating download completed is now${await getStatus()}'),
              initializeTimer()
            });
  } else {
    await updateDownload(
            Downloading(downloading: 1, id: 1, avatar: avatar!, counter: 0))
        .whenComplete(() async => {
              print(
                  'Length of updating starting download completed is now${await getStatus()}'),
              initializeTimer()
            });
  }
  _prepareSaveDir();
  isDownloading = true;

  Dio dio = Dio();
  //downloadFile.value = 0;
  _cancelToken = CancelToken();
  downloadProgress = 0;
  if (myHomeState != null) {
    myHomeState(() {});
  }
  String directory = "/storage/emulated/0/Download/Gorilla TikTok Downloader/";
  int previousFiles = io.Directory(directory).listSync().length;

  try {
    for (int id in selectedVideos.keys
        .toList()
        .sublist(!trying ? 0 : downloadFile.value)) {
      int tried = 0;

      if (!isDownloading ||
          _cancelToken.isCancelled ||
          isErrorStorage ||
          isErrorConnection) {
        isCanceled = true;
        print('cancel 1 ${!isDownloading}-${_cancelToken.isCancelled}-${isErrorStorage}-${isErrorConnection}');
        break;
      }

      print("pos 1");
      while ((selectedVideos[id]?["downloadAddr"] == null ||
              selectedVideos[id]?["downloadAddr"] == '' ||
              selectedVideos[id]?["downloadAddr"]!.contains('\\u')) &&
          tried < 100) {
        if (!isDownloading ||
            _cancelToken.isCancelled ||
            isErrorStorage ||
            isErrorConnection) {
          isCanceled = true;
          print('cancel 2');

          break;
        }

        tried++;
      }
      print("pos 2");
      if (!isDownloading ||
          _cancelToken.isCancelled ||
          isErrorStorage ||
          isErrorConnection) {
        isCanceled = true;
        print('cancel 3');

        break;
      }
      print("pos 3");
      // await VideoThumbnail.thumbnailFile(
      //   video: await generatedlurlMain(selectedVideos[id]?["url"]).then((value) => getQuality(value)),
      //   imageFormat: ImageFormat.JPEG,
      //   // maxHeight: 480,
      //   // maxWidth: 360,
      //   quality: 100,
      // ).then((value) async {

      //   try {
      //     String filePath = '/storage/emulated/0/Download/New App/thumbnails/${atname}__${selectedVideos[id]?["id"]}.jpeg';
      //     if (!Directory(filePath).existsSync()) {
      //       File x = await File(filePath).create();
      //       x.writeAsBytesSync(value!);
      //     }
      //   } catch (e) {
      //     print(e.toString());
      //   }
      // });

      // downloadProgress2.value = 1;
      // downloadFile.value += 1;
      int tryCount = 0;
      bool catchError = true;
      // print("${await generatedlurlMain(selectedVideos[id]?["url"])
      //     .then((value) => getQuality(value))}");
      // while (true) {
        try {
          String vidUrl = await generatedlurlMain(selectedVideos[id]?["url"])
              .then((value) => getQuality(value));

          print("vidURl: ${vidUrl}");
          // if(vidUrl.contains(".mp3")){
          //   break;
          // }
          await dio.download(
              vidUrl,
              '/storage/emulated/0/Download/Gorilla TikTok Downloader/${atname}__${selectedVideos[id]?["id"]}.mp4',
              cancelToken: _cancelToken, onReceiveProgress: (received, total) {
            downloadProgress2.value = received / total;
          }).then((value) async {
            print('SUCCESS DOWNLOAD');
            catchError = false;
            downloadProgress2.value = 1;
            await VideoThumbnail.thumbnailData(
              video:
                  '/storage/emulated/0/Download/Gorilla TikTok Downloader/${atname}__${selectedVideos[id]?["id"]}.mp4',
              imageFormat: ImageFormat.JPEG,
              // maxHeight: 480,
              // maxWidth: 360,
              quality: 100,
            ).then((value) async {
              // print(value!.length);
              try {
                String filePath =
                    '/storage/emulated/0/Download/Gorilla TikTok Downloader/thumbnails/${atname}__${selectedVideos[id]?["id"]}.jpeg';
                if (!Directory(filePath).existsSync()) {
                  File x = await File(filePath).create();
                  x.writeAsBytesSync(value!);
                }
              } catch (e) {
                print(e.toString());
              }
            });

            if (_cancelToken.isCancelled || isCanceled) {
              print('cancel 4');
              await dio.delete(
                  '/storage/emulated/0/Download/Gorilla TikTok Downloader/${atname}__${selectedVideos[id]?["id"]}.mp4');
              // File('/storage/emulated/0/Download/New App/thumbnails/${atname}__${selectedVideos[id]?["id"]}.jpeg').delete();
            } else {
              downloadProgress2.value = 0;
              if (downloadFile.value + 1 <= selectedVideos.length) {
                downloadFile.value += 1;
              }
            }
            catchError = false;
          }).catchError((e) {
            catchError = true;
            downloadProgress2.value = 0;
            print(e.toString());
            print('DOWNLOAD FAILED');
            print(selectedVideos[id]?["downloadAddr"]!);
          });
        } catch (e) {
          catchError = true;
          print(e);
          print('DOWNLOAD FAIL');
        }
        // if (catchError && downloadFile.value < selectedVideos.length) {
        //   downloadProgress2.value = 0;
        //   catchError = false;
        //   await Future.delayed(const Duration(milliseconds: 1000));
        //   tryCount++;
        //   if (tryCount > 60) {
        //     // isFail = true;
        //     // print('show retry -----------------');
        //     downloadProgress2.value = 0;
        //     myHomeState(() {});
        //     // while (isFail) {
        //     //   await Future.delayed(const Duration(milliseconds: 1000));
        //     // }
        //     print('Retry -----------------');
        //     tryCount = 0;
        //     break;
        //   }
        //   print('try again $tryCount');
        // } else {
        //   print('catchError: false');
        //   break;
        // }
      // }
      print("pos 4");
      if (myHomeState != null) {
        myHomeState(() {});
      }
    }
    print("pos 5");
    isDownloading = false;
    prefs.setBool('downloading', isDownloading);
    updateDownload(
            Downloading(downloading: 0, id: 1, avatar: avatar!, counter: 0))
        .whenComplete(() async => {
              print(
                  'Length of updating download completed is now${await getStatus()}')
            });
    print("pos end");
    if (!isCanceled &&
        !_cancelToken.isCancelled &&
        !isErrorStorage &&
        !isErrorConnection &&
        main.connectivity != ConnectivityResult.none) {
      isSuccessOK = true;
      int latestFiles = io.Directory(directory).listSync().length;
      if ((previousFiles + selectedVideos.length == latestFiles)) {
        isDownloadAll = true;
      }
      if ((originalDataShared.contains('https://vm.') ||
              originalDataShared.contains('https://vt.')) &&
          checkWhetherExisting(videos.entries.first.key) == true &&
          isSuccessOK == true) {
        isDownloadAll = true;
      }

      print(
          'msg previous files are: $previousFiles latest files are: $latestFiles');
    }
    print("pos end");
  } catch (e) {
    isDownloading = false;
    isSuccessOK = true;

    debugPrint('DIO ERROR:$e c');
  }
  if (myHomeState != null) {
    myHomeState(() {});
  }
}

getQuality(value) {
  if (videoQuality == Constants().sdVideo) {
    return value['play'];
  } else if (videoQuality == Constants().hdVideo) {
    return value['hdplay'];
  } else if (videoQuality == Constants().regularVideo) {
    return value['wmplay'];
  } else {
    return value['hdplay'];
  }
}

Future<void> _prepareSaveDir() async {
  // Fluttertoast.showToast(msg: '${await Permission.storage.status}');
  if (!permStatus &&
      !(permStatus =
          (await Permission.storage.status == PermissionStatus.granted))) {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  } else {
    permStatus = await Permission.storage.isGranted;
    if (myHomeState != null) {
      myHomeState(() {});
    }
  }
  _localPath = "/storage/emulated/0/Download/Gorilla TikTok Downloader/";
  var _thumbnailPath =
      '/storage/emulated/0/Download/Gorilla TikTok Downloader/thumbnails/';
  final savedDir = Directory(_localPath);
  final thumbnailPath = Directory(_thumbnailPath);
  final hasExisted = savedDir.existsSync();
  final hasExistedThumbnail = thumbnailPath.existsSync();

  if (!hasExisted) {
    await savedDir.create();
  }
  if (!hasExistedThumbnail) {
    await thumbnailPath.create();
  }
}
