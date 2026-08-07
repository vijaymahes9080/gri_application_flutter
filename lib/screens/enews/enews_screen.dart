import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../repositories/content_repository.dart';
import '../../widgets/gri_app_bar.dart';
import '../../widgets/gri_drawer.dart';
import '../../widgets/gri_footer.dart';

class ENewsScreen extends StatefulWidget {
  const ENewsScreen({super.key});

  @override
  State<ENewsScreen> createState() => _ENewsScreenState();
}

class _ENewsScreenState extends State<ENewsScreen> {
  final ContentRepository _repository = ContentRepository();
  List<dynamic> _archives = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final list = await _repository.fetchENewsArchive();
    if (mounted) {
      setState(() {
        _archives = list;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GriAppBar(title: 'e-News Archives'),
      drawer: const GriDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAlignment.start,
                children: [
                  const Text(
                    'GRI e-News Bulletins (2015 - 2026)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._archives.map(
                    (yearGroup) => Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.secondaryMaroon,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                yearGroup['year'] ?? '',
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              yearGroup['title'] ?? '',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            ...?((yearGroup['bulletins'] as List<dynamic>?)?.map(
                              (item) => ListTile(
                                dense: true,
                                leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                                title: Text(item['issue'] ?? ''),
                                subtitle: item['highlights'] != null ? Text(item['highlights']) : null,
                                trailing: const Icon(Icons.open_in_new, size: 18),
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Opening ${item['issue']}...')),
                                  );
                                },
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const GriFooter(),
                ],
              ),
            ),
    );
  }
}
