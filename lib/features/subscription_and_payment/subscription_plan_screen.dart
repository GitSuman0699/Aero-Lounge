import 'package:aero_lounge/features/subscription_and_payment/components/subscription_plans_widget.dart';
import 'package:aero_lounge/features/subscription_and_payment/subscription_plan_controller.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  final List<Map<String, dynamic>> pricingPlans = [
    {
      'plan': 'Free Plan',
      'price': {
        'monthly': '\$0',
        'quarterly': '\$0',
        'yearly': '\$0',
      },
      'description': 'Get started with the basics',
      'features': [
        'Basic aircraft search',
        'Simple booking system',
      ],
      'button': 'Select Free Plan',
    },
    {
      'plan': 'Pro Plan',
      'price': {
        'monthly': '\$29',
        'quarterly': '\$79',
        'yearly': '\$299',
      },
      'description': 'For serious travelers',
      'features': [
        'All Free features',
        'Booking history',
        'Personalized recommendations',
      ],
      'button': 'Select Pro Plan',
    },
    {
      'plan': 'Elite Plan',
      'price': {
        'monthly': '\$99',
        'quarterly': '\$279',
        'yearly': '\$999',
      },
      'description': 'Ultimate experience',
      'features': [
        'All Pro features',
        'Priority access',
        'Exclusive discounts',
        'Premium support',
      ],
      'button': 'Select Elite Plan',
    },
  ];

  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => SubscriptionPlanController());
  }

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Your Plan',
                          style: TextTheme.of(context).titleLarge!.copyWith(
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                                color: TColors.textSecondary,
                              ),
                        ),
                        SpacerHelper.verticalSpaceMedium(),
                        Text(
                          "Select the perfect plan for your needs",
                          style: TTextFormFieldTheme.formTextStyle
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        SpacerHelper.verticalSpaceLarge(),
                        DataDropDownField(
                          name: 'subscription_plan',
                          label: '',
                          hintText: 'Select',
                          initialValue: Get.find<SubscriptionPlanController>()
                              .selectedSubscription
                              .value,
                          onChanged: (p0) {
                            Get.find<SubscriptionPlanController>()
                                .selectedSubscription
                                .value = p0.toString();
                          },
                          items: ['Monthly', 'Quarterly', 'Yearly']
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                        ),
                        SpacerHelper.verticalSpaceLarge(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.58,
                          child: SubscriptionPlansWidget(
                              pricingPlans: pricingPlans),
                        ),
                      ],
                    ),
                  ),
                  SpacerHelper.verticalSpaceLarge(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.dashboardRoute);
                      },
                      child: Text("Continue"),
                    ),
                  ),
                  SpacerHelper.verticalSpaceLarge(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
