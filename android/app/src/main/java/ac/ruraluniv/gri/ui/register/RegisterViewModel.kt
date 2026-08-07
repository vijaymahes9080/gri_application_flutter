package ac.ruraluniv.gri.ui.register

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow

class RegisterViewModel : ViewModel() {

    var fullName = MutableStateFlow("")
    var regNumber = MutableStateFlow("")
    var department = MutableStateFlow("")
    var programme = MutableStateFlow("")
    var email = MutableStateFlow("")
    var mobile = MutableStateFlow("")
    var password = MutableStateFlow("")
    var confirmPassword = MutableStateFlow("")

    var errorMsg = MutableStateFlow<String?>(null)

    fun validateAndRegister(): Boolean {
        errorMsg.value = null
        if (fullName.value.isBlank()) {
            errorMsg.value = "Full Name is required"
            return false
        }
        if (regNumber.value.isBlank()) {
            errorMsg.value = "Register Number is required"
            return false
        }
        if (!email.value.contains("@")) {
            errorMsg.value = "Enter a valid email address"
            return false
        }
        if (mobile.value.length < 10) {
            errorMsg.value = "Enter a valid 10-digit mobile number"
            return false
        }
        if (password.value.length < 6) {
            errorMsg.value = "Password must be at least 6 characters"
            return false
        }
        if (password.value != confirmPassword.value) {
            errorMsg.value = "Passwords do not match"
            return false
        }
        return true
    }
}
