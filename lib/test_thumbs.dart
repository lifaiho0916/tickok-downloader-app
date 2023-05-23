import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_app/saved_videos.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class TestThumbnails extends StatelessWidget {
  final String path;
  const TestThumbnails(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: getBackgroundImage(path),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: const Color.fromARGB(239, 0, 0, 0),
            child: Container(
              //height: height,
              //width: width,
              color: Colors.white,
            ),
          );
        } else {
          return Image.memory(
            snapshot.requireData!,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          );
        }
      },
    );
  }

  Future<Uint8List?> getBackgroundImage(String path) async {
    if (!thumbnailBytes.containsKey(
        path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', ''))) {
      thumbnailBytes.addAll({
        path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', ''):
            await VideoThumbnail.thumbnailData(
          video: path,
          imageFormat: ImageFormat.JPEG,
          maxHeight: 480,
          maxWidth: 360,
          // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
          quality: 100,
        )
      });
    }
    return Future.value(thumbnailBytes[
        path.replaceAll('/storage/emulated/0/Download/Gorilla TikTok Downloader/', '')]);
  }
}
