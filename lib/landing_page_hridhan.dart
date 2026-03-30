import 'package:flutter/material.dart';

class LandingPageHridhan extends StatefulWidget {
  const LandingPageHridhan({super.key});

  @override
  State<LandingPageHridhan> createState() => _LandingPageHridhanState();
}

class _LandingPageHridhanState extends State<LandingPageHridhan> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [Center(child: Text("Hridhan's Test Page\nhello mai tiwari ki nunni hu heheheh"),)],),
    );
  }
}