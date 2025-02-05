import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:frontend/services/provider_config.dart';
import 'package:image/image.dart' as img; // Image package for converting bytes to Image widget
import 'package:provider/provider.dart'; // Import provider package

class VideoPlayerPanel extends StatelessWidget {
  const VideoPlayerPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Consumer<FrameProvider>(  
            builder: (context, frameProvider, child) {
              final currentFrame = frameProvider.currentFrame;

              return currentFrame == null
                  ? const Text(
                      'Video playback will appear here.',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  : Image.memory(Uint8List.fromList(img.encodeJpg(currentFrame!)));
            },
          ),
        ),
      ),
    );
  }
}
