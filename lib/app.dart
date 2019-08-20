import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './routes.dart';
import './views/home/index.dart';

class App extends StatelessWidget {
  static const String _title = 'Flutter Handbook';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return MaterialApp(
          home: HomePage(),
          routes: routes,
        );
      },
    );
  }
}
