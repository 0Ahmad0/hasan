import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hasan_project/controller/video_provider.dart';
import 'package:hasan_project/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'controller/downloder_provider.dart';
import 'controller/uploader_provider.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  Provider.debugCheckInvalidValueType = null;
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return
      MultiProvider(
        providers: [
          // ChangeNotifierProvider(create: (_) => AppProvider()),
          // Provider<HomeProvider>(create: (_)=>HomeProvider()),
           Provider<DownloaderProvider>(create: (_)=>DownloaderProvider()),
           Provider<UploaderProvider>(create: (_)=>UploaderProvider()),
           Provider<VideoProvider>(create: (_)=>VideoProvider()),
          //     Provider<CreateEnvironmentProvider>(create: (_)=>CreateEnvironmentProvider()),
        ],
        child :MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: HomePage(),
                  )
            );

  }
}
