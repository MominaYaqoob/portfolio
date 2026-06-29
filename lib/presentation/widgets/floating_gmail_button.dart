import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/widgets/app_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingGmailButton extends StatelessWidget {
  final String gmailAddress;
  final String? subject;
  final String? body;

  const FloatingGmailButton({
    super.key,
    required this.gmailAddress,
    this.subject,
    this.body,
  });

  Future<void> _launchGmail() async {
    try {
      String encodedSubject = Uri.encodeComponent(subject ?? '');
      String encodedBody = Uri.encodeComponent(body ?? '');
      final String mailtoUrl =
          "mailto:$gmailAddress?subject=$encodedSubject&body=$encodedBody";
      final Uri url = Uri.parse(mailtoUrl);

      if (await canLaunchUrl(url)) {
        if (kIsWeb) {
          await launchUrl(url, webOnlyWindowName: '_blank');
        } else {
          await launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        }
      } else {
        throw 'Could not launch Gmail';
      }
    } catch (e) {
      debugPrint('Error launching Gmail: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 160,
      right: 15,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: _launchGmail,
          backgroundColor: const Color(0xFFEA4335),
          heroTag: 'gmail_fab',
          tooltip: 'Send Email',
          child: const AppIcon(
            AppIconData.fa(FontAwesomeIcons.envelope),
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
