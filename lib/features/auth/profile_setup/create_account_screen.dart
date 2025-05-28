import 'package:aero_lounge/features/auth/profile_setup/components/create_account/add_photo_section.dart';
import 'package:aero_lounge/features/auth/profile_setup/components/create_account/create_account_form.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final createAccountFormKey = GlobalKey<FormBuilderState>();

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
                  BackButtonWidget(),
                  SpacerHelper.verticalSpaceMedium(),
                  SpacerHelper.verticalSpaceSmall(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create Pilot Account',
                            style: TextTheme.of(context).titleLarge!.copyWith(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                  color: TColors.textSecondary,
                                ),
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          AddPhotoSection(),
                          SpacerHelper.verticalSpaceLarge(),
                          CreateAccountForm(
                              createAccountFormKey: createAccountFormKey),
                          SpacerHelper.verticalSpaceExtraLarge(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                // createAccountFormKey.currentState!.save();
                                // if (createAccountFormKey.currentState!
                                //     .validate()) {}
                                Get.toNamed(AppRoutes.profileSetup1Route);
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
