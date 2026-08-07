package ac.ruraluniv.gri.ui.menu

import androidx.lifecycle.ViewModel
import ac.ruraluniv.gri.model.School
import ac.ruraluniv.gri.repository.GriRepository
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow

class MenuViewModel(
    private val repository: GriRepository = GriRepository()
) : ViewModel() {

    private val _schools = MutableStateFlow(repository.getSchools())
    val schools: StateFlow<List<School>> = _schools
}
