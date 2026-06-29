import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nimbus/presentation/widgets/whatsapp_icon.dart';
import 'package:nimbus/values/values.dart';

class FloatingWhatsAppButton extends StatelessWidget {
  final String phoneNumber;
  final String message;

  const FloatingWhatsAppButton({
    super.key,
    required this.phoneNumber,
    required this.message,
  });

  Future<void> _launchWhatsApp() async {
    try {
      String cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

      if (!cleanPhone.startsWith('+')) {
        cleanPhone = '+$cleanPhone';
      }

      String encodedMessage = Uri.encodeComponent(message);
      final String whatsappUrl =
          "https://wa.me/$cleanPhone?text=$encodedMessage";
      final Uri url = Uri.parse(whatsappUrl);

      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Could not launch WhatsApp';
      }
    } catch (e) {
      debugPrint('Error launching WhatsApp: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 90,
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
          onPressed: _launchWhatsApp,
          backgroundColor: const Color(0xFF25D366),
          heroTag: 'whatsapp_fab',
          tooltip: 'Chat on WhatsApp',
          child: const WhatsAppIcon(
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
