import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoExample extends StatefulWidget {
  const VideoExample({super.key});

  @override
  State<VideoExample> createState() => _VideoExampleState();
}

class _VideoExampleState extends State<VideoExample> {
  late VideoPlayerController _videoController;
  late Future _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _videoController =VideoPlayerController.networkUrl(
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    );

    _initializeVideoPlayerFuture=_videoController.initialize();
    _videoController.setLooping(true);
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        title: const Text("Video Player Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(future: _initializeVideoPlayerFuture, builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              return AspectRatio(aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(onPressed: (){
              setState(() {
                if(_videoController.value.isPlaying){
                  _videoController.pause();
                } else {
                  _videoController.play();
                }
              }
              );
            },
              child: Icon(_videoController.value.isPlaying?Icons.pause:Icons.play_arrow),
            ),
          )
        ],
      ),
    ),);
  }
}
