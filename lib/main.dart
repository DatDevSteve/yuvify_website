import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:yuvify_website/pages/landing_page.dart';
import 'package:yuvify_website/pages/career_page.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yuvify',
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/careers': (context) => CareersPage(),
      },
    );
  }
}
