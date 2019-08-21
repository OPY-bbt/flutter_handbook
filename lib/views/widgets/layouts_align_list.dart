import 'package:flutter/material.dart';

class AlignList extends StatelessWidget {
  const AlignList({Key key}) : super(key: key);

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
