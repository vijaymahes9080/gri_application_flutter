import 'package:go_router/go_router.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/academics/schools_screen.dart';
import '../screens/academics/departments_screen.dart';
import '../screens/admissions/admissions_screen.dart';
import '../screens/student_portal/student_portal_screen.dart';
import '../screens/downloads/downloads_screen.dart';
import '../screens/profile/profile_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/schools',
        builder: (context, state) => const SchoolsScreen(),
      ),
      GoRoute(
        path: '/departments',
        builder: (context, state) => const DepartmentsScreen(),
      ),
      GoRoute(
        path: '/admissions',
        builder: (context, state) => const AdmissionsScreen(),
      ),
      GoRoute(
        path: '/portal',
        builder: (context, state) => const StudentPortalScreen(),
      ),
      GoRoute(
        path: '/downloads',
        builder: (context, state) => const DownloadsScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}
