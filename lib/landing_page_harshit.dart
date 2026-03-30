import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  static const Color background = Color(0xFFFEFFEF);
  static const Color green = Color(0xFF275A47);
  static const Color brown = Color(0xFF866E53);
  static const Color peach = Color(0x80EFD2B0);
  static const Color ink = Color(0xFF1E1E1E);
  static const Color accentRed = Colors.red;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final GlobalKey _aboutSectionKey = GlobalKey();
  final GlobalKey _formatsSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  Future<void> _scrollToSection(GlobalKey key, {double alignment = 0.06}) async {
    final targetContext = key.currentContext;
    if (targetContext == null) return;

    await Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: alignment,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 768;
    final isTablet = width >= 768 && width < 1180;
    final useDrawer = width < 1050;

    return Scaffold(
      backgroundColor: TestPage.background,
      endDrawer: useDrawer
          ? Drawer(
              backgroundColor: TestPage.background,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DrawerNavTile(
                        label: 'About',
                        onTap: () {
                          Navigator.of(context).pop();
                          _scrollToSection(_aboutSectionKey);
                        },
                      ),
                      const _DrawerNavTile(label: 'Careers'),
                      _DrawerNavTile(
                        label: 'Events',
                        onTap: () {
                          Navigator.of(context).pop();
                          _scrollToSection(_formatsSectionKey);
                        },
                      ),
                      _DrawerNavTile(
                        label: 'Contact Us',
                        onTap: () {
                          Navigator.of(context).pop();
                          _scrollToSection(_contactSectionKey, alignment: 0.1);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _LandingHeader(
                useDrawer: useDrawer,
                isMobile: isMobile,
                onAboutTap: () => _scrollToSection(_aboutSectionKey),
                onEventsTap: () => _scrollToSection(_formatsSectionKey),
                onContactTap: () => _scrollToSection(_contactSectionKey),
              ),
              _ContentFrame(
                child: _HeroSection(isMobile: isMobile, isTablet: isTablet),
              ),
              KeyedSubtree(
                key: _aboutSectionKey,
                child: _AboutSection(isMobile: isMobile, isTablet: isTablet),
              ),
              KeyedSubtree(
                key: _formatsSectionKey,
                child: _ProgramsSection(isMobile: isMobile, isTablet: isTablet),
              ),
              KeyedSubtree(
                key: _contactSectionKey,
                child: _FooterSection(isMobile: isMobile, isTablet: isTablet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LandingHeader extends StatelessWidget {
  const _LandingHeader({
    required this.useDrawer,
    required this.isMobile,
    required this.onAboutTap,
    required this.onEventsTap,
    required this.onContactTap,
  });

  final bool useDrawer;
  final bool isMobile;
  final VoidCallback onAboutTap;
  final VoidCallback onEventsTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        useDrawer ? 8 : 32,
        0,
        useDrawer ? 8 : 32,
        useDrawer ? 12 : 18,
      ),
      child: Material(
        color: TestPage.background,
        elevation: 5,
        shadowColor: Colors.black26,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: useDrawer ? 72 : 116),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: useDrawer ? 14 : 28,
              vertical: useDrawer ? 10 : 4,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'lib/assets/logo_text.png',
                      fit: BoxFit.contain,
                      height: useDrawer ? 44 : 78,
                    ),
                  ),
                ),
                if (useDrawer)
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: const Icon(Icons.menu_rounded),
                      color: TestPage.ink,
                      iconSize: 30,
                    ),
                  )
                else
                  Wrap(
                    spacing: isMobile ? 12 : 20,
                    children: [
                      _HeaderButton(label: 'About', onTap: onAboutTap),
                      const _HeaderButton(label: 'Careers'),
                      _HeaderButton(label: 'Events', onTap: onEventsTap),
                      _HeaderButton(label: 'Contact Us', onTap: onContactTap),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final stacked = isMobile || isTablet;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 18 : 0,
        isMobile ? 4 : 10,
        isMobile ? 18 : 0,
        isMobile ? 32 : 48,
      ),
      child: Column(
        children: [
          Text(
            'INSERT SOMETHING HERE',
            textAlign: TextAlign.center,
            style: GoogleFonts.kalnia(
              fontSize: isMobile ? 34 : isTablet ? 56 : 76,
              height: 0.95,
              fontWeight: FontWeight.w600,
              letterSpacing: isMobile ? 0.8 : 2.4,
              color: TestPage.accentRed,
            ),
          ),
          SizedBox(height: isMobile ? 30 : isTablet ? 40 : 56),
          Flex(
            direction: stacked ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: stacked
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (stacked)
                _HeroIntroText(isMobile: isMobile, isTablet: isTablet)
              else
                const Expanded(
                  flex: 8,
                  child: _HeroIntroText(isMobile: false, isTablet: false),
                ),
              SizedBox(
                width: stacked ? 0 : 34,
                height: stacked ? 28 : 0,
              ),
              if (stacked)
                const Center(child: _HeroGraphic(isMobile: true, isTablet: true))
              else
                const Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: _HeroGraphic(isMobile: false, isTablet: false),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroIntroText extends StatelessWidget {
  const _HeroIntroText({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: isMobile
            ? double.infinity
            : isTablet
            ? 680
            : 764,
        minHeight: isMobile ? 0 : 220,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'A platform built for the youth, by the youth',
          style: GoogleFonts.inriaSans(
            fontSize: isMobile ? 24 : isTablet ? 32 : 40,
            height: 1.15,
            color: TestPage.green,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _HeroGraphic extends StatelessWidget {
  const _HeroGraphic({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: isMobile ? 330 : isTablet ? 420 : 520,
      ),
      child: Image.asset(
        'lib/assets/mind_map.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final stacked = isMobile || isTablet;

    return Container(
      width: double.infinity,
      color: TestPage.peach,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 18 : isTablet ? 32 : 80,
        vertical: isMobile ? 30 : isTablet ? 46 : 74,
      ),
      child: _ContentFrame(
        child: Flex(
          direction: stacked ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: stacked
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: stacked ? double.infinity : 540,
              child: Column(
                crossAxisAlignment: stacked
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Text(
                    'About Us',
                    textAlign: stacked ? TextAlign.left : TextAlign.center,
                    style: GoogleFonts.kalnia(
                      fontSize: isMobile ? 46 : isTablet ? 68 : 72,
                      height: 0.96,
                      letterSpacing: isMobile ? 0.4 : 1.4,
                      fontWeight: FontWeight.w600,
                      color: TestPage.green,
                    ),
                  ),
                  SizedBox(height: isMobile ? 8 : 12),
                  SizedBox(
                    width: isMobile ? 240 : 300,
                    height: 16,
                    child: CustomPaint(painter: _ScribblePainter()),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: stacked ? 0 : 54,
              height: stacked ? 28 : 0,
            ),
            if (stacked)
              const _AboutCopy(isMobile: true, isTablet: true)
            else
              const Expanded(child: _AboutCopy(isMobile: false, isTablet: false)),
          ],
        ),
      ),
    );
  }
}

class _AboutCopy extends StatelessWidget {
  const _AboutCopy({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final fontSize = isMobile
        ? 17.0
        : isTablet
        ? 21.0
        : 24.0;

    return DefaultTextStyle(
      style: GoogleFonts.inriaSans(
        fontSize: fontSize,
        height: 1.32,
        color: TestPage.ink,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Right from its ideation , Yuvify aims to be a youth-driven platform to give voices a place  to express their ideas and create an impact with meaningful content.',
          ),
          SizedBox(height: 18),
          Text(
            'We aim to bring together ideas, perspectives and individuals to create impactful conversations through podcasts, content creation and curated events which actually mean something.',
          ),
          SizedBox(height: 18),
          Text(
            'Our mission is simple— To shape a generation that is aware, expressive and empowered to contribute to a positive change through their innovations and ideas.',
          ),
          SizedBox(height: 18),
          Text(
            'Yuvify isn’t just a platform—it’s a launchpad for the next generation.',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _ProgramsSection extends StatelessWidget {
  const _ProgramsSection({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final stacked = isMobile || isTablet;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 18 : 32,
        isMobile ? 26 : 30,
        isMobile ? 18 : 44,
        isMobile ? 26 : 28,
      ),
      child: _ContentFrame(
        child: Flex(
          direction: stacked ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (stacked)
              const _PinBoardImage(isMobile: true, isTablet: true)
            else
              const Expanded(
                flex: 8,
                child: _PinBoardImage(isMobile: false, isTablet: false),
              ),
            SizedBox(
              width: stacked ? 0 : 44,
              height: stacked ? 28 : 0,
            ),
            SizedBox(
              width: stacked ? double.infinity : 505,
              child: Text(
                'insert\ntext here',
                textAlign: TextAlign.center,
                style: GoogleFonts.kalnia(
                  fontSize: isMobile ? 34 : isTablet ? 54 : 72,
                  height: 0.95,
                  letterSpacing: isMobile ? 0.8 : 2,
                  fontWeight: FontWeight.w600,
                  color: TestPage.accentRed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PinBoardImage extends StatelessWidget {
  const _PinBoardImage({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: isMobile
            ? double.infinity
            : isTablet
            ? 780
            : 1000,
      ),
      child: Image.asset(
        'lib/assets/plan_notes.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: TestPage.peach,
      padding: EdgeInsets.fromLTRB(
        0,
        isMobile ? 10 : 0,
        0,
        isMobile ? 12 : 14,
      ),
      child: _ContentFrame(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 4,
              color: TestPage.brown,
            ),
            SizedBox(height: isMobile ? 14 : 16),
            Text(
              'For Support, Collaborations and Queries,\ndrop us an e-mail at',
              textAlign: TextAlign.center,
              style: GoogleFonts.inriaSans(
                fontSize: isMobile
                    ? 16
                    : isTablet
                    ? 20
                    : 24,
                height: 1.28,
                color: TestPage.ink,
              ),
            ),
            SizedBox(height: isMobile ? 10 : 12),
            Text(
              'info@yuvify.in',
              textAlign: TextAlign.center,
              style: GoogleFonts.inriaSans(
                fontSize: isMobile
                    ? 22
                    : isTablet
                    ? 26
                    : 32,
                fontWeight: FontWeight.w700,
                color: TestPage.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentFrame extends StatelessWidget {
  const _ContentFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1440),
        child: child,
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: TestPage.ink,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        style: GoogleFonts.kalnia(
          fontSize: 24,
          height: 1.0,
          fontWeight: FontWeight.w400,
          color: TestPage.ink,
        ),
      ),
    );
  }
}

class _DrawerNavTile extends StatelessWidget {
  const _DrawerNavTile({
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      title: Text(
        label,
        style: GoogleFonts.kalnia(
          fontSize: 28,
          color: TestPage.green,
        ),
      ),
    );
  }
}

class _ScribblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = TestPage.brown
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()..moveTo(0, size.height * 0.58);
    final segmentWidth = size.width / 12;

    for (int index = 0; index < 12; index++) {
      final dx = segmentWidth * (index + 1);
      final controlY = index.isEven ? size.height * 0.32 : size.height * 0.88;
      path.quadraticBezierTo(
        dx - (segmentWidth / 2),
        controlY,
        dx,
        size.height * 0.58,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
