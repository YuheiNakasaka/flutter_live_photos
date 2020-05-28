# live_photos

Generate LivePhotos from video url and it's downloaded to Camera Roll.

This package is available for only iOS. 

## Usage

To use this plugin, add `live_photos` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

### iOS

Make sure you add the following key to Info.plist for iOS.

```
<key>NSPhotoLibraryAddUsageDescription</key>
<string>To read/save photos and videos.</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>To read/save photos and videos.</string>
```

## Example

```dart
import 'package:live_photos/live_photos.dart';

LivePhotos.generate(
  videoURL: "https://img.gifmagazine.net/gifmagazine/images/3870471/original.mp4",
).then((status) {
  if (status) {
    print("Success to generate LivePhotos");
  } else {
    print("Failed to convert");
  }
});
```
### Available format
For now, the plugin can convert only the mp4 video.

- mp4

If you want other formats, feel free to send Pull Request. 