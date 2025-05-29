import 'package:aero_lounge/features/auth/profile_setup/components/profile_setup/profile_setup_4_form.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ProfileSetup4Screen extends StatefulWidget {
  const ProfileSetup4Screen({super.key});

  @override
  State<ProfileSetup4Screen> createState() => _ProfileSetup4ScreenState();
}

class _ProfileSetup4ScreenState extends State<ProfileSetup4Screen> {
  final profileSetup4FormKey = GlobalKey<FormBuilderState>();

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
                            Get.toNamed(AppRoutes.profileSetup5Route);
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
                              'Flying Goals & Preferences',
                              style: TextTheme.of(context).titleLarge!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.5,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                            SpacerHelper.verticalSpaceMedium(),
                            ProfileSetup4Form(
                                profileSetup4FormKey: profileSetup4FormKey),
                            SpacerHelper.verticalSpaceExtraLarge(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  profileSetup4FormKey.currentState?.save();
                                  if (profileSetup4FormKey.currentState!
                                      .validate()) {
                                    Get.toNamed(AppRoutes.profileSetup5Route);
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
