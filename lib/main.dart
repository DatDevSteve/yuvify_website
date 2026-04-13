import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:yuvify_website/pages/about_page.dart';
import 'package:yuvify_website/pages/contact_page.dart';
import 'package:yuvify_website/pages/event_page.dart';
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
        '/': (context) => const MainPage(),
        '/about': (context) => const AboutPage(),
        '/careers': (context) => const CareersPage(),
        '/events': (context) => const EventsPage(),
        '/contact': (context) => const ContactPage()
      },
    );
  }
}
