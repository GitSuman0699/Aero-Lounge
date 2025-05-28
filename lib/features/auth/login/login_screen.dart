import 'package:aero_lounge/features/auth/login/components/dialogs.dart';
import 'package:aero_lounge/features/auth/login/components/login_form.dart';
import 'package:aero_lounge/features/auth/login/components/signup_link.dart';
import 'package:aero_lounge/features/auth/login/components/social_login_widget.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // Background image
              BackGroundFiller(),

              Positioned(
                top: 130,
                left: 20,
                right: 20,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Log In',
                        style: TextTheme.of(context).headlineSmall!.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              color: TColors.textSecondary,
                            ),
                      ),
                      SpacerHelper.verticalSpaceLarge(),
                      SpacerHelper.verticalSpaceMedium(),
                      LoginForm(loginFormKey: loginFormKey),
                      SpacerHelper.verticalSpaceMedium(),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: RichText(
                            text: TextSpan(
                              text: "Forgot Password?",
                              style: TextTheme.of(context).titleSmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  AppDiaLogs.resetPasswordDialog(context);
                                },
                            ),
                          ),
                        ),
                      ),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ElevatedButton(
                          onPressed: () {
                            // loginFormKey.currentState!.save();
                            // if (loginFormKey.currentState!.validate()) {
                            Get.toNamed(AppRoutes.rootRoute);
                            // }
                          },
                          child: const Text("Log In"),
                        ),
                      ),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      SocialLoginWidget(),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      SignupLink(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
