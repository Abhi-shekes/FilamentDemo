import 'package:flutter/material.dart';
import 'config_panel.dart';
import 'video_player_panel.dart';

class VideoAnalysisPage extends StatefulWidget {
  const VideoAnalysisPage({super.key});

  @override
  _VideoAnalysisPageState createState() => _VideoAnalysisPageState();
}

class _VideoAnalysisPageState extends State<VideoAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Returning `false` prevents the back navigation.
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FilamentAI'),
          centerTitle: true,
          backgroundColor: Colors.teal,
          automaticallyImplyLeading: false, // This removes the back arrow button
        ),
        backgroundColor: Colors.lightBlue[50],
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              ConfigPanel(),  // This is the left panel with config options.
              SizedBox(width: 20),
              VideoPlayerPanel(),  // This is the right panel for video playback.
            ],
          ),
        ),
      ),
    );
  }
}
