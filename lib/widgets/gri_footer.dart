import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class GriFooter extends StatelessWidget {
  const GriFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.slateHeader,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.account_balance,
                  color: AppColors.primaryGreen,
                  size: 24,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Gandhigram Rural Institute',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Deemed to be University',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Address & Contact',
            style: TextStyle(
              color: AppColors.accentTerracotta,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Gandhigram, Dindigul District, Tamil Nadu, India - 624 302\nPhone: +91 451 2452371 to 2452375\nEmail: gru@ruraluniv.ac.in',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white24),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              '© 2026 The Gandhigram Rural Institute. All rights reserved.',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
