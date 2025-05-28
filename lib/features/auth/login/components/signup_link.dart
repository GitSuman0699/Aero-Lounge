import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupLink extends StatelessWidget {
  const SignupLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: TextTheme.of(context).titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: TColors.black,
                letterSpacing: 0.5),
            children: [
              TextSpan(
                text: "Sign Up",
                style: TextTheme.of(context).titleSmall!.copyWith(
                      fontWeight: FontWeight.w900,
                      color: TColors.textPrimary,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(AppRoutes.signUpRoute);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
