import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_photos/live_photos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final picker = ImagePicker();
  String videoFile = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GenFromURLButton(),
            const SizedBox(height: 60),
            RaisedButton(
              child: Text('Select local video'),
              onPressed: () async {
                final pickedFile =
                    await picker.getVideo(source: ImageSource.gallery);
                setState(() {
                  videoFile = pickedFile.path;
                });
              },
            ),
            Text('path: $videoFile'),
            const SizedBox(height: 10),
            GenFromLocalPathButton(videoFile),
          ],
        )),
      ),
    );
  }
}

class GenFromURLButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('generate from url'),
      onPressed: () {
        LivePhotos.generate(
          videoURL:
              "https://img.gifmagazine.net/gifmagazine/images/3870471/original.mp4",
        ).then(
          (value) {
            if (value) {
              print("Success");
              showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    content: Text(
                        'You can set the downloaded gif in [Settings] > [Wallpaper].'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () => Navigator.pop(ctx),
                      ),
                      FlatButton(
                        child: Text('Open'),
                        onPressed: () => LivePhotos.openSettings(),
                      )
                    ],
                  );
                },
              );
            } else {
              print("Failed");
            }
          },
        ).catchError(
          (e) => print(e),
        );
      },
    );
  }
}

class GenFromLocalPathButton extends StatelessWidget {
  const GenFromLocalPathButton(this.path);

  final String path;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('generate from local path'),
      onPressed: () {
        if (path == '') {
          return;
        }
        LivePhotos.generate(
          localPath: path,
        ).then(
          (value) {
            if (value) {
              print("Success");
              showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    content: Text(
                        'You can set the downloaded gif in [Settings] > [Wallpaper].'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancel'),
                        onPressed: () => Navigator.pop(ctx),
                      ),
                      FlatButton(
                        child: Text('Open'),
                        onPressed: () => LivePhotos.openSettings(),
                      )
                    ],
                  );
                },
              );
            } else {
              print("Failed");
            }
          },
        ).catchError(
          (e) => print(e),
        );
      },
    );
  }
}
