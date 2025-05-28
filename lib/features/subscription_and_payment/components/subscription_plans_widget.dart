import 'package:aero_lounge/features/subscription_and_payment/components/heading_widget.dart';
import 'package:aero_lounge/features/subscription_and_payment/components/select_plan_button.dart';
import 'package:aero_lounge/features/subscription_and_payment/subscription_plan_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SubscriptionPlansWidget extends StatelessWidget {
  const SubscriptionPlansWidget({
    super.key,
    required this.pricingPlans,
  });

  final List<Map<String, dynamic>> pricingPlans;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: pricingPlans.length,
      itemBuilder: (context, index) {
        final plan = pricingPlans[index];
        return GetBuilder<SubscriptionPlanController>(
          init: SubscriptionPlanController(),
          builder: (controller) {
            return Obx(
              () => InkWell(
                onTap: () {
                  controller.selectedPlan.value = index;
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: TColors.lightContainer,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: controller.selectedPlan.value == index
                          ? TColors.textPrimary
                          : TColors.radioBackgroud,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingWidget(
                        plan: plan,
                        controller: controller,
                        index: index,
                      ),
                      SpacerHelper.verticalSpace(2),
                      Text(
                        '${plan['description']}',
                        style: TextTheme.of(context).bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: TColors.textSecondary,
                              fontSize: 12.5,
                            ),
                      ),
                      SpacerHelper.verticalSpaceMedium(),
                      for (int i = 0; i < plan['features'].length; i++) ...[
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.assetsSubscriptionTickIcon,
                              width: 20,
                              height: 20,
                            ),
                            SpacerHelper.horizontalSpaceSmall(),
                            Text(
                              plan['features'][i],
                              style: TextTheme.of(context).bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                    color: TColors.textSecondary,
                                    fontSize: 13,
                                  ),
                            ),
                          ],
                        ),
                        SpacerHelper.verticalSpaceSmall(),
                      ],
                      SpacerHelper.verticalSpaceMedium(),
                      SelectPlanButton(
                        plan: plan,
                        controller: controller,
                        index: index,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SpacerHelper.verticalSpaceMedium();
      },
    );
  }
}
