# The Gandhigram Rural Institute (GRI) — Official Flutter Mobile Application

A production-ready cross-platform mobile application for **The Gandhigram Rural Institute (Deemed to be University)**, built with **Flutter**, **Material Design 3**, **MVVM Architecture**, and **Clean Architecture**.

---

## 🏛️ University Overview

- **Name**: The Gandhigram Rural Institute (Deemed to be University)
- **Accreditation**: NAAC A Grade (3rd Cycle)
- **Location**: Gandhigram, Dindigul District, Tamil Nadu, India - 624302
- **Leadership**:
  - **Chancellor**: Dr. KM. Annamalai
  - **Vice-Chancellor**: Dr. N. Panchanatham
  - **Registrar i/c**: Dr. M. Sundaramari
- **Official Portals**:
  - **Main Website**: [ruraluniv.ac.in](https://ruraluniv.ac.in/)
  - **Samarth Portal**: [ruraluniv.samarth.ac.in](https://ruraluniv.samarth.ac.in/)
  - **e-SANAD Verification**: [portal.ruraluniv.ac.in/esanad](https://www.portal.ruraluniv.ac.in/esanad)

---

## 🎨 Material Design 3 Palette

- **Primary (Gandhian Green)**: `#518214` (`Color(0xFF518214)`)
- **Secondary (Deep Maroon)**: `#911C03` (`Color(0xFF911C03)`)
- **Accent (Terracotta / Orange)**: `#F26B0F` (`Color(0xFFF26B0F)`)
- **Dark Slate Accent**: `#3F4B56` (`Color(0xFF3F4B56)`)
- **Light Surface**: `#FDFBF7` | **Dark Surface**: `#121417`

---

## 📁 Clean Architecture Folder Structure

```
lib/
├── core/
│   ├── config/          # Application environment configuration
│   ├── constants/       # AppColors, AppTypography, AppConstants
│   ├── theme/           # AppTheme (MD3 Light/Dark), ThemeProvider
│   └── utils/           # AssetLoader JSON parser
├── models/              # NewsItem, EventItem, School, Department, UserProfile
├── repositories/        # ContentRepository, AuthRepository
├── providers/           # HomeProvider, AuthProvider
├── routes/              # AppRouter (GoRouter declarative routes)
├── widgets/             # GriAppBar, GriDrawer, HeroCarousel, QuickActionCard, NewsCard, EventCard, GriFooter
└── screens/             # SplashScreen, HomeScreen, SchoolsScreen, DepartmentsScreen, AdmissionsScreen, StudentPortalScreen, DownloadsScreen, LoginScreen, RegisterScreen, ProfileScreen
```

---

## 🚀 Key Features

1. **Website-to-Flutter Fidelity**: Matches the branding, typography, color scheme, and content layout of the official university website.
2. **Offline-First JSON Database**: Local JSON assets in `assets/json/` containing authentic university data (announcements, schools, departments, prospectus, events, and downloads).
3. **Material Design 3 Theme System**: Full Light and Dark Mode support with dynamic text zoom accessibility (A+, A, A-) built into the App Bar.
4. **State Management & Routing**: Provider pattern for state distribution and `GoRouter` for deep-linked declarative navigation.
5. **Student & Faculty Services**: Access to Samarth@GRI portal, attendance tracking, Ph.D. research tracking, transcript applications, and e-SANAD verification.

---

## 🛠️ Getting Started

### Prerequisites
- Flutter SDK `^3.12.2` or later
- Dart SDK `^3.12.2`

### Run Locally
```bash
# Clone the repository
git clone https://github.com/vijaymahes9080/gri_application_flutter.git

# Install dependencies
flutter pub get

# Run on connected device or emulator
flutter run
```

### Run Tests
```bash
flutter analyze
flutter test
```
