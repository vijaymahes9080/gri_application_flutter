package ac.ruraluniv.gri.repository

import ac.ruraluniv.gri.model.*
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow

class GriRepository {

    fun getUniversityInfo(): UniversityInfo {
        return UniversityInfo()
    }

    fun getAnnouncements(): Flow<List<Announcement>> = flow {
        val list = listOf(
            Announcement(
                id = "1",
                title = "Classes for 1st Year UG (CUET & Non-CUET) & Diploma commence on 20.07.2026",
                date = "30 Jul 2026",
                category = "Academic",
                isImportant = true
            ),
            Announcement(
                id = "2",
                title = "TRIVISTA '26 Jointly Organized by Dept. of Computer Science & CAIDS",
                date = "29 Jul 2026",
                category = "Events",
                isImportant = false
            ),
            Announcement(
                id = "3",
                title = "MoU Signed between Algorian Software Solutions & Dept. of Rural Industries",
                date = "27 Jul 2026",
                category = "MoU",
                isImportant = false
            ),
            Announcement(
                id = "4",
                title = "World Population Day 2026 & Workshop on Biomolecular Technology",
                date = "18 Jul 2026",
                category = "Workshop",
                isImportant = false
            ),
            Announcement(
                id = "5",
                title = "Ph.D. Admission Notification & Application Form July 2026 Session",
                date = "10 Jul 2026",
                category = "Admission",
                isImportant = true
            )
        )
        emit(list)
    }

    fun getQuickActions(): List<QuickAction> {
        return listOf(
            QuickAction("adm", "Admissions", "ic_admission", "admissions", badgeCount = 2),
            QuickAction("acad", "Academics", "ic_academic", "academics"),
            QuickAction("exam", "Examination", "ic_exam", "examination"),
            QuickAction("dept", "Departments", "ic_department", "departments"),
            QuickAction("notice", "Notices", "ic_notice", "notices", badgeCount = 5),
            QuickAction("portal", "Samarth Portal", "ic_portal", "portal"),
            QuickAction("downloads", "Downloads", "ic_download", "downloads"),
            QuickAction("contact", "Contact Us", "ic_contact", "contact")
        )
    }

    fun getSchools(): List<School> {
        return listOf(
            School(
                id = "sch_1",
                name = "School of Sciences",
                departments = listOf("Mathematics", "Physics", "Chemistry", "Biology", "Computer Science and Applications")
            ),
            School(
                id = "sch_2",
                name = "School of Social Sciences",
                departments = listOf("Rural Development", "Gandhikalam & Value Education", "Sociology", "Social Work")
            ),
            School(
                id = "sch_3",
                name = "School of Agriculture & Rural Development",
                departments = listOf("Agriculture", "Rural Industries and Management", "Cooperation")
            ),
            School(
                id = "sch_4",
                name = "School of Tamil & Indian Languages",
                departments = listOf("Tamil", "Hindi", "English and Foreign Languages")
            )
        )
    }

    suspend fun login(regNumber: String, pass: String): Result<User> {
        delay(1000) // Simulate network call
        return if (regNumber.isNotBlank() && pass.length >= 6) {
            Result.success(
                User(
                    regNumber = regNumber,
                    fullName = "Vijay Mahes",
                    email = "Vijaypradhap2004@gmail.com",
                    mobile = "9876543210",
                    department = "Computer Science and Applications",
                    programme = "M.Sc. Computer Science",
                    isLoggedIn = true
                )
            )
        } else {
            Result.failure(Exception("Invalid Register Number or Password (min 6 chars)"))
        }
    }
}
