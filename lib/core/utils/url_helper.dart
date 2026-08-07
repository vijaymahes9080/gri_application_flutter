import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<bool> openUrl(BuildContext context, String urlString) async {
    final Uri? uri = Uri.tryParse(urlString);
    if (uri == null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid link format: $urlString')),
        );
      }
      return false;
    }

    try {
      if (await canLaunchUrl(uri)) {
        return await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        // Fallback for custom or HTTP protocols
        return await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open link: $urlString')),
        );
      }
      return false;
    }
  }

  static Future<bool> makePhoneCall(BuildContext context, String phoneNumber) async {
    final cleanPhone = phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '');
    return openUrl(context, 'tel:$cleanPhone');
  }

  static Future<bool> sendEmail(BuildContext context, String emailAddress) async {
    return openUrl(context, 'mailto:$emailAddress');
  }
}
