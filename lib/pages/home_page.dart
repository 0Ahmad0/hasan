import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('hello');
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
                          height: MediaQuery.of(context).size.height / 4.5,
                          child: Column(
                            children: [
                              Expanded(child: FlutterLogo()),
                              Divider(color: Colors.blue),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Icon(Icons.date_range),
                                        Text(
                                            '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Icon(Icons.article),
                                        Text('Ahmad Alhariri'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Icon(Icons.category),
                                        Text('All'),
                                      ],
                                    ),
                                  ),
                                ],
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
