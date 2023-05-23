import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/helpers&widgets/custom_text.dart';
import 'package:new_app/helpers&widgets/helper_class.dart';
import 'package:new_app/helpers&widgets/loading.dart';
import 'package:new_app/helpers&widgets/styling.dart';
import 'package:new_app/welcomescren.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool showVideos = false;
  String videoQuality = Constants().hdVideo;
  List videoQualities = [
    Constants().sdVideo,
    Constants().hdVideo,
    Constants().regularVideo
  ];
  bool loadingSaveStatus = true;
  @override
  void initState() {
    getLocalStorageView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadingSaveStatus == true
          ? Loading()
          : ListView(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomText(
                    text: 'Download same TikToks again?',
                    size: 18,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: grey),
                  //   borderRadius: BorderRadius.circular(9),
                  // ),
                  child: ListTile(
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();

                      if (showVideos == true) {
                        showVideos = false;
                        preferences.setBool('localStorage', false);
                      } else {
                        showVideos = true;
                        preferences.setBool('localStorage', true);
                      }
                      setState(() {});
                    },
                    contentPadding:
                        EdgeInsets.only(bottom: 6, left: 20, right: 20),
                    tileColor: grey.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    title: AutoSizeText(
                      'Show already downloaded TikToks for repeat download?',
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 18,
                      ),
                    ),
                    subtitle: AutoSizeText(
                      'If checked, you will be able to download same TikToks more than once. ',
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 14,
                      ),
                    ),
                    trailing: Switch(
                        value: showVideos,
                        activeColor: Color(0XFFED1C53),
                        onChanged: (val) async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          showVideos = val;
                          preferences.setBool(
                              Constants().storageVal, showVideos);
                          setState(() {});
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 8),
                  child: CustomText(
                    text: 'Download quality',
                    size: 18,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0XFFD9D9D9)),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(9),
                          topLeft: Radius.circular(9))),
                  child: ListTile(
                    // controlAffinity: ListTileControlAffinity.trailing,
                    // value: Constants().hdVideo,
                    // groupValue: videoQuality,
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      videoQuality = Constants().hdVideo;
                      preferences.setString(
                          Constants().videoQuality, videoQuality);
                      setState(() {
                        videoQuality = Constants().hdVideo;
                      });
                    },
                    contentPadding:
                        EdgeInsets.only(bottom: 6, left: 20, right: 20),
                    tileColor: Color(0XFFFFFFFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(9),
                            topLeft: Radius.circular(9))),
                    title: AutoSizeText(
                      'High resolution (HD)',
                      overflow: TextOverflow.ellipsis,
                      // maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      // presetFontSizes: [14],
                    ),
                    subtitle: AutoSizeText(
                      'High quality HD TikToks but may slightly slow down downloading speed.',
                      maxLines: 5,
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 14,
                      ),
                      // fontFam: 'roboto',
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: videoQuality != Constants().hdVideo
                          ? Image.asset('images/unchecked.png')

                          : Image.asset('images/checked.png')
                    ),
                    // onChanged: <String>(val) async {
                    //   SharedPreferences preferences = await SharedPreferences.getInstance();
                    //   videoQuality = val;
                    //   preferences.setString(Constants().videoQuality, videoQuality);
                    //   setState(() {
                    //     videoQuality = Constants().hdVideo;
                    //   });
                    // },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Color(0XFFD9D9D9)),
                          left: BorderSide(color: Color(0XFFD9D9D9)))),
                  child: ListTile(
                    // controlAffinity: ListTileControlAffinity.trailing,
                    // value: Constants().sdVideo,
                    // groupValue: videoQuality,
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      videoQuality = Constants().sdVideo;
                      preferences.setString(
                          Constants().videoQuality, videoQuality);
                      setState(() {
                        videoQuality = Constants().sdVideo;
                      });
                    },
                    contentPadding:
                        EdgeInsets.only(bottom: 6, left: 20, right: 20),
                    tileColor: Color(0XFFFFFFFF),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                    title: AutoSizeText(
                      'Standard resolution',
                      overflow: TextOverflow.ellipsis,
                      // maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: AutoSizeText(
                      'Standard or normal TikToks quality. Faster downloading speed.',
                      maxLines: 5,
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 14,
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: videoQuality != Constants().sdVideo
                          ? Image.asset('images/unchecked.png')
                          : Image.asset('images/checked.png')
                    ),
                    // onChanged: <String>(val) async {
                    //   SharedPreferences preferences = await SharedPreferences.getInstance();
                    //   videoQuality = val;
                    //   preferences.setString(Constants().videoQuality, videoQuality);
                    //   setState(() {
                    //     videoQuality = Constants().sdVideo;
                    //   });
                    // },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0XFFD9D9D9)),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(9),
                          bottomLeft: Radius.circular(9))),
                  child: ListTile(
                    // controlAffinity: ListTileControlAffinity.trailing,
                    // value: Constants().regularVideo,
                    // groupValue: videoQuality,
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      videoQuality = Constants().regularVideo;
                      preferences.setString(
                          Constants().videoQuality, videoQuality);
                      setState(() {
                        videoQuality = Constants().regularVideo;
                      });
                    },
                    contentPadding:
                        EdgeInsets.only(bottom: 6, left: 20, right: 20),
                    tileColor: Color(0XFFFFFFFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(9),
                            bottomLeft: Radius.circular(9))),
                    title: AutoSizeText(
                      'Watermark',
                      overflow: TextOverflow.ellipsis,
                      // maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: AutoSizeText(
                      'Original video quality showing TikTok watermark',
                      maxLines: 5,
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 14,
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: videoQuality != Constants().regularVideo
                          ? Image.asset('images/unchecked.png')
                          : Image.asset('images/checked.png')
                    ),
                    // onChanged: <String>(val) async {
                    //   SharedPreferences preferences = await SharedPreferences.getInstance();
                    //   videoQuality = val;
                    //   preferences.setString(Constants().videoQuality, videoQuality);
                    //   setState(() {
                    //     videoQuality = Constants().regularVideo;
                    //   });
                    // },
                  ),
                )
              ],
            ),
    );
  }

  getLocalStorageView() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    showVideos = preferences.getBool(Constants().storageVal) ?? false;
    videoQuality =
        preferences.getString(Constants().videoQuality) ?? Constants().hdVideo;
    loadingSaveStatus = false;
    setState(() {});
  }
}
