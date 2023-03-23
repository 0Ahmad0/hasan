import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hasan_project/pages/upload_video_page.dart';
import 'package:hasan_project/pages/video_player_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var getVideo;

  List<Map<String, dynamic>> _tabs = [
    {"text": "all", "icon": null},
    {"text": "Music", "icon": Icons.music_note},
    {"text": "Games", "icon": Icons.sports_esports_rounded},
    {"text": "Food", "icon": Icons.fastfood},
    {"text": "Sport", "icon": Icons.sports_handball},
    {"text": "Learning", "icon": Icons.school},
  ];
  Future<bool> getData() {
    return Future.delayed(Duration(seconds: 5), () {
      return true;
    });
  }

  late TabController _tabController;

  @override
  void initState() {
    loadVideoPlayer();
    generateThumbnail();
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late VideoPlayerController controller;
  loadVideoPlayer(){
    controller = VideoPlayerController.asset('assets/video/1.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value){
      setState(() {});
    });

  }
  String? _thumbnailFile;

  String? _thumbnailUrl;

  Uint8List? _thumbnailData;


  Future<File> copyAssetFile(String assetFileName) async {
    Directory tempDir = await getTemporaryDirectory();
    final byteData = await rootBundle.load(assetFileName);

    File videoThumbnailFile = File("${tempDir.path}/$assetFileName")
      ..createSync(recursive: true)
      ..writeAsBytesSync(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return videoThumbnailFile;
  }

  void generateThumbnail() async {
    File videoTempFile1 = await copyAssetFile("assets/video/1.mp4");
    File videoTempFile2 = await copyAssetFile("assets/video/2.mp4");

    _thumbnailFile = await VideoThumbnail.thumbnailFile(
        video: videoTempFile2.path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG);

    _thumbnailUrl = await VideoThumbnail.thumbnailFile(
        video:
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.WEBP);

    _thumbnailData = await VideoThumbnail.thumbnailData(
      video: videoTempFile2.path,
      imageFormat: ImageFormat.JPEG,
      quality: 25,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.videocam),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>UploadVideoPage()));
              }, label: const Text('Upload')
          ),
          appBar: AppBar(
            title: const Text("Vedios"),
            centerTitle: true,
            bottom: TabBar(
              onTap: (index){
              },
              isScrollable: true,
              tabs: [
                for (var i = 0; i < _tabs.length; i++)
                  Tab(
                    child: Row(
                      children: [
                        Icon(_tabs[i]['icon']),
                        Text(_tabs[i]['text']),
                      ],
                    ),
                  )
              ],
            ),
          ),
          body: FutureBuilder(
            future: getData(),
            builder: (context, snapShot) {
              return snapShot.hasData
                  ? ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (_, __) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: .2
                      )
                    ]
                  ),
                  margin: const EdgeInsets.all(10.0),
                  width: double.infinity,
                   height: MediaQuery.of(context).size.height / 3.75,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.memory(
                              _thumbnailData!,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              height:
                              MediaQuery.of(context).size.height / 3,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            ViderPlayerScreen(
                                              controller: controller,
                                            )));
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black45,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.blue,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.shade100,
                                borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Text(
                                  '${controller.value.duration.inMinutes}'
                                  ':'
                                  '${controller.value.duration.inSeconds}'
                              ),
                            ),
                            const SizedBox(width: 10.0,),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.redAccent.shade100,
                                borderRadius: BorderRadius.circular(4.0)
                              ),
                              child: Text(
                                 '${controller.dataSource}'
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: _tabs.length,
              )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      // enabled: _enabled,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(10.0),
                        itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 6,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width /
                                                3),
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width /
                                                2),
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        itemCount: _tabs.length,
                      ),
                    );
            },
          ),
        ));
  }
}
