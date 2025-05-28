import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            Assets.assetsCreateAccountBackIcon,
            height: 25,
            width: 25,
          ),
        ),
        centerTitle: true,
        title: Text('Subscription'),
      ),
      body: Stack(
        children: [
          BackGroundFiller(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacerHelper.verticalSpaceLarge(),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: TColors.lightContainer,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: TColors.radioBackgroud),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pro Plan",
                                style:
                                    TextTheme.of(context).bodyLarge?.copyWith(
                                          color: TColors.textSecondary,
                                          fontWeight: FontWeight.w900,
                                        ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: TColors.textPrimary,
                                ),
                                child: Center(
                                  child: Text(
                                    '\$29/mo',
                                    style: TextTheme.of(context)
                                        .bodyMedium
                                        ?.copyWith(
                                          color: TColors.white,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SpacerHelper.verticalSpaceSmall(),
                          Container(
                            width: 75,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: TColors.buttonGreen,
                            ),
                            child: Center(
                              child: Text(
                                'Active',
                                style:
                                    TextTheme.of(context).bodyMedium?.copyWith(
                                          color: TColors.white,
                                          fontWeight: FontWeight.w900,
                                        ),
                              ),
                            ),
                          ),
                          SpacerHelper.verticalSpaceMedium(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Renewal Date',
                                  textAlign: TextAlign.start,
                                  style: TextTheme.of(context)
                                      .bodyMedium
                                      ?.copyWith(
                                        color: TColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'March 15, 2025',
                                  textAlign: TextAlign.end,
                                  style: TextTheme.of(context)
                                      .bodyMedium
                                      ?.copyWith(
                                        color: TColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SpacerHelper.verticalSpaceSmall(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Billing Cycle',
                                  textAlign: TextAlign.start,
                                  style: TextTheme.of(context)
                                      .bodyMedium
                                      ?.copyWith(
                                        color: TColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Monthly',
                                  textAlign: TextAlign.end,
                                  style: TextTheme.of(context)
                                      .bodyMedium
                                      ?.copyWith(
                                        color: TColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: TColors.lightContainer,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: TColors.radioBackgroud),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Plan Features",
                            style: TextTheme.of(context).bodyLarge?.copyWith(
                                  color: TColors.textSecondary,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          SpacerHelper.verticalSpaceMedium(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.assetsSubscriptionTickIcon,
                              ),
                              SpacerHelper.horizontalSpaceSmall(),
                              Expanded(
                                child: Text(
                                  'Unlimited projects',
                                  style: TextTheme.of(context)
                                      .bodyMedium
                                      ?.copyWith(
                                        color: TColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SpacerHelper.verticalSpaceSmall(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.assetsSubscriptionTickIcon,
                              ),
                              SpacerHelper.horizontalSpaceSmall(),
                              Expanded(
                                child: Text(
                                  '5TB storage',
                                  style: TextTheme.of(context)
                                      .bodyMedium
                                      ?.copyWith(
                                        color: TColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SpacerHelper.verticalSpaceSmall(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.assetsSubscriptionTickIcon,
                              ),
                              SpacerHelper.horizontalSpaceSmall(),
                              Expanded(
                                child: Text(
                                  'Priority support',
                                  style: TextTheme.of(context)
                                      .bodyMedium
                                      ?.copyWith(
                                        color: TColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SpacerHelper.verticalSpaceSmall(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.assetsSubscriptionTickIcon,
                              ),
                              SpacerHelper.horizontalSpaceSmall(),
                              Expanded(
                                child: Text(
                                  'Advanced analytics',
                                  style: TextTheme.of(context)
                                      .bodyMedium
                                      ?.copyWith(
                                        color: TColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: TColors.lightContainer,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: TColors.radioBackgroud),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Payment Method",
                            style: TextTheme.of(context).bodyLarge?.copyWith(
                                  color: TColors.textSecondary,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          SpacerHelper.verticalSpaceMedium(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: TColors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                    Assets.assetsAircraftVisaCardIcon),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•••• •••• •••• 1234',
                                      style: TextTheme.of(context)
                                          .bodyMedium
                                          ?.copyWith(
                                            color: TColors.textSecondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      'Expires 08/25',
                                      style: TextTheme.of(context)
                                          .bodySmall
                                          ?.copyWith(
                                            color: TColors.textSecondary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Change',
                                    style: TextTheme.of(context)
                                        .bodyMedium
                                        ?.copyWith(
                                          color: TColors.borderPrimary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpacerHelper.verticalSpaceLarge(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.subscriptionPlanRoute);
                        },
                        child: Text('Change Plan'),
                      ),
                    ),
                    SpacerHelper.verticalSpace(10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text('Update Payment Method'),
                      ),
                    ),
                    SpacerHelper.verticalSpace(10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text('View Billing History'),
                      ),
                    ),
                    SpacerHelper.verticalSpaceLarge(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
