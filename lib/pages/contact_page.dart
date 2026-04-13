import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuvify_website/components/footer.dart';
import 'package:yuvify_website/components/header.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const Color _background = Color(0xFFFEFFEF);
  static const Color _green = Color(0xFF275A47);
  static const Color _brown = Color(0xFF866E53);
  static const Color _card = Color(0xFFF9FAF6);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;
    final isTablet = width >= 900 && width < 1300;

    return Scaffold(
      backgroundColor: _background,
      endDrawer: isMobile ? const YuvifyHeaderDrawer() : null,
      appBar: YuvifyHeader(isCompact: isMobile),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                isMobile ? 20 : 100,
                isMobile ? 32 : 92,
                isMobile ? 20 : 75,
                isMobile ? 80 : 120,
              ),
              child: _ContactContent(
                isMobile: isMobile,
                isTablet: isTablet,
              ),
            ),
            const YuvifyFooter(),
          ],
        ),
      ),
    );
  }
}

class _ContactContent extends StatelessWidget {
  const _ContactContent({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final leftSide = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 678),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: GoogleFonts.kalnia(
              fontSize: isMobile
                  ? 52
                  : isTablet
                  ? 82
                  : 113,
              height: 1.08,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.03 * (isMobile ? 52 : isTablet ? 82 : 113),
              color: ContactPage._green,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 28),
          Text(
            'Get in touch for collaborations, support and media queries',
            style: GoogleFonts.inriaSans(
              fontSize: isMobile
                  ? 24
                  : isTablet
                  ? 30
                  : 35,
              height: 1.2,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.03 * (isMobile ? 24 : isTablet ? 30 : 35),
              color: ContactPage._green,
            ),
          ),
          SizedBox(height: isMobile ? 18 : 28),
          Text(
            'We are currently open to Brand and Event Partnerships along with Community Collaborations',
            style: GoogleFonts.inriaSans(
              fontSize: isMobile
                  ? 20
                  : isTablet
                  ? 24
                  : 29,
              height: 1.2,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.03 * (isMobile ? 20 : isTablet ? 24 : 29),
              color: ContactPage._brown,
            ),
          ),
        ],
      ),
    );

    final rightSide = _ContactCardsColumn(
      isMobile: isMobile,
      isTablet: isTablet,
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftSide,
          const SizedBox(height: 40),
          rightSide,
        ],
      );
    }

    return SizedBox(
      height: isTablet ? 620 : 660,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isTablet ? 11 : 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: leftSide,
            ),
          ),
          SizedBox(width: isTablet ? 28 : 56),
          Expanded(flex: 12, child: rightSide),
        ],
      ),
    );
  }
}

class _ContactCardsColumn extends StatelessWidget {
  const _ContactCardsColumn({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        children: const [
          _ContactCard(
            icon: Icons.mail_outline_rounded,
            label: 'info@yuvify.in',
          ),
          SizedBox(height: 22),
          _ContactCard(
            icon: Icons.call_outlined,
            label: 'Coming Soon',
          ),
          SizedBox(height: 22),
          _ContactCard(
            icon: Icons.add_location_alt_outlined,
            label: 'Coming Soon',
          ),
        ],
      );
    }

    return SizedBox(
      height: isTablet ? 620 : 660,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: _ContactCard(
              width: isTablet ? 380 : 522,
              height: isTablet ? 142 : 166,
              iconSize: isTablet ? 72 : 82,
              iconBoxSize: isTablet ? 78 : 101,
              label: 'info@yuvify.in',
              icon: Icons.mail_outline_rounded,
              textWidth: isTablet ? 230 : 382,
              textSize: isTablet ? 28 : 35,
            ),
          ),
          Positioned(
            right: 0,
            top: isTablet ? 190 : 247,
            child: _ContactCard(
              width: isTablet ? 380 : 522,
              height: isTablet ? 142 : 166,
              iconSize: isTablet ? 60 : 82,
              iconBoxSize: isTablet ? 72 : 82,
              label: 'Coming Soon',
              icon: Icons.call_outlined,
              textWidth: isTablet ? 230 : 382,
              textSize: isTablet ? 28 : 35,
            ),
          ),
          Positioned(
            left: 0,
            top: isTablet ? 380 : 494,
            child: _ContactCard(
              width: isTablet ? 380 : 522,
              height: isTablet ? 142 : 166,
              iconSize: isTablet ? 60 : 82,
              iconBoxSize: isTablet ? 72 : 82,
              label: 'Coming Soon',
              icon: Icons.add_location_alt_outlined,
              textWidth: isTablet ? 230 : 382,
              textSize: isTablet ? 28 : 35,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.icon,
    required this.label,
    this.width = double.infinity,
    this.height = 166,
    this.iconSize = 82,
    this.iconBoxSize = 101,
    this.textWidth = 382,
    this.textSize = 35,
  });

  final IconData icon;
  final String label;
  final double width;
  final double height;
  final double iconSize;
  final double iconBoxSize;
  final double textWidth;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    final isFullWidth = width == double.infinity;

    return Container(
      width: isFullWidth ? null : width,
      constraints: isFullWidth
          ? const BoxConstraints(minHeight: 166)
          : BoxConstraints.tightFor(width: width, height: height),
      padding: EdgeInsets.symmetric(
        horizontal: width == double.infinity ? 24 : 27,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: ContactPage._card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 35.2,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: iconBoxSize,
            height: iconBoxSize,
            child: Center(
              child: Icon(
                icon,
                size: iconSize,
                color: ContactPage._green,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: textWidth),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: GoogleFonts.inriaSans(
                  fontSize: textSize,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.03 * textSize,
                  color: ContactPage._green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
