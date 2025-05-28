import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AddFlightLogButton extends StatelessWidget {
  const AddFlightLogButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: TElevatedButtonTheme.lightElevatedButtonTheme.style?.copyWith(
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
          Get.toNamed(AppRoutes.addFlightLogRoute);
        },
        child: Text(
          'Add New Flight Log',
        ),
      ),
    );
  }
}
