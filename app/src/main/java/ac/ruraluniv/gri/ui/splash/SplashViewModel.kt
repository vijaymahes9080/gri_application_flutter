package ac.ruraluniv.gri.ui.splash

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.launch

sealed class SplashNavigationEvent {
    object NavigateToLogin : SplashNavigationEvent()
    object NavigateToHome : SplashNavigationEvent()
}

class SplashViewModel : ViewModel() {

    private val _navigationEvent = MutableSharedFlow<SplashNavigationEvent>()
    val navigationEvent = _navigationEvent.asSharedFlow()

    init {
        startSplashTimer()
    }

    private fun startSplashTimer() {
        viewModelScope.launch {
            delay(2500) // Animated delay for logo & branding pulse
            _navigationEvent.emit(SplashNavigationEvent.NavigateToLogin)
        }
    }
}
