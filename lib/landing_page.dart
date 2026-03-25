import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  static const Color _brandBrown = Color.fromRGBO(134, 110, 83, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 255, 239, 1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(122),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Material(
            elevation: 10,
            shadowColor: Colors.black,
            color: const Color.fromARGB(164, 254, 255, 239),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Container(
              height: 108,
              padding: const EdgeInsets.fromLTRB(28, 10, 28, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: Image.asset(
                      'lib/assets/logo_transparent.png',
                      fit: BoxFit.contain,
                      height: 120,
                    ),
                  ),
                  Text(
                    "YUVIFY",
                    style: GoogleFonts.kalnia(
                      color: _brandBrown,
                      fontSize: 65,
                      letterSpacing: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  _NavButton(label: "About", onPressed: () {}),
                  _NavButton(label: "Careers", onPressed: () {}),
                  _NavButton(label: "Events", onPressed: () {}),
                  _NavButton(
                    label: "Contact Us",
                    fontSize: 26,
                    onPressed: () {},
                  ),
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 980),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'lib/assets/mind_map.png',
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "A platform built by the youth, for the youth",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inriaSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: const Color.fromRGBO(5, 61, 50, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 300),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isCompact = constraints.maxWidth < 1100;

                      return Flex(
                        direction: isCompact ? Axis.vertical : Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: isCompact ? 0 : 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _AboutParagraph(
                                  text:
                                      "Right from its ideation, Yuvify aims to be a youth-driven platform to give voices a place to express their ideas and create an impact with meaningful content.",
                                ),
                                const SizedBox(height: 28),
                                _AboutParagraph(
                                  text:
                                      "We aim to bring together ideas, perspectives and individuals to create impactful conversations through podcasts, content creation and curated events which actually mean something.",
                                ),
                                const SizedBox(height: 28),
                                _AboutParagraph(
                                  text:
                                      "Our mission is simple: to shape a generation that is aware, expressive and empowered to contribute to positive change through their innovations and ideas.",
                                ),
                                const SizedBox(height: 28),
                                Text(
                                  "Yuvify isn't just a platform, it's a launchpad for the next generation.",
                                  style: GoogleFonts.inriaSans(
                                    fontSize: 32,
                                    height: 1.4,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(34, 34, 34, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: isCompact ? 0 : 72,
                            height: isCompact ? 40 : 0,
                          ),
                          SizedBox(
                            width: isCompact ? double.infinity : 360,
                            child: Column(
                              crossAxisAlignment: isCompact
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "About Us",
                                  style: GoogleFonts.kalnia(
                                    fontSize: 64,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(5, 91, 71, 1),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  height: 6,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: _brandBrown,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 200),
                  Image.asset('lib/assets/plan_notes.png'),
                  const SizedBox(height: 300),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 44,
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
                              fontSize: 24,
                              height: 1.3,
                              color: const Color.fromRGBO(34, 34, 34, 1),
                            ),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            "info@yuvify.in",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inriaSans(
                              fontSize: 26,
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
  const _AboutParagraph({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inriaSans(
        fontSize: 32,
        height: 1.4,
        color: const Color.fromRGBO(34, 34, 34, 1),
      ),
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
