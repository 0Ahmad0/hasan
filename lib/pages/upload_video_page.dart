import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideoPage extends StatefulWidget {
  const UploadVideoPage({Key? key}) : super(key: key);

  @override
  State<UploadVideoPage> createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  late final VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset('assets/video/1.mp4');
    super.initState();
  }

  loadVideoPlayer(String path) {
    _videoPlayerController = VideoPlayerController.asset(path);
    // _videoPlayerController.addListener(() {
    //   setState(() {});
    // });
    // _videoPlayerController.initialize().then((value) {
    //   setState(() {});
    // });
  }

  XFile? cameraPicker;
  XFile? galleryPicker;

  _pickVideoFromCamera() async {
    cameraPicker = await ImagePicker().pickVideo(source: ImageSource.camera);
    _videoPlayerController = loadVideoPlayer(cameraPicker!.path);
    setState(() {});
  }

  _pickVideoFromGallery() async {
    galleryPicker = await ImagePicker().pickVideo(source: ImageSource.gallery);
    _videoPlayerController = loadVideoPlayer(galleryPicker!.path);

    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Video'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: _pickVideoFromGallery,
                        child: const ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('From Gallery'),
                          trailing: Icon(Icons.videocam_rounded),
                        ),
                      )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: _pickVideoFromCamera,
                        child: const ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('From Camera'),
                          trailing: Icon(Icons.camera_alt),
                        ),
                      )),
                    ],
                  ),
                  Expanded(
                          child: AspectRatio(
                          aspectRatio: 10.0,
                          child: VideoPlayer(_videoPlayerController),
                        ))
                ],
              )),
              DropdownButtonFormField(
                  items: [
                    for (int i = 0; i < 10; i++)
                      DropdownMenuItem(
                        child: Text('$i'),
                        value: i,
                      )
                  ],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Select Category'),
                  validator: (val) {
                    if (val == null) {
                     return 'This Filed Is Required';
                    }
                  },
                  onChanged: (val) {}),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60.0)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text("Done"))
            ],
          ),
        ),
      ),
    );
  }
}
