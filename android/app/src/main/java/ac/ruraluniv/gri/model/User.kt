package ac.ruraluniv.gri.model

import androidx.compose.runtime.Immutable

@Immutable
data class User(
    val regNumber: String,
    val fullName: String,
    val email: String,
    val mobile: String,
    val department: String,
    val programme: String,
    val avatarUrl: String? = null,
    val isLoggedIn: Boolean = false
)

sealed class AuthState {
    object Idle : AuthState()
    object Loading : AuthState()
    data class Success(val user: User) : AuthState()
    data class Error(val message: String) : AuthState()
}
