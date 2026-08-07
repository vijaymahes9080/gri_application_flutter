package ac.ruraluniv.gri.navigation

sealed class Screen(val route: String) {
    object Splash : Screen("splash")
    object Login : Screen("login")
    object Register : Screen("register")
    object Home : Screen("home")
    object Menu : Screen("menu")
    
    // Future Modules Routes
    object StudentProfile : Screen("profile")
    object Attendance : Screen("attendance")
    object Results : Screen("results")
    object Examinations : Screen("examinations")
    object Settings : Screen("settings")
}
