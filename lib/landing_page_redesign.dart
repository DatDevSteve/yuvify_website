import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  static const Color background = Color(0xFFFEFFEF);
  static const Color green = Color(0xFF275A47);
  static const Color brown = Color(0xFF866E53);
  static const Color peach = Color(0x80EFD2B0);
  static const Color ink = Color(0xFF1E1E1E);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final GlobalKey _aboutSectionKey = GlobalKey();
  final GlobalKey _formatsSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  Future<void> _scrollToSection(GlobalKey key) async {
    final sectionContext = key.currentContext;
    if (sectionContext == null) return;

    await Scrollable.ensureVisible(
      sectionContext,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 760;
    final isTablet = width >= 760 && width < 1180;

    return Scaffold(
      backgroundColor: TestPage.background,
      endDrawer: isTablet || isMobile
          ? Drawer(
              backgroundColor: TestPage.background,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 28,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _RedesignDrawerNavTile(
                        label: 'About',
                        onTap: () {
                          Navigator.of(context).pop();
                          _scrollToSection(_aboutSectionKey);
                        },
                      ),
                      _RedesignDrawerNavTile(label: 'Careers', onTap: () {}),
                      _RedesignDrawerNavTile(
                        label: 'Events',
                        onTap: () {
                          Navigator.of(context).pop();
                          _scrollToSection(_formatsSectionKey);
                        },
                      ),
                      _RedesignDrawerNavTile(
                        label: 'Contact Us',
                        onTap: () {
                          Navigator.of(context).pop();
                          _scrollToSection(_contactSectionKey);
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
              _RedesignHeader(
                isCompact: isTablet || isMobile,
                onAboutTap: () => _scrollToSection(_aboutSectionKey),
                onEventsTap: () => _scrollToSection(_formatsSectionKey),
                onContactTap: () => _scrollToSection(_contactSectionKey),
              ),
              _RedesignHeroSection(isMobile: isMobile, isTablet: isTablet),
              KeyedSubtree(
                key: _aboutSectionKey,
                child: _RedesignAboutSection(
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
              ),
              KeyedSubtree(
                key: _formatsSectionKey,
                child: _RedesignFormatsSection(
                  isMobile: isMobile,
                  isTablet: isTablet,
                ),
              ),
              KeyedSubtree(
                key: _contactSectionKey,
                child: _RedesignFooterSection(isMobile: isMobile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RedesignHeader extends StatelessWidget {
  const _RedesignHeader({
    required this.isCompact,
    required this.onAboutTap,
    required this.onEventsTap,
    required this.onContactTap,
  });

  final bool isCompact;
  final VoidCallback onAboutTap;
  final VoidCallback onEventsTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isCompact ? 12 : 32,
        0,
        isCompact ? 12 : 32,
        isCompact ? 12 : 20,
      ),
      child: Material(
        elevation: 7,
        shadowColor: Colors.black26,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: TestPage.background,
        child: Container(
          height: isCompact ? 84 : 116,
          padding: EdgeInsets.symmetric(horizontal: isCompact ? 16 : 28),
          child: Row(
            children: [
              Flexible(
                child: Image.asset(
                  'lib/assets/logo_text.png',
                  fit: BoxFit.contain,
                  height: isCompact ? 42 : 62,
                ),
              ),
              const Spacer(),
              if (isCompact)
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
                  spacing: 18,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _RedesignHeaderButton(label: 'About', onTap: onAboutTap),
                    const _RedesignHeaderButton(label: 'Careers'),
                    _RedesignHeaderButton(label: 'Events', onTap: onEventsTap),
                    _RedesignHeaderButton(
                      label: 'Contact Us',
                      onTap: onContactTap,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RedesignHeroSection extends StatelessWidget {
  const _RedesignHeroSection({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final bool stacked = isMobile || isTablet;
    final heroCopy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A platform built for the youth, by the youth',
          style: GoogleFonts.inriaSans(
            fontSize: isMobile ? 28 : isTablet ? 36 : 40,
            height: 1.15,
            color: TestPage.green,
          ),
        ),
        SizedBox(height: isMobile ? 20 : 28),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: stacked ? 560 : 680),
          child: Text(
            'Yuvify brings together curious voices, bold ideas and meaningful action through content, conversations and youth-led experiences.',
            style: GoogleFonts.inriaSans(
              fontSize: isMobile ? 18 : 22,
              height: 1.45,
              color: TestPage.ink,
            ),
          ),
        ),
      ],
    );
    final heroGraphic = Align(
      alignment: stacked ? Alignment.center : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? 320 : isTablet ? 420 : 520,
        ),
        child: Image.asset(
          'lib/assets/mind_map.png',
          fit: BoxFit.contain,
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 20 : 46,
        isMobile ? 18 : 10,
        isMobile ? 20 : 46,
        isMobile ? 28 : 40,
      ),
      child: Column(
        children: [
          Text(
            'Voices That Turn Ideas Into Impact',
            textAlign: TextAlign.center,
            style: GoogleFonts.kalnia(
              fontSize: isMobile ? 38 : isTablet ? 54 : 76,
              height: 0.98,
              fontWeight: FontWeight.w600,
              color: TestPage.green,
              letterSpacing: isMobile ? 0.4 : 1.1,
            ),
          ),
          SizedBox(height: isMobile ? 28 : 44),
          Flex(
            direction: stacked ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: stacked
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (stacked) heroCopy else Expanded(flex: 6, child: heroCopy),
              SizedBox(width: stacked ? 0 : 24, height: stacked ? 28 : 0),
              if (stacked)
                heroGraphic
              else
                Expanded(flex: 5, child: heroGraphic),
            ],
          ),
        ],
      ),
    );
  }
}

class _RedesignAboutSection extends StatelessWidget {
  const _RedesignAboutSection({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final bool stacked = isMobile || isTablet;
    final headingBlock = SizedBox(
      width: stacked ? double.infinity : 360,
      child: Column(
        crossAxisAlignment: stacked
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Text(
            'About Us',
            textAlign: stacked ? TextAlign.left : TextAlign.center,
            style: GoogleFonts.kalnia(
              fontSize: isMobile ? 44 : isTablet ? 62 : 72,
              height: 0.98,
              fontWeight: FontWeight.w600,
              color: TestPage.green,
            ),
          ),
          const SizedBox(height: 10),
          const _RedesignScribbleDivider(),
        ],
      ),
    );
    final aboutCopy = DefaultTextStyle(
      style: GoogleFonts.inriaSans(
        fontSize: isMobile ? 19 : 24,
        height: 1.45,
        color: TestPage.ink,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Right from its ideation, Yuvify aims to be a youth-driven platform to give voices a place to express their ideas and create an impact with meaningful content.',
          ),
          SizedBox(height: 18),
          Text(
            'We aim to bring together ideas, perspectives and individuals to create impactful conversations through podcasts, content creation and curated events which actually mean something.',
          ),
          SizedBox(height: 18),
          Text(
            'Our mission is simple: to shape a generation that is aware, expressive and empowered to contribute to positive change through their innovations and ideas.',
          ),
          SizedBox(height: 18),
          Text(
            'Yuvify isn’t just a platform. It’s a launchpad for the next generation.',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );

    return Container(
      width: double.infinity,
      color: TestPage.peach,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : isTablet ? 32 : 80,
        vertical: isMobile ? 34 : 58,
      ),
      child: Flex(
        direction: stacked ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: stacked
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          headingBlock,
          SizedBox(width: stacked ? 0 : 48, height: stacked ? 28 : 0),
          if (stacked) aboutCopy else Expanded(child: aboutCopy),
        ],
      ),
    );
  }
}

class _RedesignFormatsSection extends StatelessWidget {
  const _RedesignFormatsSection({
    required this.isMobile,
    required this.isTablet,
  });

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final bool stacked = isMobile || isTablet;
    final board = Container(
      constraints: BoxConstraints(maxWidth: stacked ? 760 : 1000),
      child: Image.asset(
        'lib/assets/plan_notes.png',
        fit: BoxFit.contain,
      ),
    );
    final formatsCopy = Column(
      crossAxisAlignment: stacked
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Stories, podcasts and events that keep youth culture thoughtful, expressive and in motion.',
          textAlign: stacked ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.kalnia(
            fontSize: isMobile ? 28 : isTablet ? 40 : 52,
            height: 1.02,
            fontWeight: FontWeight.w600,
            color: TestPage.green,
          ),
        ),
        SizedBox(height: isMobile ? 18 : 24),
        Text(
          'From short-form content to curated conversations, every format is designed to help young people share perspectives, discover ideas and create real-world resonance.',
          textAlign: stacked ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.inriaSans(
            fontSize: isMobile ? 18 : 22,
            height: 1.5,
            color: TestPage.ink,
          ),
        ),
      ],
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        isMobile ? 20 : 32,
        isMobile ? 28 : 34,
        isMobile ? 20 : 40,
        isMobile ? 34 : 30,
      ),
      child: Flex(
        direction: stacked ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (stacked) board else Expanded(flex: 7, child: board),
          SizedBox(width: stacked ? 0 : 36, height: stacked ? 26 : 0),
          if (stacked)
            formatsCopy
          else
            Expanded(flex: 4, child: formatsCopy),
        ],
      ),
    );
  }
}

class _RedesignFooterSection extends StatelessWidget {
  const _RedesignFooterSection({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: TestPage.peach,
      padding: EdgeInsets.fromLTRB(20, isMobile ? 22 : 28, 20, 18),
      child: Column(
        children: [
          Container(
            height: 3,
            width: double.infinity,
            color: TestPage.brown,
          ),
          SizedBox(height: isMobile ? 18 : 16),
          Text(
            'For Support, Collaborations and Queries,\ndrop us an e-mail at',
            textAlign: TextAlign.center,
            style: GoogleFonts.inriaSans(
              fontSize: isMobile ? 18 : 24,
              height: 1.35,
              color: TestPage.ink,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'info@yuvify.in',
            textAlign: TextAlign.center,
            style: GoogleFonts.inriaSans(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.w700,
              color: TestPage.green,
            ),
          ),
        ],
      ),
    );
  }
}

class _RedesignHeaderButton extends StatelessWidget {
  const _RedesignHeaderButton({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap ?? () {},
      style: TextButton.styleFrom(
        foregroundColor: TestPage.ink,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
      child: Text(
        label,
        style: GoogleFonts.kalnia(
          fontSize: 24,
          color: TestPage.ink,
        ),
      ),
    );
  }
}

class _RedesignDrawerNavTile extends StatelessWidget {
  const _RedesignDrawerNavTile({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          label,
          style: GoogleFonts.kalnia(
            fontSize: 28,
            color: TestPage.green,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class _RedesignScribbleDivider extends StatelessWidget {
  const _RedesignScribbleDivider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 18,
      child: CustomPaint(
        painter: _RedesignScribblePainter(),
      ),
    );
  }
}

class _RedesignScribblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = TestPage.brown
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()..moveTo(0, size.height * 0.65);
    final segmentWidth = size.width / 12;

    for (int i = 0; i < 12; i++) {
      final dx = segmentWidth * (i + 1);
      final dy = i.isEven ? size.height * 0.45 : size.height * 0.82;
      path.quadraticBezierTo(
        dx - (segmentWidth / 2),
        dy,
        dx,
        size.height * 0.65,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
