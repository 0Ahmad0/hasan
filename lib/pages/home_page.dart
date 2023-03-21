import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
  final jjj =  VideoThumbnail.thumbnailData(
  video: 'assets/video/1.mp4',
  imageFormat: ImageFormat.JPEG,
  maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
  quality: 25,
  );

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Vedios"),
            centerTitle: true,
            bottom: TabBar(
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
                      itemBuilder: (_, __) => Card(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(10.0),
                          width: double.infinity,
                          // height: MediaQuery.of(context).size.height / 3,
                          child: Column(
                            children: [

                              AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: VideoPlayer(controller),
                              ),

                              Container( //duration of video
                                child: Text("Total Duration: " + controller.value.duration.toString()),
                              ),
                              Container(
                                  child: VideoProgressIndicator(
                                      controller,
                                      allowScrubbing: true,
                                      colors:VideoProgressColors(
                                        backgroundColor: Colors.redAccent,
                                        playedColor: Colors.green,
                                        bufferedColor: Colors.purple,
                                      )
                                  )
                              ),

                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: (){
                                          if(controller.value.isPlaying){
                                            controller.pause();
                                          }else{
                                            controller.play();
                                          }

                                          setState(() {

                                          });
                                        },
                                        icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow)
                                    ),

                                    IconButton(
                                        onPressed: (){
                                          controller.seekTo(Duration(seconds: 0));

                                          setState(() {

                                          });
                                        },
                                        icon:Icon(Icons.stop)
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
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
              if (snapShot.hasData) {
                for (var i = 0; i < _tabs.length; i++)
                  return Shimmer.fromColors(
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
                                      right: MediaQuery.of(context).size.width /
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
                                      right: MediaQuery.of(context).size.width /
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
              } else
                return TabBarView(
                  children: [
                    for (var i = 0; i < _tabs.length; i++)
                      Card(
                        color: Colors.lime,
                      )
                  ],
                );
            },
          ),
        ));
  }
}
