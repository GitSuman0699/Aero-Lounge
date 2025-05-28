import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ConfirmDetailsScreen extends StatefulWidget {
  const ConfirmDetailsScreen({super.key});

  @override
  State<ConfirmDetailsScreen> createState() => _ConfirmDetailsScreenState();
}

class _ConfirmDetailsScreenState extends State<ConfirmDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: TColors.lightGrey,
        height: 74,
        elevation: 5,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total (per hour)',
                      style: TextTheme.of(context).labelLarge?.copyWith(
                            color: TColors.darkGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                    ),
                    SpacerHelper.verticalSpaceExtraSmall(),
                    Text(
                      '\$335',
                      style: TextTheme.of(context).titleLarge?.copyWith(
                            color: TColors.textSecondary,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                    )
                  ],
                ),
              ),
            ),
            SpacerHelper.horizontalSpaceSmall(),
            Expanded(
              flex: 4,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.paymentRoute);
                },
                child: Text('Continue to Payment'),
              ),
            ),
          ],
        ),
      ),
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
        title: Text('Confirm Details & Pricing'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            BackGroundFiller(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacerHelper.verticalSpaceMedium(),
                  Text(
                    'STEP 2 OF 3',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: TColors.textSecondary,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: TColors.lightContainer,
                              border: Border.all(
                                color: TColors.radioBackgroud,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Aircraft Details',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: TColors.textSecondary,
                                      ),
                                ),
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Model',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      'Cessna 172N',
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
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tail Number',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      'N172AB',
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
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Capacity',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      '4 seats',
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
                                SpacerHelper.verticalSpaceSmall(),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: TColors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Owner Conditions:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: TColors.textSecondary,
                                              fontSize: 13,
                                            ),
                                      ),
                                      SpacerHelper.verticalSpaceSmall(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '• No grass strips',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: TColors.textSecondary,
                                                fontSize: 13,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '• Day VFR only',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: TColors.textSecondary,
                                                fontSize: 13,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: TColors.lightContainer,
                              border: Border.all(
                                color: TColors.radioBackgroud,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price Breakdown',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: TColors.textSecondary,
                                      ),
                                ),
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Base Rate (per hour)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      '\$233.50',
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
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Loyalty Discount',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      '-\$16.50',
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
                                SpacerHelper.verticalSpaceSmall(),
                                Divider(),
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      '\$250/hr',
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
                          SpacerHelper.verticalSpaceLarge(),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: TColors.lightContainer,
                              border: Border.all(
                                color: TColors.radioBackgroud,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Estimated Costs',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: TColors.textSecondary,
                                      ),
                                ),
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Fuel (per hour)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      '\$45.00',
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
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Maintenance',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      '\$25.00',
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
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      Assets.assetsCreateAccountInformationIcon,
                                      height: 20,
                                      colorFilter: const ColorFilter.mode(
                                        TColors.textPrimary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    SpacerHelper.horizontalSpaceSmall(),
                                    Text(
                                      'View cost breakdown',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                            fontSize: 12.5,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: TColors.lightContainer,
                              border: Border.all(
                                color: TColors.radioBackgroud,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Platform Fee',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      '\$15.00',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: TColors.lightContainer,
                              border: Border.all(
                                color: TColors.radioBackgroud,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Policies',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: TColors.textSecondary,
                                      ),
                                ),
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.assetsAircraftBackClockIcon,
                                      height: 24,
                                      width: 24,
                                    ),
                                    SpacerHelper.horizontalSpaceMedium(),
                                    Expanded(
                                      child: Text(
                                        '24-hour cancellation policy. 50% charge for cancellations within 24 hours.',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: TColors.textSecondary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                SpacerHelper.verticalSpaceSmall(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      Assets.assetsAircraftRescheduleIcon,
                                      height: 25,
                                      width: 25,
                                    ),
                                    SpacerHelper.horizontalSpaceMedium(),
                                    Expanded(
                                      child: Text(
                                        'Rescheduling must be done 12 hours before scheduled time.',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: TColors.textSecondary,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
