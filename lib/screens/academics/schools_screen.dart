import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/home_provider.dart';
import '../../widgets/gri_app_bar.dart';

class SchoolsScreen extends StatelessWidget {
  const SchoolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: const GriAppBar(title: 'Schools & Faculties'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: homeProvider.schoolsList.length,
        itemBuilder: (context, index) {
          final school = homeProvider.schoolsList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            child: ExpansionTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.school, color: AppColors.primaryGreen),
              ),
              title: Text(
                school.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              subtitle: Text(
                'Dean: ${school.dean}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        school.description,
                        style: const TextStyle(fontSize: 13, height: 1.4),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Chip(
                            label: Text('${school.departmentsCount} Departments'),
                            backgroundColor: AppColors.secondaryMaroon.withOpacity(0.1),
                            labelStyle: const TextStyle(
                              color: AppColors.secondaryMaroon,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton.icon(
                            onPressed: () => context.go('/departments'),
                            icon: const Icon(Icons.arrow_forward, size: 16),
                            label: const Text('View Departments'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryGreen,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
