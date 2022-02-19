import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'like_icon.dart';
import 'options_screen.dart';

class ContentScreen extends StatefulWidget {
  final String src;

  const ContentScreen({Key key, this.src}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  VideoPlayerController _videoPlayerController;

  ChewieController _chewieController;
  bool _liked = false;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null &&
            _chewieController.videoPlayerController.value.isInitialized
        ? GestureDetector(
            onTap: () {
              // Wrap the play or pause in a call to `setState`. This ensures the
              // correct icon is shown.
              setState(() {
                // If the video is playing, pause it.
                if (_videoPlayerController.value.isPlaying) {
                  _videoPlayerController.pause();
                } else {
                  // If the video is paused, play it.
                  _videoPlayerController.play();
                }
              });
            },
            // Display the correct icon depending on the state of the player.
            child: Chewie(
              controller: _chewieController,
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading...')
            ],
          );
  }
}
//Thanks for watching source code will be available on description
//Like share and Subscribe
