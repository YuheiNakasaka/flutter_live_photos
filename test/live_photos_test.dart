import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_photos/live_photos.dart';

void main() {
  const MethodChannel channel = MethodChannel('live_photos');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == "generateFromURL") {
        String? url = methodCall.arguments["videoURL"];
        if (url != null) {
          return true;
        } else {
          return false;
        }
      }
      return false;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('should return true if videoURL is valid url', () async {
    expect(await LivePhotos.generate(videoURL: "https://example.com/test.mp4"),
        true);
  });

  test('should return false if videoURL is null', () async {
    expect(await LivePhotos.generate(videoURL: null), false);
  });
}
