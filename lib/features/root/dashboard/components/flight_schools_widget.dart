import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:aero_lounge/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FlightSchoolsWidget extends StatelessWidget {
  const FlightSchoolsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TColors.lightContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Assets.assetsDashboardTwinPlaneImage,
                height: 64,
                width: 64,
              ),
              SpacerHelper.horizontalSpaceMedium(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SkyWings Academy",
                    style: TextTheme.of(context).bodyLarge?.copyWith(
                          color: TColors.textPrimary,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.assetsDashboardRatingStarIcon,
                        height: 14,
                        width: 14,
                      ),
                      SpacerHelper.horizontalSpaceExtraSmall(),
                      Text(
                        "4.8/5 (32 pilots)",
                        style: TextTheme.of(context).bodySmall?.copyWith(
                              color: TColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  SpacerHelper.verticalSpaceExtraSmall(),
                  Text(
                    "Flight School",
                    style: TextTheme.of(context).bodySmall?.copyWith(
                          color: TColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraSmall(),
                ],
              )
            ],
          ),
          SpacerHelper.verticalSpaceMedium(),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: TElevatedButtonTheme.lightElevatedButtonTheme.style
                      ?.copyWith(
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
                    Get.toNamed(AppRoutes.flightSchoolDetailRoute);
                  },
                  child: Text("Open"),
                ),
              ),
              SpacerHelper.horizontalSpaceMedium(),
              Expanded(
                child: OutlinedButton(
                  style: TOutlinedButtonTheme.lightOutlinedButtonTheme.style
                      ?.copyWith(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    backgroundColor: WidgetStateProperty.all(TColors.white),
                    textStyle: WidgetStatePropertyAll(
                      TTextTheme.lightTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Message"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
