import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuvify_website/components/footer.dart';
import 'package:yuvify_website/components/header.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      endDrawer: useNarrowLayout ? const YuvifyHeaderDrawer() : null,
      appBar: YuvifyHeader(isCompact: useNarrowLayout),
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
                  LayoutBuilder(
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
                                color: const Color.fromRGBO(134, 110, 83, 1),
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
                        direction: isCompact ? Axis.vertical : Axis.horizontal,
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
                  SizedBox(height: useNarrowLayout ? 80 : 200),
                  Image.asset(
                    'lib/assets/plan_notes.png',
                    width: useNarrowLayout ? screenWidth - 24 : null,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: useNarrowLayout ? 80 : 140),
                ],
              ),
            ),
            YuvifyFooter(),
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
