import 'package:flutter/material.dart';

import './views/widgets/layouts_align.dart';

class RouteGroup {
  final String groupName;
  final Widget icon;
  final List<Route> routes;

  const RouteGroup({
    @required this.groupName,
    @required this.icon,
    @required this.routes,
  });
}

class Route extends StatelessWidget {
  final String title;
  final List<Route> routes;
  final Widget child;
  final String description;

  const Route(
      {@required this.title, this.child, this.routes, this.description});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

const widget_routes = <RouteGroup>[
  RouteGroup(
    groupName: 'Layouts',
    icon: Icon(Icons.dashboard),
    routes: <Route>[
      Route(
        title: 'Align',
        description:
            "A widget that aligns its child within itself and optionally  widget that aligns its child within itself and optionally sizes itself based on the child's size.",
        child: AlignExample(),
      ),
    ],
  ),
];

final allRoutes = widget_routes.expand((r) => r.routes);
final Map<String, WidgetBuilder> routes = {
  for (Route route in allRoutes) route.title: (BuildContext context) => route,
};
