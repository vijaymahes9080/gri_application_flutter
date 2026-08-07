package ac.ruraluniv.gri.ui.theme

import android.app.Activity
import android.os.Build
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.SideEffect
import androidx.compose.ui.graphics.toArgb
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalView
import androidx.core.view.WindowCompat

private val LightColorScheme = lightColorScheme(
    primary = GriPrimary,
    onPrimary = GriOnPrimary,
    primaryContainer = GriPrimaryVariant,
    secondary = GriSecondary,
    onSecondary = GriOnSecondary,
    tertiary = GriAccent,
    background = GriBackgroundLight,
    surface = GriSurfaceLight,
    onBackground = GriOnSurfaceLight,
    onSurface = GriOnSurfaceLight,
    error = GriError
)

private val DarkColorScheme = darkColorScheme(
    primary = GriAccent,
    onPrimary = GriOnPrimary,
    primaryContainer = GriPrimary,
    secondary = GriSecondary,
    onSecondary = GriOnSecondary,
    tertiary = GriAccentLight,
    background = GriBackgroundDark,
    surface = GriSurfaceDark,
    onBackground = GriOnSurfaceDark,
    onSurface = GriOnSurfaceDark,
    error = GriError
)

@Composable
fun GriTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    dynamicColor: Boolean = true,
    content: @Composable () -> Unit
) {
    val colorScheme = when {
        dynamicColor && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> {
            val context = LocalContext.current
            if (darkTheme) dynamicDarkColorScheme(context) else dynamicLightColorScheme(context)
        }
        darkTheme -> DarkColorScheme
        else -> LightColorScheme
    }

    val view = LocalView.current
    if (!view.isInEditMode) {
        SideEffect {
            val window = (view.context as Activity).window
            window.statusBarColor = colorScheme.primary.toArgb()
            WindowCompat.getInsetsController(window, view).isAppearanceLightStatusBars = !darkTheme
        }
    }

    MaterialTheme(
        colorScheme = colorScheme,
        typography = GriTypography,
        shapes = GriShapes,
        content = content
    )
}
