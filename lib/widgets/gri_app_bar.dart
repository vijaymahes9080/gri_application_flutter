import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/theme_provider.dart';
import '../providers/search_provider.dart';

class GriAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const GriAppBar({super.key, this.title = 'GRI Mobile'});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                ),
              ],
            ),
            child: const Icon(
              Icons.account_balance,
              color: AppColors.primaryGreen,
              size: 22,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Deemed to be University',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          tooltip: 'Global University Search',
          onPressed: () async {
            final searchProvider = Provider.of<SearchProvider>(context, listen: false);
            await searchProvider.indexData();
            if (context.mounted) {
              showSearch(context: context, delegate: GriSearchDelegate(searchProvider));
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.text_increase, color: Colors.white),
          tooltip: 'Zoom In Text (A+)',
          onPressed: () => themeProvider.zoomInText(),
        ),
        IconButton(
          icon: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: Colors.white,
          ),
          tooltip: 'Toggle Dark Mode',
          onPressed: () => themeProvider.toggleTheme(),
        ),
      ],
    );
  }
}

class GriSearchDelegate extends SearchDelegate {
  final SearchProvider searchProvider;

  GriSearchDelegate(this.searchProvider);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            searchProvider.clearSearch();
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchProvider.search(query);
    final results = searchProvider.searchResults;

    if (results.isEmpty) {
      return const Center(
        child: Text('No results found for your search query.'),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          leading: const Icon(Icons.info_outline, color: AppColors.primaryGreen),
          title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${item.category} • ${item.description}'),
          onTap: () {
            close(context, null);
            context.go(item.route);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchProvider.search(query);
    final results = searchProvider.searchResults;

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          leading: const Icon(Icons.search, color: Colors.grey),
          title: Text(item.title),
          subtitle: Text(item.category),
          onTap: () {
            close(context, null);
            context.go(item.route);
          },
        );
      },
    );
  }
}
