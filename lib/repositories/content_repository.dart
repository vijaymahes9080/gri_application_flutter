import '../core/constants/app_constants.dart';
import '../core/utils/asset_loader.dart';
import '../models/news_item.dart';
import '../models/event_item.dart';
import '../models/school.dart';
import '../models/department.dart';

class ContentRepository {
  Future<Map<String, dynamic>> fetchHomeData() async {
    return await AssetLoader.loadJsonObject(AppConstants.assetJsonHome);
  }

  Future<Map<String, dynamic>> fetchAboutData() async {
    return await AssetLoader.loadJsonObject(AppConstants.assetJsonAbout);
  }

  Future<Map<String, dynamic>> fetchGovernanceData() async {
    return await AssetLoader.loadJsonObject(AppConstants.assetJsonGovernance);
  }

  Future<Map<String, dynamic>> fetchAcademicsData() async {
    return await AssetLoader.loadJsonObject(AppConstants.assetJsonAcademics);
  }

  Future<List<NewsItem>> fetchNews() async {
    final rawList = await AssetLoader.loadJsonList(AppConstants.assetJsonNews);
    return rawList.map((item) => NewsItem.fromJson(item)).toList();
  }

  Future<List<dynamic>> fetchENewsArchive() async {
    return await AssetLoader.loadJsonList(AppConstants.assetJsonENews);
  }

  Future<List<EventItem>> fetchEvents() async {
    final rawList = await AssetLoader.loadJsonList(AppConstants.assetJsonEvents);
    return rawList.map((item) => EventItem.fromJson(item)).toList();
  }

  Future<List<School>> fetchSchools() async {
    final rawList = await AssetLoader.loadJsonList(AppConstants.assetJsonSchools);
    return rawList.map((item) => School.fromJson(item)).toList();
  }

  Future<List<Department>> fetchDepartments() async {
    final rawList = await AssetLoader.loadJsonList(AppConstants.assetJsonDepartments);
    return rawList.map((item) => Department.fromJson(item)).toList();
  }

  Future<Map<String, dynamic>> fetchAdmissions() async {
    return await AssetLoader.loadJsonObject(AppConstants.assetJsonAdmissions);
  }

  Future<List<dynamic>> fetchDownloads() async {
    return await AssetLoader.loadJsonList(AppConstants.assetJsonDownloads);
  }

  Future<List<dynamic>> fetchDocuments() async {
    return await AssetLoader.loadJsonList(AppConstants.assetJsonDocuments);
  }

  Future<Map<String, dynamic>> fetchContacts() async {
    return await AssetLoader.loadJsonObject(AppConstants.assetJsonContacts);
  }

  Future<List<dynamic>> fetchFacilities() async {
    return await AssetLoader.loadJsonList(AppConstants.assetJsonFacilities);
  }

  Future<Map<String, dynamic>> fetchStudentPortalServices() async {
    return await AssetLoader.loadJsonObject(AppConstants.assetJsonPortal);
  }

  Future<List<dynamic>> fetchVideos() async {
    return await AssetLoader.loadJsonList(AppConstants.assetJsonVideos);
  }
}
