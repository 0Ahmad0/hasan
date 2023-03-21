import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> _tabs = [
    {
      "text":"all",
      "icon":null
    },
    {
      "text":"Music",
      "icon":Icons.music_note
    },
    {
      "text":"Games",
      "icon":Icons.sports_esports_rounded
    },
    {
      "text":"Food",
      "icon":Icons.fastfood
    },
    {
      "text":"Sport",
      "icon":Icons.sports_handball
    },
    {
      "text":"Learning",
      "icon":Icons.school
    },
  ];
  bool _isPlay = true;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      _isPlay = false;
    });
    print('hello');
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Vedios"),
            centerTitle: true,
            bottom: TabBar(
              onTap: (index){
                print(index);
                _isPlay = true;
                Timer(Duration(seconds: 5), () {

                  setState(() {

                  });
                });

              },
              isScrollable: true,
              tabs: [
                for(var i =0 ; i < _tabs.length;i++)
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
          body: TabBarView(
            children: [
              for(var i =0 ; i < _tabs.length;i++)
              _isPlay?Shimmer.fromColors(
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
                        const SizedBox(height: 8.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 8.0,),

                            Container(
                              margin:  EdgeInsets.only(
                                right: MediaQuery.of(context).size.width /3
                              ),
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 8.0,),
                            Container(
                              margin:  EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width /2
                              ),
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
              ):Card(),
            ],
          ),
        )
    );
  }
}



