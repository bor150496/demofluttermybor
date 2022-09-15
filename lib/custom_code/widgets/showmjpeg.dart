// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class Showmjpeg extends StatefulWidget {
  const Showmjpeg({
    Key? key,
    this.width,
    this.height,
    required this.url,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String url;

  @override
  _ShowmjpegState createState() => _ShowmjpegState();
}

class _ShowmjpegState extends State<Showmjpeg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      width: double.infinity,
      height: widget.height,
      alignment: Alignment.center,
      child: Mjpeg(
        isLive: true,
        fit: BoxFit.fill,
        loading: (context) {
          return new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
            ],
          );
        },
        error: (context, error, stack) {
          print(error);
          print(stack);
          return Showmjpeg(url: widget.url);
        },
        stream: widget.url, //'http://192.168.1.37:8081',
      ),
    );
  }
}
