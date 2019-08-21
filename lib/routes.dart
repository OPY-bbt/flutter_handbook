import 'package:flutter/material.dart';

import './views/widgets/layouts_align_list.dart';

class RouteGroup {
  final String groupName;
  final Widget icon;
  final List<MyRoute> routes;

  const RouteGroup({
    @required this.groupName,
    @required this.icon,
    @required this.routes,
  });
}

class MyRoute {
  final String title;
  final List<Route> routes;
  final Widget child;
  final String description;
  final String path;

  const MyRoute({
    @required this.title,
    @required this.path,
    this.child,
    this.routes,
    this.description,
  });
}

class RouteWidget extends StatelessWidget {
  final MyRoute route;

  RouteWidget({
    @required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(route.title)),
      body: route.child,
    );
  }
}

const widget_routes = <RouteGroup>[
  RouteGroup(
    groupName: 'Layouts',
    icon: Icon(Icons.dashboard),
    routes: <MyRoute>[
      MyRoute(
        title: 'Align',
        path: '/layout_align_list',
        description:
            "A widget that aligns its child within itself and optionally  widget that aligns its child within itself and optionally sizes itself based on the child's size.",
        child: AlignList(),
      ),
    ],
  ),
];

final allRoutes = widget_routes.expand((r) => r.routes);
final Map<String, WidgetBuilder> routes = {
  for (MyRoute route in allRoutes)
    route.path: (BuildContext context) => RouteWidget(route: route),
};
