// lib/pages/careers_page.dart
import 'package:flutter/material.dart';

class CareersPage extends StatefulWidget {
  const CareersPage({super.key});

  @override
  State<CareersPage> createState() => _CareersPageState();
}

class _CareersPageState extends State<CareersPage> {
  String selectedRole = "Content Creator";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Careers at Yuvify"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Join the Yuvify Team",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedRole,
              items: const [
                DropdownMenuItem(
                  value: "Content Creator",
                  child: Text("Content Creator"),
                ),
                DropdownMenuItem(
                  value: "Podcast Team",
                  child: Text("Podcast Team"),
                ),
                DropdownMenuItem(
                  value: "Community Lead",
                  child: Text("Community Lead"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}