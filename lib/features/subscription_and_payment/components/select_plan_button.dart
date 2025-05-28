import 'package:aero_lounge/features/subscription_and_payment/subscription_plan_controller.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:aero_lounge/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:flutter/material.dart';

class SelectPlanButton extends StatelessWidget {
  const SelectPlanButton({
    super.key,
    required this.plan,
    required this.controller,
    required this.index,
  });

  final Map<String, dynamic> plan;
  final SubscriptionPlanController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: controller.selectedPlan.value == index
          ? ElevatedButton(
              onPressed: () {},
              style:
                  TElevatedButtonTheme.lightElevatedButtonTheme.style?.copyWith(
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
              ),
              child: Text(
                'Select ${plan['plan']}',
                style: TextTheme.of(context).bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: TColors.textWhite,
                    ),
              ),
            )
          : OutlinedButton(
              onPressed: () {
                controller.selectedPlan.value = index;
              },
              style:
                  TOutlinedButtonTheme.lightOutlinedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStateProperty.all(
                  TColors.lightContainer,
                ),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
              ),
              child: Text(
                'Select ${plan['plan']}',
                style: TextTheme.of(context).bodyMedium!.copyWith(
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                      color: TColors.textPrimary,
                    ),
              ),
            ),
    );
  }
}
