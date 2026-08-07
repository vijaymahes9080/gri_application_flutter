package ac.ruraluniv.gri.ui.menu

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import ac.ruraluniv.gri.ui.theme.GriPrimary

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MenuScreen(
    onCloseMenu: () -> Unit,
    onLogout: () -> Unit,
    onNavigate: (String) -> Unit = {},
    viewModel: MenuViewModel = viewModel()
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("University Navigation") },
                navigationIcon = {
                    IconButton(onClick = onCloseMenu) {
                        Icon(Icons.Default.Close, contentDescription = "Close Menu")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primary,
                    titleContentColor = MaterialTheme.colorScheme.onPrimary,
                    navigationIconContentColor = MaterialTheme.colorScheme.onPrimary
                )
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .background(MaterialTheme.colorScheme.background)
                .verticalScroll(rememberScrollState())
        ) {
            // Header Profile / Info Box
            Surface(
                color = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f),
                modifier = Modifier.fillMaxWidth()
            ) {
                Row(
                    modifier = Modifier.padding(20.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Surface(
                        shape = CircleShape,
                        color = GriPrimary,
                        modifier = Modifier.size(54.dp)
                    ) {
                        Box(contentAlignment = Alignment.Center) {
                            Icon(
                                imageVector = Icons.Default.AccountBalance,
                                contentDescription = null,
                                tint = Color.White,
                                modifier = Modifier.size(30.dp)
                            )
                        }
                    }
                    Spacer(modifier = Modifier.width(16.dp))
                    Column {
                        Text(
                            text = "The Gandhigram Rural Institute",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        Text(
                            text = "Gandhigram, Dindigul - 624302",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            // Main Menu List Sections
            MenuGroupHeader("INSTITUTIONAL")
            MenuItemRow(Icons.Default.Info, "About GRI", "Vision, Mission, History, Logo") { onNavigate("about") }
            MenuItemRow(Icons.Default.Gavel, "Governance", "Board of Management, Academic Council") { onNavigate("governance") }
            MenuItemRow(Icons.Default.AdminPanelSettings, "Administration", "Chancellor, Vice-Chancellor, Registrar") { onNavigate("contacts") }

            HorizontalDivider(modifier = Modifier.padding(vertical = 12.dp))

            MenuGroupHeader("ACADEMICS & ADMISSIONS")
            MenuItemRow(Icons.Default.School, "Schools & Departments", "Sciences, Social Sciences, Agriculture") { onNavigate("schools") }
            MenuItemRow(Icons.Default.AppRegistration, "Admissions 2026-27", "Prospectus, CUET, Ph.D Application") { onNavigate("admissions") }
            MenuItemRow(Icons.Default.Assignment, "Examinations", "Time Table, Results, e-SANAD") { onNavigate("portal") }
            MenuItemRow(Icons.Default.Science, "Research & Development", "RDC Cell, Projects, Publications") { onNavigate("facilities") }

            HorizontalDivider(modifier = Modifier.padding(vertical = 12.dp))

            MenuGroupHeader("FACILITIES & INFRASTRUCTURE")
            MenuItemRow(Icons.Default.LocalLibrary, "Central Library", "Books, E-Resources, Journals") { onNavigate("facilities") }
            MenuItemRow(Icons.Default.Hotel, "Hostel Facilities", "Men's, Women's, Working Women's Hostel") { onNavigate("facilities") }
            MenuItemRow(Icons.Default.MedicalServices, "Health Centre & Canteen", "Medical, Amenities, Bank") { onNavigate("facilities") }

            HorizontalDivider(modifier = Modifier.padding(vertical = 12.dp))

            MenuGroupHeader("SYSTEM & PORTAL")
            MenuItemRow(Icons.Default.Download, "Downloads & Circulars", "Forms, Handbooks, Notifications") { onNavigate("downloads") }
            MenuItemRow(Icons.Default.Settings, "Settings & Preferences", "Dark Theme, Language, Text Size") { onNavigate("settings") }
            MenuItemRow(Icons.Default.ExitToApp, "Logout", "Sign out of Student Portal", textColor = MaterialTheme.colorScheme.error) {
                onLogout()
            }

            Spacer(modifier = Modifier.height(24.dp))
        }
    }
}

@Composable
fun MenuGroupHeader(title: String) {
    Text(
        text = title,
        style = MaterialTheme.typography.labelMedium,
        color = MaterialTheme.colorScheme.primary,
        fontWeight = FontWeight.Bold,
        modifier = Modifier.padding(horizontal = 20.dp, vertical = 6.dp)
    )
}

@Composable
fun MenuItemRow(
    icon: ImageVector,
    title: String,
    subtitle: String,
    textColor: Color = MaterialTheme.colorScheme.onSurface,
    onClick: () -> Unit = {}
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable { onClick() }
            .padding(horizontal = 20.dp, vertical = 12.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = icon,
            contentDescription = title,
            tint = if (textColor == MaterialTheme.colorScheme.error) textColor else MaterialTheme.colorScheme.primary,
            modifier = Modifier.size(24.dp)
        )
        Spacer(modifier = Modifier.width(16.dp))
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MaterialTheme.typography.bodyLarge,
                fontWeight = FontWeight.SemiBold,
                color = textColor
            )
            Text(
                text = subtitle,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
        Icon(
            imageVector = Icons.Default.ChevronRight,
            contentDescription = null,
            tint = MaterialTheme.colorScheme.outline
        )
    }
}
