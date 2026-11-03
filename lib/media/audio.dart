import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final AudioPlayer _player = AudioPlayer(); //instantiate the

  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      
      await _player.setUrl(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      );
    } catch (e) {
      _error = 'Unable to load audio: $e';
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Player')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.headphones, size: 100),
              const SizedBox(height: 16),
              const Text('My Audio Lesson', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 24),
              if (_loading)
                const CircularProgressIndicator()
              else if (_error != null)
                Text(_error!)
              else
                StreamBuilder<PlayerState>(
                  stream: _player.playerStateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    final isPlaying = state?.playing ?? false;
                    final completed =
                        state?.processingState == ProcessingState.completed;

                    return IconButton(
                      iconSize: 64,
                      onPressed: () async {
                        if (completed) {
                          await _player.seek(Duration.zero);
                          await _player.play();
                        } else if (isPlaying) {
                          await _player.pause();
                        } else {
                          await _player.play();

                          
                        }
                      },
                      icon: Icon(
                        isPlaying && !completed
                            ? Icons.pause_circle
                            : Icons.play_circle,
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}


// 1. AudioPlayer() creates an audio player.
// 2. initState() loads the audio when the page is initialized.
// 3. setUrl() loads a remote audio file.
// 4. play() starts playback.
// 5. pause() pauses playback.
// 6. seek() changes the playback position.
// 7. dispose() releases the player when the page is removed.
// 8. StreamBuilder listens to playback-state changes and rebuilds the relevant UI.
