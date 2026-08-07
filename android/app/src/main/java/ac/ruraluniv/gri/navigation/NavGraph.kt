package ac.ruraluniv.gri.navigation

import android.util.Log
import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable

import ac.ruraluniv.gri.ui.splash.SplashScreen
import ac.ruraluniv.gri.ui.login.LoginScreen
import ac.ruraluniv.gri.ui.register.RegisterScreen
import ac.ruraluniv.gri.ui.home.HomeScreen
import ac.ruraluniv.gri.ui.menu.MenuScreen

fun safeNavigate(navController: NavHostController, route: String) {
    try {
        navController.navigate(route)
    } catch (e: Exception) {
        Log.e("NavGraph", "Safe navigation caught error for route $route: ${e.message}")
        try {
            val fallback = route.trimStart('/')
            if (fallback != route) {
                navController.navigate(fallback)
            }
        } catch (ex: Exception) {
            Log.e("NavGraph", "Fallback navigation error: ${ex.message}")
        }
    }
}

@Composable
fun SetupNavGraph(navController: NavHostController) {
    NavHost(
        navController = navController,
        startDestination = Screen.Splash.route
    ) {
        composable(route = Screen.Splash.route) {
            SplashScreen(
                onNavigateToLogin = {
                    safeNavigate(navController, Screen.Home.route)
                },
                onNavigateToHome = {
                    safeNavigate(navController, Screen.Home.route)
                }
            )
        }

        composable(route = Screen.Login.route) {
            LoginScreen(
                onLoginSuccess = {
                    safeNavigate(navController, Screen.Home.route)
                },
                onNavigateToRegister = {
                    safeNavigate(navController, Screen.Register.route)
                },
                onGuestLogin = {
                    safeNavigate(navController, Screen.Home.route)
                }
            )
        }

        composable(route = Screen.Register.route) {
            RegisterScreen(
                onRegisterSuccess = {
                    safeNavigate(navController, Screen.Home.route)
                },
                onNavigateToLogin = {
                    navController.popBackStack()
                }
            )
        }

        composable(route = Screen.Home.route) {
            HomeScreen(
                onOpenMenu = {
                    safeNavigate(navController, Screen.Menu.route)
                },
                onQuickActionClick = { route ->
                    safeNavigate(navController, route)
                }
            )
        }

        composable(route = Screen.Menu.route) {
            MenuScreen(
                onCloseMenu = {
                    navController.popBackStack()
                },
                onLogout = {
                    safeNavigate(navController, Screen.Login.route)
                },
                onNavigate = { route ->
                    safeNavigate(navController, route)
                }
            )
        }

        // Register both prefixed and non-prefixed routes for complete safety
        val routesList = listOf(
            "about", "/about",
            "governance", "/governance",
            "schools", "/schools",
            "departments", "/departments",
            "admissions", "/admissions",
            "facilities", "/facilities",
            "enews", "/enews",
            "videos", "/videos",
            "downloads", "/downloads",
            "portal", "/portal",
            "contacts", "/contacts",
            "profile", "/profile"
        )

        for (r in routesList) {
            composable(route = r) {
                HomeScreen(
                    onOpenMenu = { safeNavigate(navController, Screen.Menu.route) },
                    onQuickActionClick = { safeNavigate(navController, it) }
                )
            }
        }
    }
}
