import 'package:admin_client_portfolio/screens/homepage.dart';
import 'package:admin_client_portfolio/screens/login.dart';
import 'package:admin_client_portfolio/screens/project/create_paragraph.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  "login_view": (context) => const LoginPage(),
  "home_view": (context) => const HomePage(),
  "paragraph_view": (context) => const ParagraphPage()
};
