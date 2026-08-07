import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../repositories/content_repository.dart';
import '../../widgets/gri_app_bar.dart';
import '../../widgets/gri_drawer.dart';
import '../../widgets/gri_footer.dart';

class GovernanceScreen extends StatefulWidget {
  const GovernanceScreen({super.key});

  @override
  State<GovernanceScreen> createState() => _GovernanceScreenState();
}

class _GovernanceScreenState extends State<GovernanceScreen> {
  final ContentRepository _repository = ContentRepository();
  Map<String, dynamic>? _data;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final res = await _repository.fetchGovernanceData();
    if (mounted) {
      setState(() {
        _data = res;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GriAppBar(title: 'Governance & Administration'),
      drawer: const GriDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAlignment.start,
                children: [
                  const Text(
                    'University Key Officials',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 12),

                  ...?(_data?['key_officials'] as List<dynamic>?)?.map(
                    (officer) => Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primaryGreen.withOpacity(0.1),
                          child: const Icon(Icons.person, color: AppColors.primaryGreen),
                        ),
                        title: Text(
                          officer['name'] ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAlignment.start,
                          children: [
                            Text(
                              officer['role'] ?? '',
                              style: const TextStyle(color: AppColors.secondaryMaroon, fontWeight: FontWeight.w600),
                            ),
                            Text('Email: ${officer['email'] ?? 'N/A'}'),
                          ],
                        ),
                        isThreeLine: true,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    'Governance Bodies',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryMaroon,
                    ),
                  ),
                  const SizedBox(height: 12),

                  ...?(_data?['governance_bodies'] as List<dynamic>?)?.map(
                    (body) => Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAlignment.start,
                          children: [
                            Text(
                              body['body_name'] ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.slateHeader,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              body['description'] ?? '',
                              style: const TextStyle(fontSize: 14),
                            ),
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
