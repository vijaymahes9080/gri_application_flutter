package ac.ruraluniv.gri.model

import androidx.compose.runtime.Immutable

@Immutable
data class UniversityInfo(
    val name: String = "The Gandhigram Rural Institute",
    val status: String = "Deemed to be University",
    val accreditation: String = "NAAC A++ Grade (CGPA 3.63)",
    val location: String = "Gandhigram, Dindigul District, Tamil Nadu - 624302",
    val phone: String = "+91 451 2452371 to 2452375",
    val email: String = "registrar@ruraluniv.ac.in",
    val website: String = "https://ruraluniv.ac.in",
    val vcName: String = "Dr. N. Panchanatham",
    val chancellorName: String = "Dr. KM. Annamalai"
)

@Immutable
data class MenuItem(
    val id: String,
    val title: String,
    val iconName: String,
    val category: String,
    val subItems: List<String> = emptyList()
)

@Immutable
data class Announcement(
    val id: String,
    val title: String,
    val date: String,
    val category: String, // News, Admission, Exam, Circular
    val linkUrl: String? = null,
    val isImportant: Boolean = false
)

@Immutable
data class QuickAction(
    val id: String,
    val title: String,
    val iconRes: String,
    val route: String,
    val badgeCount: Int = 0
)

@Immutable
data class School(
    val id: String,
    val name: String,
    val departments: List<String>
)
