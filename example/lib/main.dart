import 'package:flutter/material.dart';
import 'package:live_photos/live_photos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('generate from url'),
              onPressed: () {
                LivePhotos.generate(
                  videoURL:
                      "https://img.gifmagazine.net/gifmagazine/images/3870471/original.mp4",
                ).then(
                  (value) {
                    if (value) {
                      print("Success");
                    } else {
                      print("Failed");
                    }
                  },
                ).catchError(
                  (e) => print(e),
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}
