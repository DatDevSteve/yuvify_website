import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  static const Color _brandBrown = Color.fromRGBO(134, 110, 83, 1);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  final GlobalKey _aboutSectionKey = GlobalKey();

  Future<void> _scrollToAbout() async {
    final context = _aboutSectionKey.currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final useNarrowLayout = screenWidth < 1280;
    final useCompactHero =
        useNarrowLayout && screenWidth > screenHeight && screenHeight < 500;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 255, 239, 1),
      endDrawer: useNarrowLayout
          ? Drawer(
              backgroundColor: const Color.fromRGBO(254, 255, 239, 1),
              child: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  children: [
                    _MobileNavTile(
                      label: "About",
                      onTap: () {
                        Navigator.of(context).pop();
                        _scrollToAbout();
                      },
                    ),
                    _MobileNavTile(label: "Careers", onTap: () {}),
                    _MobileNavTile(label: "Events", onTap: () {}),
                    _MobileNavTile(label: "Contact Us", onTap: () {}),
                  ],
                ),
              ),
            )
          : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(useNarrowLayout ? 76 : 88),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: useNarrowLayout ? 10 : 24),
          child: Material(
            elevation: 10,
            shadowColor: Colors.black,
            color: const Color.fromARGB(164, 254, 255, 239),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Container(
              height: useNarrowLayout ? 76 : 88,
              padding: EdgeInsets.fromLTRB(
                useNarrowLayout ? 14 : 24,
                useNarrowLayout ? 8 : 8,
                useNarrowLayout ? 12 : 24,
                useNarrowLayout ? 8 : 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      useNarrowLayout ? 8 : 12,
                      0,
                    ),
                    child: Image.asset(
                      'lib/assets/logo_text.png',
                      fit: BoxFit.contain,
                      height: useNarrowLayout ? 46 : 90,
                    ),
                  ),
                  const Spacer(),
                  if (useNarrowLayout)
                    Builder(
                      builder: (context) => IconButton(
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                        icon: const Icon(Icons.menu_rounded),
                        color: const Color.fromRGBO(34, 34, 34, 1),
                        iconSize: 30,
                        splashRadius: 24,
                      ),
                    )
                  else ...[
                    _NavButton(label: "About", onPressed: _scrollToAbout),
                    _NavButton(label: "Careers", onPressed: () {}),
                    _NavButton(label: "Events", onPressed: () {}),
                    _NavButton(
                      label: "Contact Us",
                      fontSize: 26,
                      onPressed: () {},
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: useNarrowLayout ? 12 : 25,
                vertical: useNarrowLayout ? 16 : 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Builder(
                      builder: (context) {
                        final heroText = Text(
                          useNarrowLayout
                              ? "A platform built for the youth,\nby the youth"
                              : "A platform built by the youth,\nfor the youth",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inriaSans(
                            fontWeight: FontWeight.w700,
                            fontSize: useCompactHero
                                ? 22
                                : useNarrowLayout
                                ? 30
                                : 50,
                            height: useCompactHero ? 1.1 : 1.15,
                            color: const Color.fromRGBO(5, 61, 50, 1),
                          ),
                        );

                        final heroImage = ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: useCompactHero
                                ? screenWidth * 0.46
                                : useNarrowLayout
                                ? screenWidth - 24
                                : double.infinity,
                            maxHeight: useCompactHero ? 200 : double.infinity,
                          ),
                          child: Image.asset(
                            'lib/assets/mind_map.png',
                            fit: BoxFit.contain,
                            width: useNarrowLayout ? screenWidth - 24 : null,
                          ),
                        );

                        if (useCompactHero) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 18),
                                  child: heroText,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: heroImage,
                                ),
                              ),
                            ],
                          );
                        }

                        return Flex(
                          direction: useNarrowLayout
                              ? Axis.vertical
                              : Axis.horizontal,
                          crossAxisAlignment: useNarrowLayout
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!useNarrowLayout) heroText,
                            if (!useNarrowLayout) const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: useNarrowLayout ? 22 : 0,
                              ),
                              child: heroImage,
                            ),
                            if (useNarrowLayout) heroText,
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: useNarrowLayout ? (useCompactHero ? 72 : 120) : 300,
                  ),
                  KeyedSubtree(
                    key: _aboutSectionKey,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isCompact = constraints.maxWidth < 1100;
                        final aboutTextWidth = isCompact
                            ? double.infinity
                            : (constraints.maxWidth * 0.66).clamp(560.0, 960.0);

                        final aboutCopy = Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _AboutParagraph(
                              text:
                                  "Right from its ideation, Yuvify aims to be a youth-driven platform to give voices a place to express their ideas and create an impact with meaningful content.",
                              fontSize: useNarrowLayout ? 22 : 32,
                            ),
                            SizedBox(height: useNarrowLayout ? 24 : 28),
                            _AboutParagraph(
                              text:
                                  "We aim to bring together ideas, perspectives and individuals to create impactful conversations through podcasts, content creation and curated events which actually mean something.",
                              fontSize: useNarrowLayout ? 22 : 32,
                            ),
                            SizedBox(height: useNarrowLayout ? 24 : 28),
                            _AboutParagraph(
                              text:
                                  "Our mission is simple: to shape a generation that is aware, expressive and empowered to contribute to positive change through their innovations and ideas.",
                              fontSize: useNarrowLayout ? 22 : 32,
                            ),
                            SizedBox(height: useNarrowLayout ? 24 : 28),
                            Text(
                              "Yuvify isn't just a platform, it's a launchpad for the next generation.",
                              style: GoogleFonts.inriaSans(
                                fontSize: useNarrowLayout ? 24 : 32,
                                height: 1.4,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(34, 34, 34, 1),
                              ),
                            ),
                          ],
                        );

                        final aboutHeading = SizedBox(
                          width: isCompact ? double.infinity : 420,
                          child: Column(
                            crossAxisAlignment: useNarrowLayout
                                ? CrossAxisAlignment.center
                                : isCompact
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              Text(
                                "About Us",
                                style: GoogleFonts.kalnia(
                                  fontSize: useNarrowLayout
                                      ? 48
                                      : isCompact
                                      ? 64
                                      : 85,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(5, 91, 71, 1),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                height: useNarrowLayout ? 5 : 6,
                                width: useNarrowLayout ? 180 : 100,
                                decoration: BoxDecoration(
                                  color: ComingSoon._brandBrown,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                              ),
                            ],
                          ),
                        );

                        if (useNarrowLayout) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              aboutHeading,
                              const SizedBox(height: 34),
                              aboutCopy,
                            ],
                          );
                        }

                        return Flex(
                          direction: isCompact
                              ? Axis.vertical
                              : Axis.horizontal,
                          crossAxisAlignment: isCompact
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: aboutTextWidth, child: aboutCopy),
                            const Spacer(),
                            aboutHeading,
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: useNarrowLayout ? 80 : 200),
                  Image.asset(
                    'lib/assets/plan_notes.png',
                    width: useNarrowLayout ? screenWidth - 24 : null,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: useNarrowLayout ? 120 : 300),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: useNarrowLayout ? 16 : 24,
                      vertical: useNarrowLayout ? 32 : 44,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromRGBO(134, 110, 83, 1),
                          width: 3,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "For Support, Collaborations and Queries,\ndrop us an e-mail at",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inriaSans(
                              fontSize: useNarrowLayout ? 18 : 24,
                              height: 1.3,
                              color: const Color.fromRGBO(34, 34, 34, 1),
                            ),
                          ),
                          SizedBox(height: useNarrowLayout ? 20 : 28),
                          Text(
                            "info@yuvify.in",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inriaSans(
                              fontSize: useNarrowLayout ? 22 : 26,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(5, 91, 71, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutParagraph extends StatelessWidget {
  const _AboutParagraph({required this.text, this.fontSize = 32});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inriaSans(
        fontSize: fontSize,
        height: 1.4,
        color: const Color.fromRGBO(34, 34, 34, 1),
      ),
    );
  }
}

class _MobileNavTile extends StatelessWidget {
  const _MobileNavTile({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: GoogleFonts.kalnia(
          color: ComingSoon._brandBrown,
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.label,
    required this.onPressed,
    this.fontSize = 28,
  });

  final String label;
  final VoidCallback onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          foregroundColor: ComingSoon._brandBrown,
        ),
        child: Text(
          label,
          style: GoogleFonts.kalnia(
            color: ComingSoon._brandBrown,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
