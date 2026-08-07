package ac.ruraluniv.gri.ui.login

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import ac.ruraluniv.gri.model.AuthState
import ac.ruraluniv.gri.repository.GriRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch

class LoginViewModel(
    private val repository: GriRepository = GriRepository()
) : ViewModel() {

    var regNumber = MutableStateFlow("")
    var password = MutableStateFlow("")
    var rememberMe = MutableStateFlow(false)

    var regError = MutableStateFlow<String?>(null)
    var passError = MutableStateFlow<String?>(null)

    private val _authState = MutableStateFlow<AuthState>(AuthState.Idle)
    val authState: StateFlow<AuthState> = _authState

    fun login() {
        regError.value = null
        passError.value = null

        if (regNumber.value.isBlank()) {
            regError.value = "Register Number or Email is required"
            return
        }
        if (password.value.length < 6) {
            passError.value = "Password must be at least 6 characters"
            return
        }

        viewModelScope.launch {
            _authState.value = AuthState.Loading
            val result = repository.login(regNumber.value, password.value)
            result.onSuccess { user ->
                _authState.value = AuthState.Success(user)
            }.onFailure { ex ->
                _authState.value = AuthState.Error(ex.message ?: "Authentication failed")
            }
        }
    }
}
