import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/helpers&widgets/styling.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'saved_videos.dart';






class ThumbnailWidget extends StatefulWidget {
  final String path;
  final onTap;
  final onFinishLoading;
  final onLongPress;
  final List<FileSystemEntity>? selectedfolders;
  final Map<String, Uint8List?>? thumbnailByteslist;
  final FileSystemEntity? item;
  final bool? selectall;
  final bool isPlayVisible;
  final Uint8List? list;
  final File? thumbnailFile;
  const ThumbnailWidget(
      {Key? key,
      required this.path,
        required this.isPlayVisible,
      this.onTap,
        this.onFinishLoading,
      this.onLongPress,
      this.selectedfolders,
      this.selectall,
      this.list,
      this.item,
      this.thumbnailByteslist,
      this.thumbnailFile}): super(key: key);


  @override
  State<ThumbnailWidget > createState() => _ThumbnailWidgetState();
}
class _ThumbnailWidgetState extends State<ThumbnailWidget> {

  bool showPlay = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(milliseconds: 500),
              (timer) {
            timer.cancel();
            setState(() {
              showPlay = true;
            });
          });
    });
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      // onTap: () async {
      //   print(await thumbnailFile!.exists());
      //   // print(Directory(thumbnailFile!.path).existsSync());
      // },
      onTap: !widget.thumbnailByteslist!.containsKey(widget.item!.path
              .replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', ''))
          ? widget.onTap
          : widget.onTap,
      onLongPress: widget.onLongPress,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            color: Color(0xff181d39),
            alignment: Alignment.center,
            child: SizedBox(
                height: 50,
                width: 50,
                child:CircularProgressIndicator(color: Color(0xff7391c3))
            ),
          ),
          FutureBuilder(
            future: widget.thumbnailFile!.exists(),

            builder: (BuildContext context, AsyncSnapshot snapshot) {

              return snapshot.data == true
                  ?
              Image.file(
                File(widget.thumbnailFile!.path),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              )
                  : Container(
                      color: black,
                    );
            },
          ),
          if(showPlay && widget.isPlayVisible)
            Center(
              child: SvgPicture.asset(
                'images/icons/play-fill.svg',
                semanticsLabel: 'Acme Logo',
                color: white,
                height: 45,
                width: 45,
              ),
            ),
        ],
      ),
    );

    // FutureBuilder<Uint8List?>(
    //   key: UniqueKey(),
    //   future: getBackgroundImage(),
    //   builder: (context, snapshot) {
    //     // print(snapshot.connectionState);
    //     if (snapshot.connectionState != ConnectionState.done) {
    //       return Container(
    //         color: Colors.black,
    //         alignment: Alignment.center,
    //         child: Image.asset('images/loading.gif'),
    //       );
    //     } else {
    //       return InkWell(
    //         onTap: onTap,
    //         onLongPress: onLongPress,
    //         child: Stack(
    //           fit: StackFit.passthrough,
    //           children: [
    //             Image.memory(
    //               list!,
    //               filterQuality: FilterQuality.high,
    //               fit: BoxFit.cover,
    //             ),
    //             selectedfolders!.isEmpty && !selectall!
    //                 ? Center(
    //                     child: Icon(
    //                       Icons.play_arrow,
    //                       color: Colors.white,
    //                       size: 30,
    //                     ),
    //                   )
    //                 : SizedBox.shrink()
    //           ],
    //         ),
    //       );
    //     }
    //   },
    // );
  }

  Future<Uint8List?> getBackgroundImage() async {
    if (!thumbnailBytes.containsKey(
        widget.path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', ''))) {
      thumbnailBytes.addAll({
        widget.path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', ''):
            await VideoThumbnail.thumbnailData(
          video: widget.path,
          imageFormat: ImageFormat.JPEG,
          maxHeight: 480,
          maxWidth: 360,
          quality: 100,
        )
      });
    }
    return thumbnailBytes[
    widget.path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', '')];
  }
}
