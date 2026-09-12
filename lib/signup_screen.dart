import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/app_button.dart';
import 'core/widgets/app_text_field.dart';
import 'core/widgets/carrot_icon.dart';
import 'main_nav_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController =
      TextEditingController(text: 'Afsar Hossen Shuvo');
  final TextEditingController _emailController =
      TextEditingController(text: 'imshuvo97@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: '••••••••');
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signup() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainNavScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Center brand carrot logo
              const Center(
                child: CarrotIcon(size: 48),
              ),
              const SizedBox(height: 40),

              // Heading
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your credentials to continue',
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 32),

              // Username input
              AppTextField(
                label: 'Username',
                controller: _usernameController,
              ),
              const SizedBox(height: 24),

              // Email input with green checkmark
              AppTextField(
                label: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: const Icon(
                  Icons.check,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(height: 24),

              // Password input
              AppTextField(
                label: 'Password',
                controller: _passwordController,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.secondaryText,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Terms & conditions disclaimer
              RichText(
                text: const TextSpan(
                  text: 'By continuing you agree to our ',
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: 14,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Sign Up button
              AppButton(
                text: 'Sign Up',
                onPressed: _signup,
              ),
              const SizedBox(height: 24),

              // Switch to Sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: AppColors.darkText,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
