import 'package:aero_lounge/features/auth/account_review/components/status_widget.dart';
import 'package:aero_lounge/features/auth/account_review/components/support_link.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountReviewScreen extends StatelessWidget {
  const AccountReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: Stack(
        children: [
          BackGroundFiller(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacerHelper.verticalSpaceMedium(),
                  BackButtonWidget(),
                  SpacerHelper.verticalSpaceMedium(),
                  SpacerHelper.verticalSpaceSmall(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your account is under review',
                            style: TextTheme.of(context).titleLarge!.copyWith(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                  color: TColors.textSecondary,
                                ),
                          ),
                          SpacerHelper.verticalSpaceMedium(),
                          Text(
                            "We're currently reviewing your submitted information. This usually takes 24-48 hours.",
                            style: TTextFormFieldTheme.formTextStyle
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          StatusWidget(
                            containerColor: TColors.containerLightBlue,
                            borderColor: TColors.borderblue,
                            iconPath: Assets.assetsCreateAccountInformationIcon,
                            title: 'Verification Status',
                            subTitle: 'Submitted on Jan 15, 2025',
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          StatusWidget(
                            containerColor: TColors.containerLightRed,
                            borderColor: TColors.borderRed,
                            iconPath: Assets.assetsCreateAccountWarningIcon,
                            title: 'Rejected - please update details',
                            subTitle:
                                'Please review and update your submission',
                          ),
                          SpacerHelper.verticalSpaceExtraLarge(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.subscriptionPlanRoute);
                              },
                              child: Text("Back to Dashboard"),
                            ),
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Text("Edit and Resubmit"),
                            ),
                          ),
                          SpacerHelper.verticalSpaceExtraLarge(),
                          SupportLink(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
