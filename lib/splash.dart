import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/helpers&widgets/loading.dart';
import 'package:new_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'models/downloading_model.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  bool? isDownloading;
  bool checkingStatus = true;
  int counter = 10;
  int initialCounterVal = 0;
  String? avatar = '';

  @override
  void initState() {
    super.initState();

    dlStatusinit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: checkingStatus == true
          ? Loading2()
          : isDownloading == true
              ? downloadingWidget()
              : MyStatefulWidget(),
    );
  }

  dlStatusinit({bool checkTimer = false}) async {
    await getDownloadingStatus().then((value) {
      if (value == true) {
        print('value4');
        isDownloading = true;
        Timer.periodic(Duration(seconds: 1), (timer) {
          counter--;
          if (counter == 0) {
            timer.cancel();
            print('counter at $counter');
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
          if (mounted) {
            setState(() {});
          }
        });
        // setState(() {});
      } else {
        isDownloading = false;
        setState(() {});
        print('false');
      }
    });
  }

  getDownloadingStatus() async {
    checkingStatus = true;
    List<Downloading> downloads = await getStatus();
    // print(downloads);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    avatar = prefs.getString('avatar') ?? '';

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
            setState(() {});
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
        setState(() {});
        return isDowloading;
      }
    } else {
      isDowloading = false;
      print('false4');
      checkingStatus = false;
      setState(() {});
      return isDowloading;
    }
  }

  Widget downloadingWidget() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('images/stop.png', width: 150, fit: BoxFit.cover),
          SizedBox(
            height: 30,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: LinearProgressIndicator()),
          // Text('You need to cancel',style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18,letterSpacing: .3),),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'You have a download in progress\n The app will close in $counter',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 18, letterSpacing: .3),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 15),
            child: InkWell(
              onTap: () {
                SystemChannels.platform.invokeMethod(
                    'SystemNavigator.pop'); // print(isDownloading);
              },
              child: Container(
                height: 38,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  'Exit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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

  Future updateDownload(Downloading downloading) async {
    // Get a reference to the database.
    final db = await dbRef();

    // Update the given status.
    await db.update(
      'status',
      downloading.toMap(),
      // Ensure that the status has a matching id.
      where: 'id = ?',
      // Pass the status id as a whereArg to prevent SQL injection.
      whereArgs: [downloading.id],
    );
  }
}



// https://v16-webapp-prime.tiktok.com/video/tos/useast2a/tos-useast2a-pve-0068/f447a46ea61f4a4e82188ce64084e1af/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=5334&bt=2667&cs=0&ds=3&ft=I~da4ou.D12NvlZV8ZIxR8GjYlJG-UjNSdepi9&mime_type=video_mp4&qs=0&rc=aDRlNmY7Ojw8aTQ1NjkzNUBpMzQzZDw6ZmxoZzMzNzczM0AyXjYuXjMuXy8xNTUtYGM1YSNycDZgcjQwcjBgLS1kMTZzcw%3D%3D&btag=80000
// https://v16-webapp.tiktok.com/9b20c1ccd51490c08aca02f7ffe5e8ba/638c83e6/video/tos/useast2a/tos-useast2a-pve-0068/a9be6737a9d949cba9aa39eab698bebf/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=5222&bt=2611&cs=0&ds=3&ft=IecA0ou.D12NvyZV8ZIxR3t_WlJG-UjNSNopi9&mime_type=video_mp4&qs=0&rc=aDplPDU1aDY6OjU4aDs8OEBpajRmZjg6ZjZ5ZzMzNzczM0A2YS9gNTMtNTAxNTZjMjUzYSMtXmBecjRvMTBgLS1kMTZzcw%3D%3D&l=2022120405254101018907221613B5C20D&btag=80000