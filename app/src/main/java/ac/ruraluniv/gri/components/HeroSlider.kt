@file:OptIn(ExperimentalFoundationApi::class)

package ac.ruraluniv.gri.components

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import ac.ruraluniv.gri.R

data class HeroSlide(
    val title: String,
    val subtitle: String,
    val imageRes: Int,
    val gradientColors: List<Color>
)

@Composable
fun HeroSlider(
    modifier: Modifier = Modifier
) {
    val slides = listOf(
        HeroSlide(
            title = "38th Convocation Ceremony",
            subtitle = "Degrees presented by Chancellor Dr. KM. Annamalai and Guest Sri. VVS Laxman",
            imageRes = R.drawable.hero_gallery_1,
            gradientColors = listOf(Color(0xEE911C03), Color(0xCC518214))
        ),
        HeroSlide(
            title = "Vice-Chancellor Address",
            subtitle = "38th Convocation Welcome Address at GRI - DTBU Gandhigram",
            imageRes = R.drawable.hero_gallery_2,
            gradientColors = listOf(Color(0xEE518214), Color(0xCC466C09))
        ),
        HeroSlide(
            title = "TRIVISTA '26 National Event",
            subtitle = "Organized jointly by Dept. of Computer Science and Centre for AI & Data Sciences",
            imageRes = R.drawable.hero_gallery_3,
            gradientColors = listOf(Color(0xEE3F4B56), Color(0xCC1E2630))
        )
    )

    val pagerState = rememberPagerState(pageCount = { slides.size })

    Column(modifier = modifier) {
        HorizontalPager(
            state = pagerState,
            modifier = Modifier
                .fillMaxWidth()
                .height(180.dp)
        ) { page ->
            val slide = slides[page]
            Card(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(horizontal = 4.dp),
                shape = RoundedCornerShape(18.dp),
                elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
            ) {
                Box(modifier = Modifier.fillMaxSize()) {
                    Image(
                        painter = painterResource(id = slide.imageRes),
                        contentDescription = slide.title,
                        contentScale = ContentScale.Crop,
                        modifier = Modifier.fillMaxSize()
                    )
                    Box(
                        modifier = Modifier
                            .fillMaxSize()
                            .background(
                                brush = Brush.verticalGradient(
                                    colors = listOf(
                                        Color.Transparent,
                                        Color.Black.copy(alpha = 0.85f)
                                    )
                                )
                            )
                            .padding(16.dp),
                        contentAlignment = Alignment.BottomStart
                    ) {
                        Column {
                            Text(
                                text = slide.title,
                                style = MaterialTheme.typography.titleMedium,
                                color = Color.White,
                                fontWeight = FontWeight.Bold
                            )
                            Spacer(modifier = Modifier.height(2.dp))
                            Text(
                                text = slide.subtitle,
                                style = MaterialTheme.typography.bodySmall,
                                color = Color.White.copy(alpha = 0.9f),
                                maxLines = 2
                            )
                        }
                    }
                }
            }
        }
        Spacer(modifier = Modifier.height(8.dp))
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.Center
        ) {
            repeat(slides.size) { index ->
                val color = if (pagerState.currentPage == index) {
                    MaterialTheme.colorScheme.primary
                } else {
                    MaterialTheme.colorScheme.outlineVariant
                }
                Box(
                    modifier = Modifier
                        .padding(3.dp)
                        .clip(CircleShape)
                        .background(color)
                        .size(if (pagerState.currentPage == index) 10.dp else 7.dp)
                )
            }
        }
    }
}
