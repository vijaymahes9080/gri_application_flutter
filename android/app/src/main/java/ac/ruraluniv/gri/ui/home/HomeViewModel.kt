package ac.ruraluniv.gri.ui.home

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import ac.ruraluniv.gri.model.*
import ac.ruraluniv.gri.repository.GriRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch

class HomeViewModel(
    private val repository: GriRepository = GriRepository()
) : ViewModel() {

    private val _universityInfo = MutableStateFlow(repository.getUniversityInfo())
    val universityInfo: StateFlow<UniversityInfo> = _universityInfo

    private val _announcements = MutableStateFlow<List<Announcement>>(emptyList())
    val announcements: StateFlow<List<Announcement>> = _announcements

    private val _quickActions = MutableStateFlow(repository.getQuickActions())
    val quickActions: StateFlow<List<QuickAction>> = _quickActions

    init {
        fetchAnnouncements()
    }

    private fun fetchAnnouncements() {
        viewModelScope.launch {
            repository.getAnnouncements().collect { list ->
                _announcements.value = list
            }
        }
    }
}
