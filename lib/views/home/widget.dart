import 'package:flutter/material.dart';

import '../../routes.dart';

class WidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (RouteGroup group in widget_routes) GroupCard(group),
      ],
    );
  }
}

class GroupCard extends StatelessWidget {
  final RouteGroup group;

  GroupCard(this.group);

  Widget _buildItem(BuildContext context, route) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FlutterLogo(
              size: 80,
            ),
            Row(
              children: <Widget>[
                Text(
                  route.title,
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
            Text(
              route.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var routes = group.routes;

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Theme.of(context).backgroundColor,
            child: Text(group.groupName,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>[
                for (final route in routes) _buildItem(context, route),
              ],
            ),
          )
        ],
      ),
    );
  }
}
