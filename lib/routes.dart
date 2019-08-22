import 'package:flutter/material.dart';

import './layouts/widget_property_list.dart';
import './views/widgets/layout_align_alignment.dart';

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
  final List<MyRoute> routes;
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

  isSameGroup(MyRoute r) {
    var groupName = route.path.replaceFirst("_list", "");
    return r.path.startsWith(groupName);
  }

  @override
  Widget build(BuildContext context) {
    if (route.path.endsWith("_list")) {
      return WidgetPropertyList(
          title: route.title,
          routes: allRoutes
              .where((v) => (isSameGroup(v) && !v.path.endsWith("_list")))
              .toList());
    }

    return Scaffold(
      appBar: AppBar(title: Text(route.title)),
      body: route.child,
    );
  }
}

// path以_list表示属性列表页
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
      ),
      MyRoute(
        title: 'Align-alignment',
        path: '/layout_align_alignment',
        description: "How to align the child.",
        child: AlignAlignment(),
      ),
    ],
  ),
];

final allRoutes = widget_routes.expand((r) => r.routes);
final Map<String, WidgetBuilder> routes = {
  for (MyRoute route in allRoutes)
    route.path: (BuildContext context) => RouteWidget(route: route),
};
