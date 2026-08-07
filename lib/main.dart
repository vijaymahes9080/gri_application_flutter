import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'providers/home_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/search_provider.dart';
import 'providers/connectivity_provider.dart';
import 'routes/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GriApp());
}

class GriApp extends StatelessWidget {
  const GriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: themeProvider.textScaleFactor,
            ),
            child: MaterialApp.router(
              title: 'The Gandhigram Rural Institute',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              routerConfig: AppRouter.router,
            ),
          );
        },
      ),
    );
  }
}
