package ac.ruraluniv.gri.ui.register

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.lifecycle.viewmodel.compose.viewModel
import ac.ruraluniv.gri.components.CustomOutlinedTextField

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RegisterScreen(
    onRegisterSuccess: () -> Unit,
    onNavigateToLogin: () -> Unit,
    viewModel: RegisterViewModel = viewModel()
) {
    val fullName by viewModel.fullName.collectAsState()
    val regNumber by viewModel.regNumber.collectAsState()
    val department by viewModel.department.collectAsState()
    val programme by viewModel.programme.collectAsState()
    val email by viewModel.email.collectAsState()
    val mobile by viewModel.mobile.collectAsState()
    val password by viewModel.password.collectAsState()
    val confirmPassword by viewModel.confirmPassword.collectAsState()
    val errorMsg by viewModel.errorMsg.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Student Registration") },
                navigationIcon = {
                    IconButton(onClick = onNavigateToLogin) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
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
                .padding(20.dp)
                .verticalScroll(rememberScrollState()),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = "Create Portal Account",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.primary
            )
            Text(
                text = "Enter details as registered in University Records",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(20.dp))

            CustomOutlinedTextField(
                value = fullName,
                onValueChange = { viewModel.fullName.value = it },
                label = "Full Name",
                leadingIcon = { Icon(Icons.Default.Person, contentDescription = null) }
            )

            Spacer(modifier = Modifier.height(12.dp))

            CustomOutlinedTextField(
                value = regNumber,
                onValueChange = { viewModel.regNumber.value = it },
                label = "Register Number (e.g. 2026101001)",
                leadingIcon = { Icon(Icons.Default.Badge, contentDescription = null) }
            )

            Spacer(modifier = Modifier.height(12.dp))

            CustomOutlinedTextField(
                value = department,
                onValueChange = { viewModel.department.value = it },
                label = "Department",
                leadingIcon = { Icon(Icons.Default.Apartment, contentDescription = null) }
            )

            Spacer(modifier = Modifier.height(12.dp))

            CustomOutlinedTextField(
                value = programme,
                onValueChange = { viewModel.programme.value = it },
                label = "Programme (e.g. M.Sc. Computer Science)",
                leadingIcon = { Icon(Icons.Default.School, contentDescription = null) }
            )

            Spacer(modifier = Modifier.height(12.dp))

            CustomOutlinedTextField(
                value = email,
                onValueChange = { viewModel.email.value = it },
                label = "Email Address",
                leadingIcon = { Icon(Icons.Default.Email, contentDescription = null) },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Email)
            )

            Spacer(modifier = Modifier.height(12.dp))

            CustomOutlinedTextField(
                value = mobile,
                onValueChange = { viewModel.mobile.value = it },
                label = "Mobile Number",
                leadingIcon = { Icon(Icons.Default.Phone, contentDescription = null) },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Phone)
            )

            Spacer(modifier = Modifier.height(12.dp))

            CustomOutlinedTextField(
                value = password,
                onValueChange = { viewModel.password.value = it },
                label = "Password",
                leadingIcon = { Icon(Icons.Default.Lock, contentDescription = null) },
                visualTransformation = PasswordVisualTransformation(),
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password)
            )

            Spacer(modifier = Modifier.height(12.dp))

            CustomOutlinedTextField(
                value = confirmPassword,
                onValueChange = { viewModel.confirmPassword.value = it },
                label = "Confirm Password",
                leadingIcon = { Icon(Icons.Default.Lock, contentDescription = null) },
                visualTransformation = PasswordVisualTransformation(),
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password)
            )

            if (errorMsg != null) {
                Spacer(modifier = Modifier.height(12.dp))
                Text(
                    text = errorMsg!!,
                    color = MaterialTheme.colorScheme.error,
                    style = MaterialTheme.typography.bodyMedium
                )
            }

            Spacer(modifier = Modifier.height(24.dp))

            Button(
                onClick = {
                    if (viewModel.validateAndRegister()) {
                        onRegisterSuccess()
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(50.dp),
                shape = RoundedCornerShape(12.dp),
                colors = ButtonDefaults.buttonColors(containerColor = MaterialTheme.colorScheme.primary)
            ) {
                Text("REGISTER ACCOUNT", fontSize = 16.sp, fontWeight = FontWeight.Bold)
            }

            Spacer(modifier = Modifier.height(16.dp))

            Row(verticalAlignment = Alignment.CenterVertically) {
                Text("Already have an account? ")
                Text(
                    text = "Login",
                    color = MaterialTheme.colorScheme.primary,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.clickable { onNavigateToLogin() }
                )
            }
        }
    }
}
