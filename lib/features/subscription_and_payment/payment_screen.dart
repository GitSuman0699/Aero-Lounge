import 'package:aero_lounge/features/subscription_and_payment/subscription_plan_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
        title: Text('Payment'),
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
                    'STEP 3 OF 3',
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
                                  'Payment Method',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: TColors.textSecondary,
                                      ),
                                ),
                                SpacerHelper.verticalSpaceSmall(),
                                SpacerHelper.verticalSpaceExtraSmall(),
                                Container(
                                  padding: EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: TColors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          GetBuilder<
                                              SubscriptionPlanController>(
                                            init: SubscriptionPlanController(),
                                            builder: (controller) {
                                              return Obx(
                                                () => Radio(
                                                  activeColor:
                                                      TColors.textPrimary,
                                                  value: 1,
                                                  groupValue: controller
                                                      .selectedPaymentMethod
                                                      .value,
                                                  onChanged: (value) {
                                                    controller
                                                        .selectedPaymentMethod
                                                        .value = value!;
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                          SvgPicture.asset(
                                            Assets.assetsAircraftVisaCardIcon,
                                            height: 21,
                                            width: 21,
                                          ),
                                          SpacerHelper.horizontalSpaceSmall(),
                                          Text(
                                            '••••4589',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w900,
                                                  color: TColors.textSecondary,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Expires 08/25',
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
                                ),
                                SpacerHelper.verticalSpaceSmall(),
                                SpacerHelper.verticalSpaceExtraSmall(),
                                Container(
                                  padding: EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: TColors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      GetBuilder<SubscriptionPlanController>(
                                        init: SubscriptionPlanController(),
                                        builder: (controller) {
                                          return Obx(
                                            () => Radio(
                                              activeColor: TColors.textPrimary,
                                              value: 2,
                                              groupValue: controller
                                                  .selectedPaymentMethod.value,
                                              onChanged: (value) {
                                                controller.selectedPaymentMethod
                                                    .value = value!;
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      SvgPicture.asset(
                                        Assets.assetsAircraftCardIcon,
                                        height: 21,
                                        width: 21,
                                      ),
                                      SpacerHelper.horizontalSpaceSmall(),
                                      Text(
                                        'Add new card',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: TColors.textSecondary,
                                            ),
                                      ),
                                    ],
                                  ),
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
                                  'Split Payment',
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
                                  children: [
                                    GetBuilder<SubscriptionPlanController>(
                                      init: SubscriptionPlanController(),
                                      builder: (controller) {
                                        return Obx(
                                          () => Checkbox(
                                            activeColor: TColors.textPrimary,
                                            value:
                                                controller.isPaymentSplit.value,
                                            onChanged: (value) {
                                              controller.isPaymentSplit.value =
                                                  value!;
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    Text(
                                      '50% now, 50% after flight',
                                      style: TextTheme.of(context)
                                          .bodyMedium
                                          ?.copyWith(
                                            color: TColors.textSecondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 48.0),
                                  child: Text(
                                    'Save \$2,450',
                                    style: TextTheme.of(context)
                                        .labelMedium
                                        ?.copyWith(
                                          color: TColors.textSecondary,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                        ),
                                  ),
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
                                  'Payment Summary',
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
                                      'Hourly Rate',
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
                                      '\$45',
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
                                      'Maintenance fee',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      '\$25',
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
                                      'Platform Fee',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                    Text(
                                      '\$15',
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
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed(
                                    AppRoutes.aircraftBookingConfirmationRoute);
                              },
                              child: Text(
                                'Pay & Reserve',
                              ),
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
