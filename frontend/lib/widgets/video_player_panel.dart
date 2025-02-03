import 'package:flutter/material.dart';

class VideoPlayerPanel extends StatelessWidget {
  const VideoPlayerPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black,  // Black background for the video panel
        child: Center(
          child: Text(
            'Video playback will appear here.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
