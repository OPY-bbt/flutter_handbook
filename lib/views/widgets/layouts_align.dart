import 'package:flutter/material.dart';

class AlignExample extends StatelessWidget {
  const AlignExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blueAccent,
        child: Align(
          alignment: Alignment.center,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}
