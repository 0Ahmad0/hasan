import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

import '../../model/models.dart' as models;
import '../../model/models.dart';
import '../../model/utils/const.dart';


class CreateEnvironmentProvider with ChangeNotifier{
 // late models.Video video;
 // createGroups(context) async{
 //   for(models.Group group in TestModels.groups){
 //     this.group=group;
 //     await createGroup(context);
 //   }
 // }





  onError(error){
    print(false);
    print(error);
    return {
      'status':false,
      'message':error,
      //'body':""
    };
  }
}
