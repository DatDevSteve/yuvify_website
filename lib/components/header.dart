import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuvify_website/pages/about_page.dart';
import 'package:yuvify_website/pages/career_page.dart';
import 'package:yuvify_website/pages/event_page.dart';

class YuvifyHeader extends StatelessWidget implements PreferredSizeWidget {
  const YuvifyHeader({
    super.key,
    required this.isCompact,
  });

  final bool isCompact;

  @override
  Size get preferredSize => Size.fromHeight(isCompact ? 76 : 88);

  void _openAbout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const AboutPage(),
      ),
    );
  }

  void _openCareers(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const CareersPage(),
      ),
    );
  }

  void _openEvents(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const EventsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isCompact ? 10 : 24),
      child: Material(
        elevation: 10,
        shadowColor: Colors.black,
        color: const Color.fromARGB(164, 254, 255, 239),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Container(
          height: isCompact ? 76 : 88,
          padding: EdgeInsets.fromLTRB(
            isCompact ? 14 : 24,
            8,
            isCompact ? 12 : 24,
            8,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: isCompact ? 8 : 12),
                child: Image.asset(
                  'lib/assets/logo_text.png',
                  fit: BoxFit.contain,
                  height: isCompact ? 46 : 90,
                ),
              ),
              const Spacer(),
              if (isCompact)
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
                _HeaderButton(
                  label: 'About',
                  onPressed: () => _openAbout(context),
                ),
                _HeaderButton(
                  label: 'Careers',
                  onPressed: () => _openCareers(context),
                ),
                _HeaderButton(
                  label: 'Events',
                  onPressed: () => _openEvents(context),
                ),
                _HeaderButton(
                  label: 'Contact Us',
                  fontSize: 26,
                  onPressed: () {},
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class YuvifyHeaderDrawer extends StatelessWidget {
  const YuvifyHeaderDrawer({super.key});

  void _openAbout(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const AboutPage(),
      ),
    );
  }

  void _openCareers(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const CareersPage(),
      ),
    );
  }

  void _openEvents(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const EventsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(254, 255, 239, 1),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            YuvifyHeaderDrawerTile(
              label: 'About',
              onTap: () => _openAbout(context),
            ),
            YuvifyHeaderDrawerTile(
              label: 'Careers',
              onTap: () => _openCareers(context),
            ),
            YuvifyHeaderDrawerTile(
              label: 'Events',
              onTap: () => _openEvents(context),
            ),
            const YuvifyHeaderDrawerTile(
              label: 'Contact Us',
              onTap: _noop,
            ),
          ],
        ),
      ),
    );
  }
}

void _noop() {}

class YuvifyHeaderDrawerTile extends StatelessWidget {
  const YuvifyHeaderDrawerTile({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: GoogleFonts.kalnia(
          color: const Color.fromRGBO(134, 110, 83, 1),
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
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
          foregroundColor: const Color.fromRGBO(134, 110, 83, 1),
        ),
        child: Text(
          label,
          style: GoogleFonts.kalnia(
            color: const Color.fromRGBO(134, 110, 83, 1),
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
