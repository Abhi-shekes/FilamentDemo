import 'package:flutter/material.dart';
import 'package:image/image.dart' as img; 

// FrameProvider manages the current frame state.
class FrameProvider with ChangeNotifier {
  img.Image? _currentFrame;

  // Getter to retrieve the current frame.
  img.Image? get currentFrame => _currentFrame;

  // Setter to update the current frame and notify listeners.
  void setFrame(img.Image frame) {
    _currentFrame = frame;
    notifyListeners();  // Notify all listeners that the frame has been updated
  }
}
