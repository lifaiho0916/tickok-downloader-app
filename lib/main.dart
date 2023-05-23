import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

// import 'package:device_apps/device_apps.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/helpers&widgets/custom_button.dart';

//import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:new_app/saved_videos.dart';
import 'package:new_app/local/cache_helper.dart';
import 'package:new_app/settings.dart';
import 'package:new_app/splash.dart';
import 'package:new_app/test_widget.dart';
import 'package:new_app/welcomescren.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_background/flutter_background.dart';
import 'package:permission_handler/permission_handler.dart';

import 'helpers&widgets/styling.dart';
import 'school.dart';
import "helpers&widgets/loading.dart";

//import 'package:timer_count_down/timer_count_down.dart';
// ignore: prefer_typing_uninitialized_variables
var myMainState;
// ignore: prefer_typing_uninitialized_variables
var connectivity;

Future<String> httpREAD(String url, {Map<String, String>? headers}) async {
  return await http.read(Uri.parse(url), headers: headers);
}

Future<http.Response> httpGET(String url,
    {Map<String, String>? headers}) async {
  var res = await http.get(Uri.parse(url), headers: headers);
  return res;
}

void noNet() {
  if(!isShared) {
    return;
  }
  Widget toast = Padding(
    padding: const EdgeInsets.only(bottom: 28.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: black,
      ),
      child: const Text(
        "No network connection",
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
}

Future<bool> checkConectivity(
    [bool firstState = false, bool lastState = false, setState]) async {
  //int numberOfRetry=0;
  //debugPrint('checkConectivitycheckConectivity');
  //var connectivity=await Connectivity().checkConnectivity();
  //connectedToInternet=!(//showNoConnectivity=
  //(connectivity==ConnectivityResult.none||(connectivity!=ConnectivityResult.wifi&&connectivity!=ConnectivityResult.mobile)));
  //if(firstState&&setState!=null){setState((){});}
  //if(!connectedToInternet!){
  Future<String> again() async {
    //numberOfRetry++;
    await httpREAD('https://api.ipify.org').then((body) async {
      if (body.split('.').length == 4 &&
          body.split('.').every((x) {
            return int.tryParse(x) is int;
          })) {
        connectedToInternet = true;
        closedNoConnPopUp = false;
        showNoConnectivity = false;
      } else {
        //if(numberOfRetry>=3){
        // connectedToInternet = false;
        noNet();
        // showNoConnectivity = true;
        //}else{again();}
      }
    }).catchError((e) async {
        noNet();
      //if(numberOfRetry>=3){
      // connectedToInternet = false;
      // showNoConnectivity = true;
      //}else{again();}
    });
    return '';
  }

  await again();
  //}
  if (lastState && myMainState != null) {
    myMainState(() {});
  }
  return connectedToInternet!;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  const androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: " ",
    notificationText: "",
    notificationImportance: AndroidNotificationImportance.Default,
    notificationIcon: AndroidResource(
        name: 'background_icon',
        defType: 'drawable'), // Default is ic_launcher from folder mipmap
  );
//if(
  await FlutterBackground.initialize(androidConfig: androidConfig);
//){await FlutterBackground.enableBackgroundExecution();}
  await CacheHelper.init();
  //await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  runApp(const MyApp());
}

bool? connectedToInternet = true;
bool showNoConnectivity = false;
bool closedNoConnPopUp = false;
bool isShared = false;

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gorilla TikTok Downloader',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  bool sharedContent = false;
  bool SplashComplet = false;
  String sharedString = '';
  bool sharedFinishCheck = false;
  var subscription = Connectivity().checkConnectivity();
  PageController? _pageController;
  GlobalKey<MyHomePageState> mykey = GlobalKey();
  GlobalKey<DownloadState> myDownloadState = GlobalKey();

  List<Widget> _widgetOptionsHome = <Widget>[];
  List<Widget> widgetOptions = <Widget>[];

  @override
  initState() {
    super.initState();
    checkShared();
    getWidgetOptions();
    super.initState();
    _pageController =
        PageController(keepPage: true, initialPage: _selectedIndex);
    _pageController!.addListener(() {
      _selectedIndex = _pageController!.page!.toInt();

      if (_selectedIndex == 1 && myDownloadState.currentState != null) {
        myDownloadState.currentState!.updateList();
      }
      setState(() {});
    });
    Timer.periodic(const Duration(seconds: 15), (timer) {
      checkConectivity(true, true, setState);
    }); //myMainState((){});

      Timer(Duration(seconds: 5), () =>
      {
        setState(() {SplashComplet = true;})
      });

  }

  @override
  void dispose() {
    super.dispose();
    //unbindBackgroundIsolate();
    //connectivitySubscription.cancel();
    // WidgetsBinding.instance.removeObserver(this);

    headlessWebView1!.dispose();
    FlutterBackground.disableBackgroundExecution();
  }

  @override
  Widget build(BuildContext context) {
    myMainState = setState;

    //final doublee = MediaQuery.of(context).size.width;
    return
      // (!SplashComplet && !sharedContent)?Loading2():
    WillPopScope(
        onWillPop: () async {
          bool yes = true;
          // await showDialog(
          //     context: context,
          //     builder: ((context) {
          //       return Dialog(
          //         insetPadding:
          //             EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //         // title: const Text('Exit?'),
          //         // actionsPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //         // contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //         child: FittedBox(
          //           fit: BoxFit.scaleDown,
          //           // height: 145,
          //           child: Container(
          //             padding:
          //                 EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          //             alignment: Alignment.centerLeft,
          //             width: MediaQuery.of(context).size.width,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 Text(
          //                     'Are you sure you want to leave? This will end further downloads and close.'),
          //                 SizedBox(
          //                   height: 20,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     CustomFlatButton(
          //                       // radius: 5,
          //                       text: 'No',
          //                       color: tikTokBlack,
          //                       width: MediaQuery.of(context).size.width / 3,
          //                       callback: () {
          //                         Navigator.of(context).pop();
          //                       },
          //                     ),
          //                     SizedBox(
          //                       width: 20,
          //                     ),
          //                     CustomFlatButton(
          //                       text: 'Yes',
          //                       // radius: 5,
          //                       color: tikTokRed,
          //                       width: MediaQuery.of(context).size.width / 3,
          //                       callback: () {
          //                         yes = true;
          //                         Navigator.of(context).pop();
          //                       },
          //                     )
          //                   ],
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         // actions: [
          //         //   Padding(
          //         //     padding: const EdgeInsets.all(8.0),
          //         //     child: InkWell(
          //         //       onTap: () {
          //         //         yes = true;
          //         //         Navigator.of(context).pop();
          //         //       },
          //         //       child: Container(
          //         //         height: 38,
          //         //         alignment: Alignment.center,
          //         //         decoration: const BoxDecoration(color: Color.fromARGB(255, 218, 34, 10), borderRadius: BorderRadius.all(Radius.circular(8))),
          //         //         child: const Text(
          //         //           'Yes',
          //         //           style: TextStyle(color: Colors.white, fontSize: 15),
          //         //         ),
          //         //       ),
          //         //     ),
          //         //   ),
          //         //   Padding(
          //         //     padding: const EdgeInsets.all(8.0),
          //         //     child: InkWell(
          //         //       onTap: () {
          //         //         Navigator.of(context).pop();
          //         //       },
          //         //       child: Container(
          //         //         height: 38,
          //         //         alignment: Alignment.center,
          //         //         decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(8))),
          //         //         child: const Text(
          //         //           'No',
          //         //           style: TextStyle(color: Colors.white, fontSize: 15),
          //         //         ),
          //         //       ),
          //         //     ),
          //         //   ),
          //         // ],
          //       );
          //     }));
          return Future.value(yes);
        },
        child: SafeArea(
          child: Stack(
            children: [
              AbsorbPointer(
                absorbing: !closedNoConnPopUp && //!isDownloading &&
                    (connectivity == ConnectivityResult.none ||
                        //showNoConnectivity||
                        !connectedToInternet!),
                child: Scaffold(
                  extendBody: true,
                  body: PageView(
                    pageSnapping: false,
                    controller: _pageController,
                    allowImplicitScrolling: false,
                    onPageChanged: (val) {
                      // if (val == 1) {
                      //   if (myDownloadState.currentState != null) {
                      //     myDownloadState.currentState!.updateList();
                      //   }
                      // }
                    },
                    physics: NeverScrollableScrollPhysics(),
                    children:
                        (sharedContent) ? widgetOptions : _widgetOptionsHome,
                  ),

                  //  (sharedContent) ? _widgetOptions[_selectedIndex] : _widgetOptionsHome[_selectedIndex],
                  floatingActionButton: selectedVideos.isEmpty ||
                          (visible == false && _selectedIndex != 0) ||
                          visible == true ||
                          (isLoading == true &&
                              ((isloadingVideos == true) &&
                                  (dataShared != null &&
                                      dataShared!.contains('http'))))
                      ? SizedBox.shrink()
                      : Container(
                          height: 95,
                          width: 95,
                          padding: EdgeInsets.all(7),
                          child: FloatingActionButton(
                              backgroundColor: Color(0xff69C9D0),
                              onPressed: () {
                                // GlobalKey<MyHomePageState> key = GlobalKey();
                                mykey.currentState!.handleDownload();
                                // setHomeState();
                                // MyHomePageMyHomePage(title: '').
                              },
                              // tooltip: 'Increment',
                              // mini: true,
                              child: SvgPicture.asset(
                                'images/icons/download.svg',
                                semanticsLabel: 'Acme Logo',
                                color: white,
                                height: 50,
                                width: 50,
                              )

                              // Icon(
                              //   FontAwesomeIcons.download,
                              //   size: 30,
                              // ),
                              ),
                        ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: ((isloadingVideos == true) &&
                          (dataShared != null && dataShared!.contains('http')))
                      ? SizedBox.shrink()
                      : BottomAppBar(
                          clipBehavior: Clip.antiAlias,
                          notchMargin: 0,
                          shape: selectedVideos.isEmpty ||
                                  (visible == false && _selectedIndex != 0) ||
                                  visible == true
                              ? null
                              : CircularNotchedRectangle(),
                          color: grey.shade100,
                          elevation: 2,
                          surfaceTintColor: Colors.transparent,
                          child: BottomNavigationBar(
                            elevation: 3,
                            // backgroundColor: grey.shade100,
                            // selectedItemColor: selectionColor,
                            showSelectedLabels: false,
                            showUnselectedLabels: false,
                            type: BottomNavigationBarType.fixed,
                            items: [
                              BottomNavigationBarItem(
                                icon: (sharedContent)
                                    ? SvgPicture.asset(
                                        'images/icons/download.svg',
                                        semanticsLabel: 'Acme Logo',
                                        color: _selectedIndex == 0
                                            ? selectionColor
                                            : grey,
                                        height: 30,
                                        width: 30,
                                      )
                                    : SvgPicture.asset(
                                        'images/icons/home.svg',
                                        semanticsLabel: 'Acme Logo',
                                        color: _selectedIndex == 0
                                            ? selectionColor
                                            : grey,
                                        height: 30,
                                        width: 30,
                                      ),
                                label: '',
                              ),
                              BottomNavigationBarItem(
                                icon: Padding(
                                  padding: EdgeInsets.only(
                                      right: selectedVideos.isEmpty ||
                                              (visible == false &&
                                                  _selectedIndex != 0) ||
                                              visible == true
                                          ? 0.0
                                          : 45),
                                  child: SvgPicture.asset(
                                    'images/icons/collection-play.svg',
                                    semanticsLabel: 'Acme Logo',
                                    color: _selectedIndex == 1
                                        ? selectionColor
                                        : grey,
                                    height: 30,
                                    width: 30,
                                  )

                                  // Icon(Icons.download, size: Theme.of(context).iconTheme.size,)

                                  ,
                                ),
                                label: '',
                              ),
                              // BottomNavigationBarItem(
                              //   icon: SizedBox.shrink(),
                              //   label: '',
                              // ),
                              BottomNavigationBarItem(
                                icon: Padding(
                                  padding: EdgeInsets.only(
                                      left: selectedVideos.isEmpty ||
                                              (visible == false &&
                                                  _selectedIndex != 0) ||
                                              visible == true
                                          ? 0.0
                                          : 45),
                                  child: SvgPicture.asset(
                                    'images/icons/question-circle.svg',
                                    semanticsLabel: 'Acme Logo',
                                    color: _selectedIndex == 2
                                        ? selectionColor
                                        : grey,
                                    height: 30,
                                    width: 30,
                                  )

                                  //  Icon(Icons.school)

                                  ,
                                ),
                                label: '',
                              ),
                              BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                                  'images/icons/gear.svg',
                                  semanticsLabel: 'Acme Logo',
                                  color: _selectedIndex == 3
                                      ? selectionColor
                                      : grey,
                                  height: 30,
                                  width: 30,
                                )

                                // Icon(Icons.settings)

                                ,
                                label: '',
                              ),
                            ],
                            currentIndex: _selectedIndex,
                            unselectedItemColor: Colors.grey,
                            onTap: (val) {
                              _onItemTapped(val);
                            },
                          ),
                        ),
                ),
              ),
              //checInternet!=null
              //checInternet!=null//&&((!checInternet!&&isTopConectivity)||(checInternet!&&!isTopConectivity))
              //?
              //!showNoConnectivity?const Text(''):
              BottomSheet(
                enableDrag: false,
                builder: (BuildContext context) {
                  //     bool checInternet = await checkConectivity();

                  return StreamBuilder<ConnectivityResult>(
                    stream: Connectivity().onConnectivityChanged,
                    builder: (context, snapshot) {
                      //checkConectivity(true,true,myMainState);
                      //if(!connectedToInternet!){showNoConnectivity=true;}
                      //Timer.periodic(const Duration(seconds:1),(timer){timer.cancel();myMainState((){});});
                      connectivity = snapshot.data;
                      if (!mounted) {
                        myMainState(() {});
                      }
                      return
                          //connectedToInternet!&
                          //(closedNoConnPopUp||(showNoConnectivity&&snapshot.data!=ConnectivityResult.none))
                          !closedNoConnPopUp && //!isDownloading &&
                                  (snapshot.data == ConnectivityResult.none ||
                                      //showNoConnectivity||
                                      !connectedToInternet!)
                              ?
                              //!showNoConnectivity?
                              Container(
                                  width: double.infinity,
                                  height: 50,
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "No network connection",
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        InkWell(
                                            onTap: () {
                                              closedNoConnPopUp = true;
                                              //showNoConnectivity=false;//!await checkConectivity();
                                              myMainState(() {});
                                            },
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                )
                              : const Text('');
                    },
                  );
                },
                onClosing: () {},
              )
              //: Container()
              ,
              (!sharedFinishCheck)
                  ? Container(
                      margin: const EdgeInsets.all(0),
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ))
                  : SizedBox.shrink()
            ],
          ),
        ));
  }

  _onItemTapped(int index) {
    if (_pageController!.hasClients && index != _selectedIndex) {
      _pageController!.jumpToPage(index);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> checkShared() async {
    var sharedData = await platform.invokeMethod('getSharedText');
    print("shared: $sharedData");
    // list
    // sharedData = "https://www.tiktok.com/@dark_tales0?_t=8bUPxztXeUQ&_r=1";
    // single https://vm.tiktok.com/ZMY78U3nj/
    //  sharedData = "https://www.tiktok.com/@bubu_dudu_world";
    // "https://vm.tiktok.com/ZMY78U3nj/";
    // sharedString =
    await Future.delayed(Duration(seconds: 0)).whenComplete(() {
      if (sharedData != null) {
        isShared = true;
        setState(() {
          sharedContent = true;
        });
        try {
          getSharedText(sharedData, context);
        } catch (e) {
          print('the error encountered is ${e.toString()}');
        }
      }
      setState(() {
        sharedFinishCheck = true;
      });
      debugPrint("finish check");
    });
  }

  setHomeState() {
    setState(() {});
  }

  void getWidgetOptions() {
    widgetOptions = [
      MyHomePage(
        title: '',
        pageController:_pageController,
        callback: (val) => _onItemTapped(val),
        key: mykey,
      ),
      Download(
        key: myDownloadState,
      ),
      School(),
      Settings()
    ];
    _widgetOptionsHome = [
      Home(),
      Download(
        key: myDownloadState,
      ),
      School(),
      Settings(),
    ];
  }

  getColFilter(int index) {
    if (index == 0) {
      setState(() {});
      return ColorFilter.mode(Colors.amber.shade800, BlendMode.srcIn);
    } else if (index == 1) {
      return ColorFilter.mode(Colors.amber.shade800, BlendMode.srcIn);
    } else {
      return ColorFilter.mode(grey.shade100, BlendMode.srcIn);
    }
  }
}

class Home extends StatelessWidget {
  const Home({key});

  void checkStorage() async {
    const permission = Permission.storage;
    final status = await permission.status;
    debugPrint('>>>Status $status');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0, right: 18),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: GestureDetector(
                  onTap: () async {
                    var value = await LaunchApp.openApp(
                        androidPackageName: 'com.zhiliaoapp.musically',
                        iosUrlScheme: 'tiktok://',
                        appStoreLink:
                            'https://apps.apple.com/us/app/tiktok/id835599320',
                        openStore: false);
                    print('openAppResult => $value ${value.runtimeType}');
                    //  print( await Permission.storage.status);
                    // PermissionStatus value = await Permission.storage.request();
                    // print(value.isDenied);

                    // checkdirectory();
                  },
                  child: Image.asset(
                    'images/TikTok.webp',
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Text(
                "This is the opening screen of the app. When first launched, you land here. ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey,
                    decoration: TextDecoration.none)),
          ),
          Expanded(
            child: Image.asset(
              'images/home_pic.jpg',
              width: 400,
            ),
          ),
          Container(
            margin: EdgeInsets.all(50),
            child: Text("My app v14.1.0",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey,
                    decoration: TextDecoration.none)),
          ),
          SizedBox(
            height: kBottomNavigationBarHeight,
          )
        ],
      ),
    );
  }

  Future<void> checkdirectory() async {
    if (!permStatus &&
        !(permStatus =
            (await Permission.storage.status == PermissionStatus.granted))) {
      await Permission.storage.request();
      // await Permission.videos.request();
      // await Permission.audio.request();
    } else {
      permStatus = await Permission.storage.isGranted;
    }
    String localPath =
        "/storage/emulated/0/Download/Gorilla TikTok Downloader/";
    final savedDir = Directory(localPath);
    final hasExisted = savedDir.existsSync();
    if (!hasExisted) {
      await savedDir.create();
    }
  }
}
