import 'package:aero_lounge/features/subscription_and_payment/subscription_plan_controller.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          plan['plan']!,
          style: TextTheme.of(context).titleMedium!.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
                color: TColors.textSecondary,
                fontSize: 18,
              ),
        ),
        Obx(
          () => Text.rich(
            TextSpan(
              text: controller.selectedSubscription.value == 'Monthly'
                  ? '${plan['price']['monthly']}/'
                  : controller.selectedSubscription.value == 'Quarterly'
                      ? '${plan['price']['quarterly']}/'
                      : '${plan['price']['yearly']}/',
              style: TextTheme.of(context).titleLarge!.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                    color: TColors.textSecondary,
                  ),
              children: [
                TextSpan(
                  text: controller.selectedSubscription.value == 'Monthly'
                      ? 'mo'
                      : controller.selectedSubscription.value == 'Quarterly'
                          ? 'qu'
                          : 'yr',
                  style: TextTheme.of(context).titleMedium!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
