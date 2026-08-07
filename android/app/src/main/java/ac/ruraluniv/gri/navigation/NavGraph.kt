package ac.ruraluniv.gri.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable

import ac.ruraluniv.gri.ui.splash.SplashScreen
import ac.ruraluniv.gri.ui.login.LoginScreen
import ac.ruraluniv.gri.ui.register.RegisterScreen
import ac.ruraluniv.gri.ui.home.HomeScreen
import ac.ruraluniv.gri.ui.menu.MenuScreen

@Composable
fun SetupNavGraph(navController: NavHostController) {
    NavHost(
        navController = navController,
        startDestination = Screen.Splash.route
    ) {
        composable(route = Screen.Splash.route) {
            SplashScreen(
                onNavigateToLogin = {
                    navController.navigate(Screen.Home.route) {
                        popUpTo(Screen.Splash.route) { inclusive = true }
                    }
                },
                onNavigateToHome = {
                    navController.navigate(Screen.Home.route) {
                        popUpTo(Screen.Splash.route) { inclusive = true }
                    }
                }
            )
        }

        composable(route = Screen.Login.route) {
            LoginScreen(
                onLoginSuccess = {
                    navController.navigate(Screen.Home.route) {
                        popUpTo(Screen.Login.route) { inclusive = true }
                    }
                },
                onNavigateToRegister = {
                    navController.navigate(Screen.Register.route)
                },
                onGuestLogin = {
                    navController.navigate(Screen.Home.route) {
                        popUpTo(Screen.Login.route) { inclusive = true }
                    }
                }
            )
        }

        composable(route = Screen.Register.route) {
            RegisterScreen(
                onRegisterSuccess = {
                    navController.navigate(Screen.Home.route) {
                        popUpTo(Screen.Register.route) { inclusive = true }
                    }
                },
                onNavigateToLogin = {
                    navController.popBackStack()
                }
            )
        }

        composable(route = Screen.Home.route) {
            HomeScreen(
                onOpenMenu = {
                    navController.navigate(Screen.Menu.route)
                },
                onQuickActionClick = { route ->
                    val targetRoute = when (route) {
                        "/admissions", "admissions" -> Screen.Admissions.route
                        "/schools", "schools" -> Screen.Schools.route
                        "/departments", "departments" -> Screen.Departments.route
                        "/portal", "portal" -> Screen.Portal.route
                        "/downloads", "downloads" -> Screen.Downloads.route
                        "/facilities", "facilities" -> Screen.Facilities.route
                        "/enews", "enews" -> Screen.ENews.route
                        "/videos", "videos" -> Screen.Videos.route
                        "/about", "about" -> Screen.About.route
                        "/governance", "governance" -> Screen.Governance.route
                        "/contacts", "contacts" -> Screen.Contacts.route
                        else -> Screen.Home.route
                    }
                    navController.navigate(targetRoute)
                }
            )
        }

        composable(route = Screen.Menu.route) {
            MenuScreen(
                onCloseMenu = {
                    navController.popBackStack()
                },
                onLogout = {
                    navController.navigate(Screen.Login.route) {
                        popUpTo(0) { inclusive = true }
                    }
                },
                onNavigate = { route ->
                    navController.navigate(route)
                }
            )
        }

        composable(route = Screen.About.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.Governance.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.Schools.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.Departments.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.Admissions.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.Facilities.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.ENews.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.Videos.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.Downloads.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.Portal.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
        composable(route = Screen.Contacts.route) { HomeScreen(onOpenMenu = { navController.navigate(Screen.Menu.route) }, onQuickActionClick = { navController.navigate(it) }) }
    }
}
