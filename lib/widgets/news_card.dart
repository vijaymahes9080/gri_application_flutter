import 'package:flutter/material.dart';
import '../models/news_item.dart';
import '../core/constants/app_colors.dart';
import '../core/utils/gri_image.dart';

class NewsCard extends StatelessWidget {
  final NewsItem news;

  const NewsCard({super.key, required this.news});

  void _showNewsDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Column(
          crossAxisAlignment: CrossAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: news.isImportant ? AppColors.secondaryMaroon : AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                news.category,
                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              news.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Date: ${news.date}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAlignment.start,
            children: [
              if (news.imageUrl.isNotEmpty) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GriImage(
                    imagePath: news.imageUrl,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
              ],
              Text(
                news.summary,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, height: 1.3),
              ),
              const SizedBox(height: 10),
              Text(
                news.content,
                style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
              ),
            ],
          ),
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
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _showNewsDetails(context),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 70,
                  height: 70,
                  color: AppColors.primaryGreen.withOpacity(0.1),
                  child: news.imageUrl.isNotEmpty
                      ? GriImage(
                          imagePath: news.imageUrl,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.article_outlined,
                          color: AppColors.primaryGreen,
                          size: 32,
                        ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: news.isImportant
                                ? AppColors.secondaryMaroon
                                : AppColors.primaryGreen,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            news.category,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          news.date,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      news.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      news.summary,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
