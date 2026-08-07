import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_colors.dart';
import '../providers/auth_provider.dart';

class GriDrawer extends StatelessWidget {
  const GriDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryGreen, AppColors.primaryGreenDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: Text(
              user?.name ?? 'The Gandhigram Rural Institute',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            accountEmail: Text(
              user?.email ?? 'Deemed to be University',
              style: const TextStyle(fontSize: 12),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                user != null ? Icons.person : Icons.school,
                size: 36,
                color: AppColors.primaryGreen,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: AppColors.primaryGreen),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.accentTerracotta),
            title: const Text('About GRI'),
            onTap: () {
              Navigator.pop(context);
              context.go('/about');
            },
          ),
          ListTile(
            leading: const Icon(Icons.gavel_outlined, color: AppColors.navyBlue),
            title: const Text('Governance & Administration'),
            onTap: () {
              Navigator.pop(context);
              context.go('/governance');
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_outlined, color: AppColors.secondaryMaroon),
            title: const Text('Schools & Faculties'),
            onTap: () {
              Navigator.pop(context);
              context.go('/schools');
            },
          ),
          ListTile(
            leading: const Icon(Icons.domain, color: AppColors.navyBlue),
            title: const Text('Departments'),
            onTap: () {
              Navigator.pop(context);
              context.go('/departments');
            },
          ),
          ListTile(
            leading: const Icon(Icons.how_to_reg_outlined, color: AppColors.accentTerracotta),
            title: const Text('Admissions 2026'),
            onTap: () {
              Navigator.pop(context);
              context.go('/admissions');
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city_outlined, color: AppColors.primaryGreen),
            title: const Text('Facilities & Infrastructure'),
            onTap: () {
              Navigator.pop(context);
              context.go('/facilities');
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper_outlined, color: AppColors.secondaryMaroon),
            title: const Text('e-News Archives'),
            onTap: () {
              Navigator.pop(context);
              context.go('/enews');
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_library_outlined, color: Colors.purple),
            title: const Text('Video Gallery'),
            onTap: () {
              Navigator.pop(context);
              context.go('/videos');
            },
          ),
          ListTile(
            leading: const Icon(Icons.download_outlined, color: AppColors.slateHeader),
            title: const Text('Downloads & Forms'),
            onTap: () {
              Navigator.pop(context);
              context.go('/downloads');
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard_outlined, color: AppColors.primaryGreen),
            title: const Text('Student Portal (Samarth)'),
            onTap: () {
              Navigator.pop(context);
              context.go('/portal');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone_outlined, color: AppColors.accentTerracotta),
            title: const Text('Contacts & Helpline'),
            onTap: () {
              Navigator.pop(context);
              context.go('/contacts');
            },
          ),
          const Divider(),
          if (authProvider.isAuthenticated) ...[
            ListTile(
              leading: const Icon(Icons.person_outline, color: AppColors.primaryGreen),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
                context.go('/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () async {
                await authProvider.logout();
                if (context.mounted) {
                  Navigator.pop(context);
                  context.go('/login');
                }
              },
            ),
          ] else ...[
            ListTile(
              leading: const Icon(Icons.login, color: AppColors.primaryGreen),
              title: const Text('Login / Portal Sign In'),
              onTap: () {
                Navigator.pop(context);
                context.go('/login');
              },
            ),
          ],
        ],
      ),
    );
  }
}
