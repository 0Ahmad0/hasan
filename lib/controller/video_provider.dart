import 'dart:math';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hasan_project/controller/utils/firebase.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';


import '../../model/models.dart';
import '../../model/utils/const.dart';



import 'dart:math' as Math;

class VideoProvider with ChangeNotifier{
  Video video=Video.init();
  Videos videos=Videos.init();
  List<Video> listVideo=[];
 fetchVideos(BuildContext context) async {
   var result;
     result= await FirebaseFun.fetchVideos();
     if(result['status']){
       videos=Videos.fromJson(result['body']);
     }else{
       Get.snackbar("Error", "${FirebaseFun.findTextToast(result['message'].toString())}");
      // Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
     }
   return result;

 }

 addVideo(BuildContext context,{required String path}) async {
   //report=Report(details: details,numReport: genOrderId(),idUser: profileProvider.user.id, dateTime: DateTime.now());
   var result;
     result=await FirebaseFun.addVideo(video: video);
   Get.snackbar("result", "${FirebaseFun.findTextToast(result['message'].toString())}");
   //Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
   return result;

 }
 updateReport(BuildContext context,{required Video video}) async {
   var result;
     result=await FirebaseFun.updateVideo(video: video);
   Get.snackbar("result", "${FirebaseFun.findTextToast(result['message'].toString())}");
   //Const.TOAST(context,textToast: FirebaseFun.findTextToast(result['message'].toString()));
   return result;

 }

}
