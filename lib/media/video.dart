import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:level4/media/audio.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final VideoPlayerController _controller;
  bool _fullScreen = false;

  @override
  void initState() {
    super.initState();

    _controller =
        VideoPlayerController.networkUrl(
            Uri.parse(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            ),
          )
          ..initialize().then((_) {
            if (mounted) {
              setState(() {});
            }
          });
  }

  Future<void> toggleFullScreen() async {
    if (_fullScreen) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      if (!mounted) return;
      setState(() => _fullScreen = false);
    } else {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);

      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

      if (!mounted) return;
      setState(() => _fullScreen = true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    // Restore system UI and orientation preferences.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoReady = _controller.value.isInitialized;

    return Scaffold(
      appBar: _fullScreen ? null : AppBar(title: const Text('Video Player')),
      body: Center(
        child: videoReady
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_controller),
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      padding: const EdgeInsets.all(8),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            color: Colors.white,
                            iconSize: 48,
                            onPressed: () {
                              // _controller.addListener(() {
                              //   print("Listening");
                              // });

                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                            ),
                          ),
                          IconButton(
                            color: Colors.white,
                            onPressed: toggleFullScreen,
                            icon: Icon(
                              _fullScreen
                                  ? Icons.fullscreen_exit
                                  : Icons.fullscreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

// VideoPlayerController.networkUrl()	Creates a controller for a remote video.
// initialize()	Initializes the video and obtains its metadata.
// VideoPlayer(_controller)	Displays the actual video.
// aspectRatio	Preserves the video's proportions.
// play()	Starts playback.
// pause()	Pauses playback.
// VideoProgressIndicator	Displays playback progress and allows seeking.
// dispose()	Releases video resources.
