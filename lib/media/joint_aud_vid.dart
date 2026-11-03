
import 'package:flutter/material.dart';
import 'package:level4/media/audio.dart';
import 'package:level4/media/video.dart';

class MediaHomePage extends StatelessWidget {
  const MediaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media Learning App')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Icon(Icons.school, size: 90),
                const SizedBox(height: 16),
                const Text(
                  'Learning Centre',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.headphones),
                    title: const Text('Audio Lessons'),
                    subtitle: const Text('Listen to a lesson'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AudioPage()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.video_library),
                    title: const Text('Video Lessons'),
                    subtitle: const Text('Watch a lesson'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const VideoPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
