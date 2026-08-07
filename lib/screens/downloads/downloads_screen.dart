import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/home_provider.dart';
import '../../widgets/gri_app_bar.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final downloads = homeProvider.downloadsList;

    return Scaffold(
      appBar: const GriAppBar(title: 'Downloads & Official Forms'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: downloads.length,
        itemBuilder: (context, index) {
          final item = downloads[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.secondaryMaroon.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.picture_as_pdf, color: AppColors.secondaryMaroon),
              ),
              title: Text(
                item['title'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              subtitle: Text(
                'Category: ${item['category'] ?? ''} • Format: ${item['file_type'] ?? 'PDF'}',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.download, color: AppColors.primaryGreen),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Downloading ${item['title']}...')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
