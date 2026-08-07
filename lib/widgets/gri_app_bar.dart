import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/theme_provider.dart';

class GriAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const GriAppBar({super.key, this.title = 'GRI Mobile'});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: const Icon(
              Icons.account_balance,
              color: AppColors.primaryGreen,
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Deemed to be University',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.zoom_in, color: Colors.white),
          tooltip: 'Zoom In Text',
          onPressed: () => themeProvider.zoomInText(),
        ),
        IconButton(
          icon: const Icon(Icons.zoom_out, color: Colors.white),
          tooltip: 'Zoom Out Text',
          onPressed: () => themeProvider.zoomOutText(),
        ),
        IconButton(
          icon: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: Colors.white,
          ),
          tooltip: 'Toggle Dark Mode',
          onPressed: () => themeProvider.toggleTheme(),
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          tooltip: 'Notifications',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No new notifications')),
            );
          },
        ),
      ],
    );
  }
}
