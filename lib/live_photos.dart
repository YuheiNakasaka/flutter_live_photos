import 'dart:async';

import 'package:flutter/services.dart';

class LivePhotos {
  static const MethodChannel _channel = const MethodChannel('live_photos');

  static Future<bool> generate({
    String videoURL,
  }) async {
    final bool status = await _channel.invokeMethod(
      'generateFromURL',
      <String, dynamic>{
        "videoURL": videoURL,
      },
    );
    return status;
  }

  static Future<bool> openSettings() async {
    final bool status = await _channel.invokeMethod('openSettings');
    return status;
  }
}
