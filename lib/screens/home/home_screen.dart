import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/theme_provider.dart';
import '../../providers/home_provider.dart';
import '../../widgets/gri_app_bar.dart';
import '../../widgets/gri_drawer.dart';
import '../../widgets/hero_carousel.dart';
import '../../widgets/quick_action_card.dart';
import '../../widgets/news_card.dart';
import '../../widgets/event_card.dart';
import '../../widgets/section_header.dart';
import '../../widgets/gri_footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBottomNavIndex = 0;

  IconData _getQuickActionIcon(String iconName) {
    switch (iconName) {
      case 'school':
        return Icons.school;
      case 'psychology':
        return Icons.psychology;
      case 'dashboard':
        return Icons.dashboard;
      case 'verified_user':
        return Icons.verified_user;
      case 'download':
        return Icons.download;
      case 'person':
        return Icons.person;
      default:
        return Icons.link;
    }
  }

  Color _parseColor(String colorHex) {
    try {
      return Color(int.parse(colorHex));
    } catch (_) {
      return AppColors.primaryGreen;
    }
  }

  void _showAnnouncementsDialog(BuildContext context, List<dynamic> announcements) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: const [
            Icon(Icons.campaign, color: AppColors.accentTerracotta),
            SizedBox(width: 8),
            Text('Marquee Announcements', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: announcements
              .map((announcement) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.new_releases_outlined, color: AppColors.primaryGreen, size: 18),
                    title: Text(announcement.toString(), style: const TextStyle(fontSize: 13)),
                  ))
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(themeProvider.textScaleFactor),
      ),
      child: Scaffold(
        appBar: const GriAppBar(title: 'Gandhigram Rural Institute'),
        drawer: const GriDrawer(),
        body: homeProvider.isLoading
            ? const Center(child: CircularProgressIndicator(color: AppColors.primaryGreen))
            : RefreshIndicator(
                onRefresh: () => homeProvider.loadAllData(),
                color: AppColors.primaryGreen,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Announcement Marquee Ticker
                      InkWell(
                        onTap: () {
                          final announcements = homeProvider.homeData['marquee_announcements'] as List<dynamic>? ?? [];
                          _showAnnouncementsDialog(context, announcements);
                        },
                        child: Container(
                          width: double.infinity,
                          color: AppColors.secondaryMaroon,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.accentTerracotta,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  'ANNOUNCEMENTS',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    (homeProvider.homeData['marquee_announcements'] as List<dynamic>?)
                                            ?.join('   •   ') ??
                                        'CUET UG/PG Admissions 2026-2027 Portal is live now',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Hero Carousel Banner
                      HeroCarousel(
                        items: homeProvider.homeData['hero_carousel'] ?? [],
                      ),
                      const SizedBox(height: 16),

                      // Quick Actions Grid
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAlignment.start,
                          children: [
                            const SectionHeader(
                              title: 'Quick Access Portal',
                              subtitle: 'Essential University Services & Applications',
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: (homeProvider.homeData['quick_actions'] as List<dynamic>?)?.length ?? 0,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.95,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                final qa = homeProvider.homeData['quick_actions'][index];
                                return QuickActionCard(
                                  title: qa['title'] ?? '',
                                  subtitle: qa['subtitle'] ?? '',
                                  icon: _getQuickActionIcon(qa['icon'] ?? ''),
                                  color: _parseColor(qa['color'] ?? '0xFF518214'),
                                  route: qa['route'] ?? '/home',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Latest News Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            SectionHeader(
                              title: 'Latest News & Colloquium',
                              subtitle: 'Recent updates from departments & administration',
                              onSeeAll: () => context.push('/enews'),
                            ),
                            ...homeProvider.newsList.map((news) => NewsCard(news: news)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Upcoming Events Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            SectionHeader(
                              title: 'Upcoming Academic Events',
                              subtitle: 'Examinations, colloquiums & workshops',
                              onSeeAll: () => context.push('/admissions'),
                            ),
                            ...homeProvider.eventList.map((event) => EventCard(event: event)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // University Key Statistics
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.primaryGreen.withOpacity(0.3)),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'GRI At A Glance',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryGreenDark,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: (homeProvider.homeData['statistics'] as List<dynamic>?)
                                      ?.take(3)
                                      .map((stat) => Column(
                                            children: [
                                              Text(
                                                stat['value'] ?? '',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.secondaryMaroon,
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                stat['label'] ?? '',
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  color: AppColors.textSecondaryLight,
                                                ),
                                              ),
                                            ],
                                          ))
                                      .toList() ??
                                  [],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Footer
                      const GriFooter(),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedBottomNavIndex,
          selectedItemColor: AppColors.primaryGreen,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _selectedBottomNavIndex = index;
            });
            switch (index) {
              case 0:
                context.push('/home');
                break;
              case 1:
                context.push('/schools');
                break;
              case 2:
                context.push('/admissions');
                break;
              case 3:
                context.push('/portal');
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Academics'),
            BottomNavigationBarItem(icon: Icon(Icons.how_to_reg), label: 'Admissions'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Portal'),
          ],
        ),
      ),
    );
  }
}
