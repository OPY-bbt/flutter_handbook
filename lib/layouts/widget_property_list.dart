import 'package:flutter/material.dart';

import '../routes.dart';

class WidgetPropertyList extends StatelessWidget {
  final List<MyRoute> routes;
  final String title;
  const WidgetPropertyList({Key key, this.routes, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: <Widget>[
          for (MyRoute route in routes)
            ListTile(
              title: Text(route.title),
              subtitle: Text(route.description),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  route.path,
                );
              },
            ),
        ],
      ),
    );
  }
}
