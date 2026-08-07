import 'package:flutter/material.dart';
import '../repositories/content_repository.dart';

class SearchResultItem {
  final String title;
  final String category;
  final String description;
  final String route;

  SearchResultItem({
    required this.title,
    required this.category,
    required this.description,
    required this.route,
  });
}

class SearchProvider with ChangeNotifier {
  final ContentRepository _repository = ContentRepository();
  List<SearchResultItem> _indexedItems = [];
  List<SearchResultItem> _searchResults = [];
  bool _isIndexing = false;
  String _query = '';

  List<SearchResultItem> get searchResults => _searchResults;
  bool get isIndexing => _isIndexing;
  String get query => _query;

  Future<void> indexData() async {
    if (_indexedItems.isNotEmpty) return;
    _isIndexing = true;
    notifyListeners();

    try {
      final newsList = await _repository.fetchNews();
      for (var news in newsList) {
        _indexedItems.add(SearchResultItem(
          title: news.title,
          category: 'News & Announcements',
          description: news.summary,
          route: '/home',
        ));
      }

      final schools = await _repository.fetchSchools();
      for (var s in schools) {
        _indexedItems.add(SearchResultItem(
          title: s.name,
          category: 'Academic Schools',
          description: s.description,
          route: '/schools',
        ));
      }

      final departments = await _repository.fetchDepartments();
      for (var d in departments) {
        _indexedItems.add(SearchResultItem(
          title: d.name,
          category: 'Departments',
          description: 'HOD: ${d.hod} • Programmes: ${d.programmes.join(", ")}',
          route: '/departments',
        ));
      }

      final downloads = await _repository.fetchDownloads();
      for (var dl in downloads) {
        _indexedItems.add(SearchResultItem(
          title: dl['title'] ?? '',
          category: 'Downloads & Forms',
          description: 'Category: ${dl['category']} • Format: ${dl['fileType'] ?? "PDF"}',
          route: '/downloads',
        ));
      }

      final facilities = await _repository.fetchFacilities();
      for (var fac in facilities) {
        _indexedItems.add(SearchResultItem(
          title: fac['name'] ?? '',
          category: 'Facilities & Infrastructure',
          description: fac['description'] ?? '',
          route: '/facilities',
        ));
      }
    } catch (e) {
      debugPrint('Search indexing error: $e');
    } finally {
      _isIndexing = false;
      notifyListeners();
    }
  }

  void search(String query) {
    _query = query.trim().toLowerCase();
    if (_query.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = _indexedItems.where((item) {
        return item.title.toLowerCase().contains(_query) ||
            item.category.toLowerCase().contains(_query) ||
            item.description.toLowerCase().contains(_query);
      }).toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _query = '';
    _searchResults = [];
    notifyListeners();
  }
}
