import 'package:aero_lounge/features/auth/login/components/dialogs.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonRowWidget extends StatelessWidget {
  const ButtonRowWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style:
                TElevatedButtonTheme.lightElevatedButtonTheme.style?.copyWith(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              backgroundColor: WidgetStatePropertyAll(
                data['actions'][0] == 'Cancel'
                    ? TColors.buttonRed
                    : TColors.borderPrimary,
              ),
              textStyle: WidgetStatePropertyAll(
                TTextTheme.lightTextTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                  fontSize: 15,
                ),
              ),
            ),
            onPressed: () {
              if (data['actions'][0] == 'Cancel') {
                AppDiaLogs.cancelFlightBottomSheet(context, data);
              }

              if (data['actions'][0] == 'Add a review') {
                Get.toNamed(AppRoutes.flightReviewRoute);
              }
            },
            child: Text(data['actions'][0]),
          ),
        ),
        SpacerHelper.horizontalSpaceSmall(),
        Expanded(
          child: ElevatedButton(
            style:
                TElevatedButtonTheme.lightElevatedButtonTheme.style?.copyWith(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              textStyle: WidgetStatePropertyAll(
                TTextTheme.lightTextTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                  fontSize: 15,
                ),
              ),
            ),
            onPressed: () {
              if (data['actions'][1] == 'Check In') {
                Get.toNamed(AppRoutes.flightCheckInRoute);
              }

              if (data['actions'][1] == 'Check Out') {
                Get.toNamed(AppRoutes.flightCheckOutRoute);
              }

              if (data['actions'][1] == 'Fill Dispatch') {
                Get.toNamed(AppRoutes.dispatchFormRoute);
              }
            },
            child: Text(data['actions'][1]),
          ),
        ),
      ],
    );
  }
}
