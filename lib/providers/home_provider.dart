import 'package:flutter/material.dart';
import '../repositories/content_repository.dart';
import '../models/news_item.dart';
import '../models/event_item.dart';
import '../models/school.dart';
import '../models/department.dart';

class HomeProvider extends ChangeNotifier {
  final ContentRepository _repository = ContentRepository();

  bool _isLoading = true;
  Map<String, dynamic> _homeData = {};
  List<NewsItem> _newsList = [];
  List<EventItem> _eventList = [];
  List<School> _schoolsList = [];
  List<Department> _departmentList = [];
  Map<String, dynamic> _admissionsData = {};
  List<dynamic> _downloadsList = [];
  Map<String, dynamic> _contactsData = {};

  bool get isLoading => _isLoading;
  Map<String, dynamic> get homeData => _homeData;
  List<NewsItem> get newsList => _newsList;
  List<EventItem> get eventList => _eventList;
  List<School> get schoolsList => _schoolsList;
  List<Department> get departmentList => _departmentList;
  Map<String, dynamic> get admissionsData => _admissionsData;
  List<dynamic> get downloadsList => _downloadsList;
  Map<String, dynamic> get contactsData => _contactsData;

  HomeProvider() {
    loadAllData();
  }

  Future<void> loadAllData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _homeData = await _repository.fetchHomeData();
      _newsList = await _repository.fetchNews();
      _eventList = await _repository.fetchEvents();
      _schoolsList = await _repository.fetchSchools();
      _departmentList = await _repository.fetchDepartments();
      _admissionsData = await _repository.fetchAdmissions();
      _downloadsList = await _repository.fetchDownloads();
      _contactsData = await _repository.fetchContacts();
    } catch (e) {
      debugPrint('Error loading home data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
