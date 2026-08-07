import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/home_provider.dart';
import '../../widgets/gri_app_bar.dart';

class AdmissionsScreen extends StatelessWidget {
  const AdmissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final admissions = homeProvider.admissionsData;

    return Scaffold(
      appBar: const GriAppBar(title: 'Admissions 2026-2027'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: AppColors.primaryGreen,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Academic Year 2026 - 2027 Admissions Open',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'CUET UG / PG / Ph.D. Applications are open online for all programmes.',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Opening Prospectus 2026-27 PDF...')),
                        );
                      },
                      icon: const Icon(Icons.picture_as_pdf, color: AppColors.primaryGreen),
                      label: const Text('Download Prospectus 2026-27', style: TextStyle(color: AppColors.primaryGreen)),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Key Dates & Deadlines',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryGreenDark),
            ),
            const SizedBox(height: 10),
            ...((admissions['key_dates'] as List<dynamic>?) ?? []).map(
              (item) => Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const Icon(Icons.event_available, color: AppColors.accentTerracotta),
                  title: Text(item['event'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  subtitle: Text(item['date'] ?? '', style: const TextStyle(color: AppColors.secondaryMaroon, fontSize: 12)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Offered Programme Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryGreenDark),
            ),
            const SizedBox(height: 10),
            ...((admissions['categories'] as List<dynamic>?) ?? []).map(
              (cat) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ExpansionTile(
                  title: Text(cat['name'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: ((cat['items'] as List<dynamic>?) ?? [])
                            .map((item) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.check_circle, size: 14, color: AppColors.primaryGreen),
                                      const SizedBox(width: 8),
                                      Expanded(child: Text(item.toString(), style: const TextStyle(fontSize: 13))),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
