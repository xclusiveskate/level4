import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullScreenPage extends StatefulWidget {
  const FullScreenPage({super.key});

  @override
  State<FullScreenPage> createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  bool isFullScreen = false;

  Future<void> toggleFullScreen() async {
    final nextMode = !isFullScreen;

    await SystemChrome.setEnabledSystemUIMode(
      nextMode ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );

    if (!mounted) return;

    setState(() {
      isFullScreen = nextMode;
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isFullScreen
          ? null
          : AppBar(title: const Text('Full-Screen Demo')),
      body: SafeArea(
        top: !isFullScreen,
        bottom: !isFullScreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.fullscreen, size: 100),
              const SizedBox(height: 20),
              Text(
                isFullScreen ? 'Full-screen mode' : 'Normal mode',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: toggleFullScreen,
                child: Text(
                  isFullScreen ? 'Exit full screen' : 'Enter full screen',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
