enum AppEnvironment { development, staging, production }

class AppConfig {
  static AppEnvironment environment = AppEnvironment.production;

  static const String devBaseUrl = 'https://dev.ruraluniv.ac.in/api/v1';
  static const String stagingBaseUrl = 'https://staging.ruraluniv.ac.in/api/v1';
  static const String prodBaseUrl = 'https://ruraluniv.ac.in/api/v1';

  static String get baseUrl {
    switch (environment) {
      case AppEnvironment.development:
        return devBaseUrl;
      case AppEnvironment.staging:
        return stagingBaseUrl;
      case AppEnvironment.production:
        return prodBaseUrl;
    }
  }

  static const Duration apiTimeout = Duration(seconds: 10);
  static const bool enableRealTimeSync = true;
  static const bool enableOfflineFallback = true;

  // External Portal Endpoints
  static const String officialWebsiteUrl = 'https://ruraluniv.ac.in/';
  static const String samarthPortalUrl = 'https://ruraluniv.samarth.ac.in/index.php/site/login';
  static const String esanadPortalUrl = 'https://www.portal.ruraluniv.ac.in/esanad';
  static const String attendancePortalUrl = 'https://attendance.ruraluniv.ac.in/';
  static const String phdTrackingPortalUrl = 'https://www.ruraluniv.ac.in/GRIIMS1/';
  static const String webmailUrl = 'https://webmail.ruraluniv.ac.in/';
}
