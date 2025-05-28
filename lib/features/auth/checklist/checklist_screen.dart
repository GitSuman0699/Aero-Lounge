import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final signUpFormKey = GlobalKey<FormBuilderState>();

  final checklistItem = [
    {"text": "Fill out your personal information", "status": "active"},
    {"text": "Legal Compliance & Certifications", "status": "active"},
    {"text": "Flight Experience Overview", "status": "active"},
    {"text": "Document Uploads", "status": "active"},
    {"text": "Flying Goals & Preferences", "status": "inactive"},
    {"text": "Emergency Contact", "status": "inactive"},
    {"text": "Platform Preferences", "status": "inactive"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: Stack(
        children: [
          // Background image
          BackGroundFiller(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacerHelper.verticalSpaceMedium(),
                  SpacerHelper.verticalSpaceSmall(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Aboard!',
                            style: TextTheme.of(context).titleLarge!.copyWith(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                  color: TColors.textSecondary,
                                ),
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          Text(
                            "To help you get started here are your next steps, complete them to have a full AeroLounge experience.",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: TColors.textSecondary,
                                ),
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          ListView.separated(
                            itemCount: checklistItem.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return SpacerHelper.verticalSpaceMedium();
                            },
                            itemBuilder: (context, index) {
                              final item = checklistItem[index];
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: item['status']! == 'active'
                                      ? TColors.checklistContainer
                                      : TColors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: TColors.containerSecondary,
                                    width: 1.5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_sharp,
                                      color: item['status']! == 'active'
                                          ? TColors.textPrimary
                                          : TColors.scaffoldBackground,
                                      size: 26,
                                    ),
                                    SpacerHelper.horizontalSpaceSmall(),
                                    Text(
                                      item['text']!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: TColors.textSecondary,
                                          ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SpacerHelper.verticalSpaceExtraLarge(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                // signUpFormKey.currentState!.save();
                                // if (signUpFormKey.currentState!.validate()) {
                                Get.toNamed(AppRoutes.createAccountRoute);
                                // }
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
            ),
          ),
        ],
      ),
    );
  }
}
