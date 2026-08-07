import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../repositories/content_repository.dart';
import '../../widgets/gri_app_bar.dart';
import '../../widgets/gri_drawer.dart';
import '../../widgets/gri_footer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final ContentRepository _repository = ContentRepository();
  Map<String, dynamic>? _aboutData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await _repository.fetchAboutData();
    if (mounted) {
      setState(() {
        _aboutData = data;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GriAppBar(title: 'About GRI'),
      drawer: const GriDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAlignment.start,
                children: [
                  // Banner Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primaryGreen, AppColors.primaryGreenDark],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/gri_logo.png',
                          height: 80,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.school, size: 80, color: Colors.white),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _aboutData?['university_info']?['name'] ?? 'The Gandhigram Rural Institute',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _aboutData?['university_info']?['accreditation'] ?? 'NAAC A Grade (3rd Cycle)',
                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '"${_aboutData?['university_info']?['motto'] ?? ''}"',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.amberAccent,
                            fontStyle: FontStyle.italic,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Vision & Mission Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.lightbulb_outline, color: AppColors.accentTerracotta),
                              SizedBox(width: 8),
                              Text(
                                'Vision',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryGreen,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _aboutData?['vision'] ?? '',
                            style: const TextStyle(fontSize: 14, height: 1.4),
                          ),
                          const Divider(height: 24),
                          Row(
                            children: const [
                              Icon(Icons.flag_outlined, color: AppColors.secondaryMaroon),
                              SizedBox(width: 8),
                              Text(
                                'Mission',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryMaroon,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ...?(_aboutData?['mission'] as List<dynamic>?)?.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Row(
                                crossAxisAlignment: CrossAlignment.start,
                                children: [
                                  const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                      item.toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Genesis & History
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.history_edu, color: AppColors.navyBlue),
                              SizedBox(width: 8),
                              Text(
                                'Genesis & History (1956)',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.navyBlue,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _aboutData?['genesis']?['history'] ?? '',
                            style: const TextStyle(fontSize: 14, height: 1.4),
                          ),
                        ],
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
