import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/config/app_config.dart';
import '../core/utils/url_helper.dart';

class QuickActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String route;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
  });

  void _handleTap(BuildContext context) {
    if (route.startsWith('http://') || route.startsWith('https://')) {
      UrlHelper.openUrl(context, route);
    } else if (title.contains('Samarth')) {
      UrlHelper.openUrl(context, AppConfig.samarthPortalUrl);
    } else if (title.contains('e-SANAD')) {
      UrlHelper.openUrl(context, AppConfig.esanadPortalUrl);
    } else if (title.contains('Ph.D')) {
      UrlHelper.openUrl(context, AppConfig.phdTrackingPortalUrl);
    } else {
      try {
        context.push(route);
      } catch (_) {
        context.go(route);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _handleTap(context),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 10,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
