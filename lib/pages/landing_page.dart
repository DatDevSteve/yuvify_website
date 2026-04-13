import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuvify_website/components/footer.dart';
import 'package:yuvify_website/components/header.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const Color _background = Color(0xFFFEFFEF);
  static const Color _green = Color(0xFF275A47);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    final isTablet = width >= 900 && width < 1200;

    return Scaffold(
      backgroundColor: _background,
      endDrawer: isMobile ? const YuvifyHeaderDrawer() : null,
      appBar: YuvifyHeader(isCompact: isMobile),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                isMobile ? 18 : 36,
                isMobile ? 22 : 28,
                isMobile ? 18 : 36,
                isMobile ? 60 : 90,
              ),
              child: Column(
                children: [
                  _LandingCycleSection(
                    isMobile: isMobile,
                    isTablet: isTablet,
                  ),
                  SizedBox(height: isMobile ? 70 : 110),
                  _WhatIsYuvifySection(
                    isMobile: isMobile,
                    isTablet: isTablet,
                  ),
                ],
              ),
            ),
            const YuvifyFooter(),
          ],
        ),
      ),
    );
  }
}

class _LandingCycleSection extends StatelessWidget {
  const _LandingCycleSection({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: isMobile ? 1.15 : isTablet ? 1.45 : 1.75,
            child: _CycleDiagram(isMobile: isMobile, isTablet: isTablet),
          ),
        ),
        SizedBox(height: isMobile ? 22 : 28),
        Text(
          'A platform built for the youth, by the youth',
          textAlign: TextAlign.center,
          style: GoogleFonts.inriaSans(
            fontSize: isMobile ? 28 : isTablet ? 40 : 48,
            height: 1.15,
            fontWeight: FontWeight.w700,
            color: MainPage._green,
          ),
        ),
      ],
    );
  }
}

class _CycleDiagram extends StatelessWidget {
  const _CycleDiagram({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final topCardWidth = isMobile ? 150.0 : isTablet ? 190.0 : 250.0;
    final topCardHeight = isMobile ? 78.0 : isTablet ? 92.0 : 118.0;
    final bottomCardWidth = isMobile ? 150.0 : isTablet ? 190.0 : 250.0;
    final bottomCardHeight = isMobile ? 78.0 : isTablet ? 92.0 : 118.0;
    final sidePadding = isMobile ? 4.0 : 20.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final voicesRect = Rect.fromCenter(
          center: Offset(width * 0.25, height * 0.32),
          width: topCardWidth,
          height: topCardHeight,
        );
        final impactRect = Rect.fromCenter(
          center: Offset(width * 0.75, height * 0.32),
          width: topCardWidth,
          height: topCardHeight,
        );
        final ideasRect = Rect.fromCenter(
          center: Offset(width * 0.50, height * 0.69),
          width: bottomCardWidth,
          height: bottomCardHeight,
        );

        return Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _CyclePainter(
                  voicesRect: voicesRect,
                  impactRect: impactRect,
                  ideasRect: ideasRect,
                  strokeColor: const Color(0xFF8E7152),
                ),
              ),
            ),
            Positioned.fromRect(
              rect: voicesRect.shift(Offset(sidePadding, 0)),
              child: const _CycleCard(label: 'Voices'),
            ),
            Positioned.fromRect(
              rect: impactRect.shift(Offset(-sidePadding, 0)),
              child: const _CycleCard(label: 'Impact'),
            ),
            Positioned.fromRect(
              rect: ideasRect,
              child: const _CycleCard(label: 'Ideas'),
            ),
          ],
        );
      },
    );
  }
}

class _CycleCard extends StatelessWidget {
  const _CycleCard({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    final isTablet = width >= 900 && width < 1200;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE7E4D7),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF8E7152), width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.mansalva(
            fontSize: isMobile ? 34 : isTablet ? 42 : 54,
            color: MainPage._green,
            shadows: const [
              Shadow(
                color: Color(0x26000000),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CyclePainter extends CustomPainter {
  const _CyclePainter({
    required this.voicesRect,
    required this.impactRect,
    required this.ideasRect,
    required this.strokeColor,
  });

  final Rect voicesRect;
  final Rect impactRect;
  final Rect ideasRect;
  final Color strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final topPath = Path()
      ..moveTo(impactRect.left + impactRect.width * 0.08, impactRect.top - 12)
      ..quadraticBezierTo(
        size.width * 0.52,
        size.height * 0.02,
        voicesRect.right - 10,
        voicesRect.top - 8,
      );
    canvas.drawPath(topPath, paint);
    _drawArrowHead(
      canvas,
      from: Offset(size.width * 0.52, size.height * 0.02),
      tip: Offset(voicesRect.right - 10, voicesRect.top - 8),
      color: strokeColor,
    );

    final leftPath = Path()
      ..moveTo(voicesRect.left + voicesRect.width * 0.24, voicesRect.bottom + 10)
      ..quadraticBezierTo(
        size.width * 0.26,
        size.height * 0.56,
        ideasRect.left - 18,
        ideasRect.center.dy + 18,
      );
    canvas.drawPath(leftPath, paint);
    _drawArrowHead(
      canvas,
      from: Offset(size.width * 0.26, size.height * 0.56),
      tip: Offset(ideasRect.left - 18, ideasRect.center.dy + 18),
      color: strokeColor,
    );

    final rightPath = Path()
      ..moveTo(ideasRect.right + 18, ideasRect.center.dy + 18)
      ..quadraticBezierTo(
        size.width * 0.73,
        size.height * 0.56,
        impactRect.left + impactRect.width * 0.68,
        impactRect.bottom + 10,
      );
    canvas.drawPath(rightPath, paint);
    _drawArrowHead(
      canvas,
      from: Offset(size.width * 0.73, size.height * 0.56),
      tip: Offset(impactRect.left + impactRect.width * 0.68, impactRect.bottom + 10),
      color: strokeColor,
    );
  }

  void _drawArrowHead(
    Canvas canvas, {
    required Offset from,
    required Offset tip,
    required Color color,
  }) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final angle = (tip - from).direction;
    const headLength = 18.0;
    final path = Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(
        tip.dx - headLength * cos(angle - 0.55),
        tip.dy - headLength * sin(angle - 0.55),
      )
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(
        tip.dx - headLength * cos(angle + 0.55),
        tip.dy - headLength * sin(angle + 0.55),
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CyclePainter oldDelegate) {
    return voicesRect != oldDelegate.voicesRect ||
        impactRect != oldDelegate.impactRect ||
        ideasRect != oldDelegate.ideasRect ||
        strokeColor != oldDelegate.strokeColor;
  }
}

class _WhatIsYuvifySection extends StatelessWidget {
  const _WhatIsYuvifySection({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final stacked = isMobile;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 22 : 34,
        vertical: isMobile ? 28 : 34,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFE9DFC8),
            Color(0xFFF7F1E0),
            Color(0xFFE6EEDC),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: stacked
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What is\nYuvify?',
                  style: GoogleFonts.kalnia(
                    fontSize: 48,
                    height: 0.95,
                    fontWeight: FontWeight.w500,
                    color: MainPage._green,
                  ),
                ),
                const SizedBox(height: 28),
                const _WhatIsCopy(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      'What is\nYuvify?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kalnia(
                        fontSize: isTablet ? 64 : 78,
                        height: 0.93,
                        fontWeight: FontWeight.w500,
                        color: MainPage._green,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                const Expanded(
                  flex: 6,
                  child: _WhatIsCopy(),
                ),
              ],
            ),
    );
  }
}

class _WhatIsCopy extends StatelessWidget {
  const _WhatIsCopy();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LandingParagraph(
          text:
              'Right from its ideation, Yuvify aims to be a youth-driven platform to give voices a place to express their ideas and create an impact with meaningful content.',
          fontSize: isMobile ? 20 : 28,
        ),
        SizedBox(height: isMobile ? 22 : 30),
        _LandingParagraph(
          text:
              'We aim to bring together ideas, perspectives and individuals to create impactful conversations through podcasts, content creation and curated events which actually mean something.',
          fontSize: isMobile ? 20 : 28,
        ),
        SizedBox(height: isMobile ? 22 : 30),
        _LandingParagraph(
          text:
              'Our mission is simple: to shape a generation that is aware, expressive and empowered to contribute to positive change through their innovations and ideas.',
          fontSize: isMobile ? 20 : 28,
        ),
        SizedBox(height: isMobile ? 22 : 30),
        Text(
          "Yuvify isn’t just a platform. It’s a launchpad for the next generation.",
          style: GoogleFonts.inriaSans(
            fontSize: isMobile ? 22 : 30,
            height: 1.18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1E1E1E),
          ),
        ),
      ],
    );
  }
}

class _LandingParagraph extends StatelessWidget {
  const _LandingParagraph({
    required this.text,
    required this.fontSize,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inriaSans(
        fontSize: fontSize,
        height: 1.22,
        color: const Color(0xFF1E1E1E),
      ),
    );
  }
}
