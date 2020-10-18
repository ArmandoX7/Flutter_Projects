import 'package:flutter/material.dart';
import 'package:hello_world/src/pages/alert_page.dart';
import 'package:hello_world/src/pages/avatar_page.dart';
import 'package:hello_world/src/pages/card_page.dart';
import 'package:hello_world/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardtPage(),
  };
}
