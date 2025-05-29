import 'package:aero_lounge/features/auth/profile_setup/components/profile_setup/profile_setup_6_form.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ProfileSetup6Screen extends StatefulWidget {
  const ProfileSetup6Screen({super.key});

  @override
  State<ProfileSetup6Screen> createState() => _ProfileSetup6ScreenState();
}

class _ProfileSetup6ScreenState extends State<ProfileSetup6Screen> {
  final profileSetup6FormKey = GlobalKey<FormBuilderState>();

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButtonWidget(),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.accountReviewRoute);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: TColors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              "Skip",
                              style: TextTheme.of(context).bodySmall?.copyWith(
                                    color: TColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    SpacerHelper.verticalSpaceSmall(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Platform Preferences',
                              style: TextTheme.of(context).titleLarge!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.5,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                            SpacerHelper.verticalSpaceMedium(),
                            ProfileSetup6Form(
                                profileSetup6FormKey: profileSetup6FormKey),
                            SpacerHelper.verticalSpaceExtraLarge(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  profileSetup6FormKey.currentState?.save();
                                  if (profileSetup6FormKey.currentState!
                                      .validate()) {
                                    Get.toNamed(AppRoutes.accountReviewRoute);
                                  }
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
        ));
  }
}
