import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuvify_website/components/footer.dart';
import 'package:yuvify_website/components/header.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  static const Color _background = Color(0xFFFEFFEF);
  static const Color _green = Color(0xFF275A47);
  static const Color _text = Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;
    final isCompact = width < 1280;

    return Scaffold(
      backgroundColor: _background,
      endDrawer: isCompact ? const YuvifyHeaderDrawer() : null,
      appBar: YuvifyHeader(isCompact: isCompact),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                isCompact ? 16 : 38,
                isCompact ? 24 : 26,
                isCompact ? 16 : 38,
                isCompact ? 90 : 120,
              ),
              child: _EventsCanvas(
                width: width,
                height: height,
                isCompact: isCompact,
              ),
            ),
            const YuvifyFooter(),
          ],
        ),
      ),
    );
  }
}

class _EventsCanvas extends StatelessWidget {
  const _EventsCanvas({
    required this.width,
    required this.height,
    required this.isCompact,
  });

  final double width;
  final double height;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final panelHeight = isCompact
        ? (height * 0.62).clamp(420.0, 760.0)
        : (height * 0.9).clamp(720.0, 1200.0);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: panelHeight),
      padding: EdgeInsets.fromLTRB(
        isCompact ? 24 : 52,
        isCompact ? 32 : 48,
        isCompact ? 24 : 52,
        isCompact ? 40 : 52,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFE9DFC8), Color(0xFFF7F1E0), Color(0xFFE6EEDC)],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 28,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isCompact ? width : 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.3),
              Text(
                'Experiences that feel intentional, creative and, youth-led.',
                style: GoogleFonts.kalnia(
                  fontSize: isCompact ? 42 : 64,
                  height: 0.98,
                  fontWeight: FontWeight.w500,
                  color: EventsPage._green,
                ),
              ),
              SizedBox(height: isCompact ? 16 : 20),
              Container(
                width: isCompact ? 140 : 180,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xFF866E53),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              SizedBox(height: isCompact ? 24 : 34),
              Text(
                'From community conversations to curated pop-ups, Yuvify events are being shaped as spaces where fresh ideas meet real people and lasting energy',
                style: GoogleFonts.inriaSans(
                  fontSize: isCompact ? 20 : 28,
                  height: 1.22,
                  color: EventsPage._text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
