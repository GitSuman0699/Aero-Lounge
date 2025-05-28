import 'package:aero_lounge/features/auth/login/components/dialogs.dart';
import 'package:aero_lounge/features/auth/sign_up/components/sign_up_form.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpFormKey = GlobalKey<FormBuilderState>();

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
                          SignUpForm(signUpFormKey: signUpFormKey),
                          SpacerHelper.verticalSpaceExtraLarge(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                // signUpFormKey.currentState!.save();
                                // if (signUpFormKey.currentState!.validate()) {
                                AppDiaLogs.resetPasswordOtpDialog(context);
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
