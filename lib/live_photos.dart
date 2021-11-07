import 'dart:async';

import 'package:flutter/services.dart';

class LivePhotos {
  static const MethodChannel _channel = const MethodChannel('live_photos');

  static Future<bool> generate({
    String? videoURL,
    String? localPath,
  }) async {
    assert(videoURL != null || localPath != null,
        'Either videoURL or localPath must be set.');
    assert(videoURL == null || localPath == null,
        'Either videoURL or localPath is only configurable.');
    if (videoURL != null) {
      final bool status = await _channel.invokeMethod(
        'generateFromURL',
        <String, dynamic>{
          "videoURL": videoURL,
        },
      );
      return status;
    } else {
      if (localPath != null) {
        final bool status = await _channel.invokeMethod(
          'generateFromLocalPath',
          <String, dynamic>{
            "localPath": localPath,
          },
        );
        return status;
      }
    }
    return false;
  }

  static Future<bool> openSettings() async {
    final bool status = await _channel.invokeMethod('openSettings');
    return status;
  }
}
