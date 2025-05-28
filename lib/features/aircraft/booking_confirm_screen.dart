import 'package:aero_lounge/features/auth/account_review/components/support_link.dart';
import 'package:aero_lounge/features/auth/login/components/dialogs.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingConfirmScreen extends StatelessWidget {
  const BookingConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: Stack(
        children: [
          BackGroundFiller(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacerHelper.verticalSpaceExtraLarge(),
                  SpacerHelper.verticalSpaceExtraLarge(),
                  SvgPicture.asset(Assets.assetsAircraftPaymentTickIcon),
                  SpacerHelper.verticalSpaceMedium(),
                  Text(
                    'Booking Confirmed!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: TColors.textSecondary,
                        ),
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  Text(
                    'Your aircraft rental has been\nsuccessfully scheduled',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: TColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: TColors.outlineButtonPrimary,
                      border: Border.all(
                        color: TColors.radioBackgroud,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flight Details',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: TColors.textSecondary,
                                  ),
                        ),
                        SpacerHelper.verticalSpaceSmall(),
                        SpacerHelper.verticalSpaceExtraSmall(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.assetsAircraftCalenderIcon,
                                  height: 24,
                                  width: 24,
                                ),
                                SpacerHelper.horizontalSpaceSmall(),
                                Text(
                                  'Date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: TColors.textSecondary,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              'March 15, 2025',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                          ],
                        ),
                        SpacerHelper.verticalSpaceMedium(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.assetsAircraftClockIcon,
                                  height: 22,
                                  width: 22,
                                ),
                                SpacerHelper.horizontalSpaceSmall(),
                                Text(
                                  'Time',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: TColors.textSecondary,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              '09:00 AM - 11:00 AM',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                          ],
                        ),
                        SpacerHelper.verticalSpaceMedium(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.assetsAircraftPlaneIcon,
                                  height: 20,
                                  width: 20,
                                ),
                                SpacerHelper.horizontalSpaceSmall(),
                                Text(
                                  'Aircraft',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: TColors.textSecondary,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              'Cessna 172',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                          ],
                        ),
                        SpacerHelper.verticalSpaceMedium(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SpacerHelper.horizontalSpaceExtraSmall(),
                                SvgPicture.asset(
                                  Assets.assetsAircraftDollarIcon,
                                  height: 24,
                                  width: 24,
                                ),
                                SpacerHelper.horizontalSpaceSmall(),
                                SpacerHelper.horizontalSpaceExtraSmall(),
                                Text(
                                  'Total Cost',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: TColors.textSecondary,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              '\$450.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: TColors.outlineButtonPrimary,
                      border: Border.all(
                        color: TColors.radioBackgroud,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Next Steps',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: TColors.textSecondary,
                                  ),
                        ),
                        SpacerHelper.verticalSpaceSmall(),
                        SpacerHelper.verticalSpaceExtraSmall(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.dispatchFormRoute);
                            },
                            child: Text('Fill Out Dispatch'),
                          ),
                        ),
                        SpacerHelper.verticalSpaceSmall(),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              AppDiaLogs.dispatchFormAlertDialog(context);
                            },
                            child: Text('Back to Home'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpacerHelper.verticalSpaceLarge(),
                  SupportLink()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
