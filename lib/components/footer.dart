import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class YuvifyFooter extends StatelessWidget {
  const YuvifyFooter({
    super.key,
    this.websiteUrl = 'https://www.yuvify.in',
    this.instagramUrl = 'https://www.instagram.com/yuvify.in?igsh=ZnFqdmNkNWN2YXh0',
    this.linkedinUrl,
    this.backgroundColor = const Color(0x80EFD2B0),
    this.textColor = const Color(0xFF275A47),
    this.borderColor = Colors.black,
    this.borderWidth = 1.2,
    this.topCornerRadius = 36,
  });

  final String websiteUrl;
  final String? instagramUrl;
  final String? linkedinUrl;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final double topCornerRadius;

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < 780;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topCornerRadius),
          topRight: Radius.circular(topCornerRadius),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 20 : 40,
        vertical: isCompact ? 18 : 10,
      ),
      child: Flex(
        direction: isCompact ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _openLink(websiteUrl),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: isCompact
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'lib/assets/logo_transparent.png',
                          height: 46,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'www.yuvify.in',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kalnia(
                            fontSize: 22,
                            height: 1,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'lib/assets/logo_transparent.png',
                          height: 72,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 14),
                        Flexible(
                          child: Text(
                            'www.yuvify.in',
                            style: GoogleFonts.kalnia(
                              fontSize: 35,
                              height: 1,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          SizedBox(width: isCompact ? 0 : 24, height: isCompact ? 14 : 0),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: isCompact ? 12 : 18,
            children: [
              _FooterIconButton(
                assetPath: 'lib/assets/instagram.png',
                semanticLabel: 'Instagram',
                onTap: instagramUrl == null
                    ? null
                    : () => _openLink(instagramUrl!),
                size: isCompact ? 42 : 64,
              ),
              _FooterIconButton(
                assetPath: 'lib/assets/linkedin.png',
                semanticLabel: 'LinkedIn',
                onTap: linkedinUrl == null
                    ? null
                    : () => _openLink(linkedinUrl!),
                size: isCompact ? 42 : 64,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterIconButton extends StatelessWidget {
  const _FooterIconButton({
    required this.assetPath,
    required this.semanticLabel,
    required this.size,
    this.onTap,
  });

  final String assetPath;
  final String semanticLabel;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final button = Image.asset(
      assetPath,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );

    if (onTap == null) {
      return ExcludeSemantics(child: Opacity(opacity: 0.9, child: button));
    }

    return Semantics(
      button: true,
      label: semanticLabel,
      child: InkWell(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        onTap: onTap,
        child: Padding(padding: const EdgeInsets.all(2), child: button),
      ),
    );
  }
}
