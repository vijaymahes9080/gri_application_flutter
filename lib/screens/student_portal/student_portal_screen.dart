import 'package:flutter/material.dart';
import '../../core/config/app_config.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/url_helper.dart';
import '../../widgets/gri_app_bar.dart';

class StudentPortalScreen extends StatelessWidget {
  const StudentPortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GriAppBar(title: 'Student Portal (Samarth@GRI)'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAlignment.start,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => UrlHelper.openUrl(context, AppConfig.samarthPortalUrl),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.navyBlue, AppColors.slateHeader],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.dashboard_customize, color: Colors.white, size: 40),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAlignment.start,
                        children: [
                          Text(
                            'Samarth @ GRI Unified Portal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Single Sign-On for Student Attendance, Examinations & e-SANAD',
                            style: TextStyle(color: Colors.white70, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.open_in_new, color: Colors.white70, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Online Services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryGreenDark),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.check_circle_outline, color: AppColors.primaryGreen),
                title: const Text('Attendance Monitoring System', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Check daily attendance percentage and condonation status'),
                trailing: const Icon(Icons.open_in_new, size: 18),
                onTap: () => UrlHelper.openUrl(context, AppConfig.attendancePortalUrl),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.verified_user, color: AppColors.navyBlue),
                title: const Text('e-SANAD Document Verification', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Online apostille & certificate verification with MEA'),
                trailing: const Icon(Icons.open_in_new, size: 18),
                onTap: () => UrlHelper.openUrl(context, AppConfig.esanadPortalUrl),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.psychology, color: AppColors.secondaryMaroon),
                title: const Text('Ph.D. Tracking Portal (GRIIMS)', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Track doctoral research progress and viva voce schedule'),
                trailing: const Icon(Icons.open_in_new, size: 18),
                onTap: () => UrlHelper.openUrl(context, AppConfig.phdTrackingPortalUrl),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.badge, color: AppColors.accentTerracotta),
                title: const Text('End Semester Examination Results', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('View semester gradesheet, arrears, and revaluation'),
                trailing: const Icon(Icons.open_in_new, size: 18),
                onTap: () => UrlHelper.openUrl(context, 'http://ruraluniv.ac.in/examtt'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
