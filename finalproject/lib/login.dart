import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers store what the user types into each text field.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Frees memory when leaving the page.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Handles the Log In button.
  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Check if any fields are empty.
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all fields."),
        ),
      );
      return;
    }

    // Navigate to the Home Page.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(
          userName: emailController.text.contains('@') 
              ? emailController.text.split('@').first 
              : emailController.text,
          email: emailController.text,
        ),
      ),
    );
  }

  // Opens the Sign Up page.
  void goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SignUpPage(),
      ),
    );
  }

  // Creates the rounded text field used throughout the page.
  Widget buildTextField(
    TextEditingController controller,
    String hint, {
    bool obscure = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 22),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),

        // Soft shadow around the text field.
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: TextField(
        controller: controller,
        obscureText: obscure,

        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
          border: InputBorder.none,

          // Padding inside the text field.
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // Builds the Login screen.
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),

          child: Column(
            children: [

              // Displays the PeakPulse logo.
              Image.asset(
                "assets/logo.png", // Change to your logo path.
                height: 130,
              ),

              const SizedBox(height: 10),

              // App title.
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 45),

              // Email input.
              buildTextField(
                emailController,
                "Email",
              ),

              // Password input.
              buildTextField(
                passwordController,
                "Password",
                obscure: true,
              ),

              const SizedBox(height: 35),

              // Log In button.
              SizedBox(
                width: 280,
                height: 55,
                child: ElevatedButton(
                  onPressed: login,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Forgot Password link.
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Forgot Password feature coming soon!",
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Link to the Sign Up page.
              TextButton(
                onPressed: goToSignUp,
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}