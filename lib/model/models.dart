import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class Advance {
  static bool theme = false;
  static bool language = false;
  static bool isRegisterKEY = false;
  static bool isLogined = false;
  static String token = "";
  static String uid = "";
  static String avatarImage = "";
}


//Video
class Video {
  String id;
  int index;
  String name;
  int sizeFile;
  String url;
  String urlTempPhoto;
  String localUrl;
  String typeVideo;
  String senderId;
  String category;
  DateTime sendingTime;
  Video(
      {this.id="",
      this.index=-1,
      this.sizeFile=0,
      required this.name,
       this.url="",
       this.urlTempPhoto="",
       this.localUrl="",
        required this.category,
      required this.typeVideo,
      required this.senderId,
      required this.sendingTime});
  factory Video.fromJson( json){


    String tempLocalUrl="";
    if(json.data().containsKey("localUrl")){
      tempLocalUrl=json["localUrl"];
    }
    int tempSizeFile=0;
    if(json.data().containsKey("sizeFile")){
      tempSizeFile=json["sizeFile"];
    }
    String tempUrlTempPhoto="";
    if(json.data().containsKey("urlTempPhoto")){
      tempUrlTempPhoto=json["urlTempPhoto"];
    }
    return Video(
      url: json["url"],
        localUrl: tempLocalUrl,
        name: json["name"],
        category: json["category"],
        sendingTime: json["sendingTime"].toDate(),
        senderId: json["senderId"],
        urlTempPhoto: tempUrlTempPhoto,
        sizeFile: tempSizeFile,
        typeVideo: json["typeVideo"]);
  }
  Map<String,dynamic> toJson() {

    return {
      'name': name,
      'typeVideo': typeVideo,
      'category': category,
      'senderId': senderId,
      'sendingTime': sendingTime,
      'urlTempPhoto': urlTempPhoto,
      'sizeFile': sizeFile,
      'url': url,
      'localUrl': localUrl,
    };
  }
}


//Videos
class Videos {
  String id;
  List<Video> listVideo;

  Videos({
     this.id='',
    required this.listVideo,
  });
  factory Videos.fromJson( json){
    List<Video> tempList = [];
    for(int i=1;i<json['messages'].length;i++){

      Video temp=Video.fromJson(json['listVideo'][i]);
      temp.id=json['listVideo'][i].id;
      tempList.add(temp);
    }
    return Videos(
        id: json['id'],
        listVideo: tempList,

          );
  }

  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> tempMap= [];
    for(Video element in listVideo){
      tempMap.add(element.toJson());
    }
    return {
    'id':id,
    'listVideo':tempMap,
  };
  }
}




/*

flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations"
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations" -o "locale_keys.g.dart" -f keys
flutter build apk --split-per-abi
./gradlew signingReport ///SH1

 */
