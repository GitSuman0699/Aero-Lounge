import 'package:aero_lounge/features/splash/splash_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.asset(
                  Assets.assetsSplashSplashCloudImage,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),

              // Logo
              Positioned(
                top: 250,
                left: 20,
                right: 20,
                child: Image.asset(
                  Assets.assetsSplashSplashLogo,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.19,
                ),
              ),

              // Get Started button
              Positioned(
                bottom: 250,
                left: 30,
                right: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.onboardingRoute);
                  },
                  child: Text(
                    'Get Started',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
