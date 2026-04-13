import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuvify_website/components/footer.dart';
import 'package:yuvify_website/components/header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const Color _background = Color(0xFFFEFFEF);
  static const Color _green = Color(0xFF275A47);
  static const Color _peach = Color(0x80EFD2B0);

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
                isMobile ? 18 : 48,
                isMobile ? 28 : 42,
                isMobile ? 18 : 48,
                isMobile ? 80 : 120,
              ),
              child: Column(
                children: [
                  _AboutIntroSection(isMobile: isMobile, isTablet: isTablet),
                  SizedBox(height: isMobile ? 80 : 140),
                  _CoreTeamSection(isMobile: isMobile, isTablet: isTablet),
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

class _AboutIntroSection extends StatelessWidget {
  const _AboutIntroSection({required this.isMobile, required this.isTablet});

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final stacked = isMobile;

    final titleCard = Container(
      constraints: BoxConstraints(
        minHeight: isMobile ? 108 : 116,
        maxWidth: isMobile ? double.infinity : 420,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 28 : 34,
        vertical: isMobile ? 18 : 22,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 28,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Text(
        'About Us',
        textAlign: TextAlign.center,
        style: GoogleFonts.kalnia(
          fontSize: isMobile
              ? 44
              : isTablet
              ? 56
              : 64,
          height: 0.95,
          fontWeight: FontWeight.w500,
          color: AboutPage._green,
        ),
      ),
    );

    final copyBlock = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 760),
      child: DefaultTextStyle(
        style: GoogleFonts.inriaSans(
          fontSize: isMobile ? 20 : 28,
          height: 1.18,
          color: const Color(0xFF1E1E1E),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '''From its very ideation, Yuvify has been envisioned as a youth-driven organisation, grounded in the belief: “For the youth, by the youth.” It is more than a platform—it is a space where voices are not only heard, but truly understood, a space where voices form the shape of ideas to create meaningful content. 

At its core, Yuvify is committed to crafting content that leaves a lasting impact—content that resonates deeply, evoking emotions that feel personal and unspoken through podcasts, content creation and curated events that just actually mean something and does not feel like another awareness page. As one of our founders reflects, “Content should pierce the heart, stirring feelings that only the individual can truly comprehend.”

What sets Yuvify apart is not just its vision, but the spirit behind it. It was built by young minds who refused to remain passive observers—individuals who questioned, created, and chose to turn expression into impact. The founders are not distant figures; they represent a generation that dares to feel deeply, think critically, and act meaningfully. We are someone who understands because we are a part of the youth. In many ways, they are a reflection of every young person who has ever wanted to make a difference but didn’t know where to begin.

Yuvify brings together ideas, perspectives, and individuals to spark conversations that matter. Each initiative is designed not just to engage, but to leave something behind: a thought, a question, a shift. From ideation to execution, every step is driven with intent, creativity, and an unfiltered sense of purpose.

Born from the minds of the youth and shaped by shared experiences, Yuvify stands on a foundation of understanding—because it is created by those who live the realities they speak of.

Our mission is simple: to shape a generation that is aware, expressive, and empowered to contribute to positive change through ideas, innovation, and action.
''',
            ),
            SizedBox(height: isMobile ? 24 : 30),
            Text(
              'Yuvify isn’t just a platform. It’s a launchpad for the next generation.',
              style: GoogleFonts.inriaSans(
                fontSize: isMobile ? 22 : 30,
                height: 1.18,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1E1E1E),
              ),
            ),
          ],
        ),
      ),
    );

    if (stacked) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: titleCard),
          const SizedBox(height: 30),
          copyBlock,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(
            height: isTablet ? 520 : 560,
            child: Center(
              child: titleCard,
            ),
          ),
        ),
        const SizedBox(width: 36),
        Expanded(
          flex: 7,
          child: Padding(
            padding: EdgeInsets.only(top: isTablet ? 12 : 18),
            child: copyBlock,
          ),
        ),
      ],
    );
  }
}

class _CoreTeamSection extends StatelessWidget {
  const _CoreTeamSection({required this.isMobile, required this.isTablet});

  final bool isMobile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: isMobile ? 52 : 62),
          padding: EdgeInsets.fromLTRB(
            isMobile ? 18 : 34,
            isMobile ? 92 : 120,
            isMobile ? 18 : 34,
            isMobile ? 180 : 420,
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
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 22 : 46,
            vertical: isMobile ? 16 : 18,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 28,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Text(
            'Meet The Core Team',
            textAlign: TextAlign.center,
            style: GoogleFonts.kalnia(
              fontSize: isMobile
                  ? 38
                  : isTablet
                  ? 52
                  : 60,
              height: 0.96,
              fontWeight: FontWeight.w500,
              color: AboutPage._green,
            ),
          ),
        ),
      ],
    );
  }
}
