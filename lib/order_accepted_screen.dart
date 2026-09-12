import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/app_button.dart';

class OrderAcceptedScreen extends StatelessWidget {
  const OrderAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // Circular Green Success Icon
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 58,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Title
              const Text(
                'Your Order has been\naccepted',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 16),

              // Subtitle
              const Text(
                'Your items has been placed and is on\nit’s way to being processed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const Spacer(),

              // Track Order button
              AppButton(
                text: 'Track Order',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 12),

              // Back to home
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Back to home',
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
