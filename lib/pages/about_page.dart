import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFFEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFFEF),
        elevation: 0,
        foregroundColor: const Color(0xFF275A47),
        title: const Text('About Yuvify'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Align(
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 840),
            child: Text(
              'Yuvify is a youth-driven platform built to turn voices into ideas and ideas into impact through thoughtful content, meaningful conversations, and curated events.',
              style: TextStyle(
                fontSize: 22,
                height: 1.5,
                color: Color(0xFF1E1E1E),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
