import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:aero_lounge/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AppDiaLogs {
  static final resetPasswordFormKey = GlobalKey<FormBuilderState>();
  static final TextEditingController smsCodeController =
      TextEditingController();
  static Future<dynamic> resetPasswordDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            // Add constraints instead of fixed height
            maxHeight: MediaQuery.of(context).size.height * 0.45,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: TColors.dialogBackground),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset Password",
                  style: TextTheme.of(context).titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Text(
                  "Enter your email address to receive a verification code.",
                  style: TextTheme.of(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                FormBuilder(
                  key: resetPasswordFormKey,
                  child: FormBuilderTextField(
                    name: 'recovery_email',
                    style: TTextFormFieldTheme.formTextStyle,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: const InputDecoration(labelText: 'Email'),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'email is required'),
                      FormBuilderValidators.email(),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SpacerHelper.verticalSpaceExtraLarge(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      resetPasswordFormKey.currentState!.save();
                      if (resetPasswordFormKey.currentState!.validate()) {
                        Get.back();
                        resetPasswordOtpDialog(context);
                      }
                    },
                    child: const Text("Send OTP"),
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> cancelFlightBottomSheet(
      BuildContext context, Map<String, dynamic> data) {
    return showModalBottomSheet(
      showDragHandle: false,
      backgroundColor: TColors.dialogBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.assetsRootDragHandleIcon),
              SpacerHelper.verticalSpace(24),
              Text(
                'Cancel your booking?',
                style: TextTheme.of(context).titleMedium?.copyWith(
                      color: TColors.textPrimary,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              SpacerHelper.verticalSpace(6),
              Text(
                'Are you sure you want to cancel your scheduled flight with ${data['aircraft']} on ${data['date']}?',
                textAlign: TextAlign.center,
                style: TextTheme.of(context).titleSmall?.copyWith(
                      color: TColors.textPrimary,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SpacerHelper.verticalSpace(24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: TColors.lightContainer,
                  border: Border.all(
                    color: TColors.radioBackgroud,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.assetsRootExclaimationIcon),
                    SpacerHelper.horizontalSpace(12),
                    Expanded(
                      child: Text(
                        'Full refund for cancellations made more than 12 hours before the flight',
                        maxLines: 2,
                        style: TextTheme.of(context).bodySmall?.copyWith(
                              color: TColors.textSecondary,
                            ),
                      ),
                    )
                  ],
                ),
              ),
              SpacerHelper.verticalSpace(24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: TElevatedButtonTheme.lightElevatedButtonTheme.style
                      ?.copyWith(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      TColors.borderPrimary,
                    ),
                    textStyle: WidgetStatePropertyAll(
                      TTextTheme.lightTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Confirm Cancellation'),
                ),
              ),
              SpacerHelper.verticalSpace(8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: TOutlinedButtonTheme.lightOutlinedButtonTheme.style
                      ?.copyWith(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    textStyle: WidgetStatePropertyAll(
                      TTextTheme.lightTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Keep Booking'),
                ),
              ),
              SpacerHelper.verticalSpace(16),
            ],
          ),
        );
      },
    );
  }

  static Future<dynamic> resetPasswordOtpDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: TColors.white),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter OTP",
                  style: TextTheme.of(context).titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Text(
                  "Enter the 6-digit code sent to your email.",
                  style: TextTheme.of(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                PinFieldAutoFill(
                  cursor: Cursor(
                    color: TColors.black,
                    width: 2,
                    height: 20,
                    enabled: true,
                  ),
                  controller: smsCodeController,
                  decoration: BoxLooseDecoration(
                    gapSpace: 4,
                    textStyle: TextTheme.of(context).titleSmall!.copyWith(
                          color: TColors.dark,
                          fontWeight: FontWeight.w700,
                        ),
                    strokeColorBuilder: FixedColorBuilder(Colors.black26),
                    bgColorBuilder: FixedColorBuilder(Colors.transparent),
                    strokeWidth: 1,
                  ),
                  // currentCode: otpCode,

                  onCodeChanged: (code) {
                    if (code!.length == 6) {
                      FocusScope.of(context).unfocus();
                    }
                  },

                  codeLength: 6,
                ),
                SpacerHelper.verticalSpaceMedium(),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                        text: 'Didnt receive OTP? ',
                        style: TextTheme.of(context).titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: TColors.textPrimary,
                            ),
                        children: [
                          TextSpan(
                            text: 'Resend OTP',
                            style: TextTheme.of(context).titleSmall!.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: TColors.textPrimary,
                                ),
                          ),
                        ]),
                  ),
                ),
                SpacerHelper.verticalSpaceLarge(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (smsCodeController.text.length == 6) {
                        if (Get.currentRoute == AppRoutes.loginRoute) {
                          Get.back();
                          enterResetPasswordDialog(context);
                        } else {
                          Get.back();
                          Get.toNamed(AppRoutes.checklistRoute);
                        }
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please enter a valid OTP",
                        );
                      }
                    },
                    child: const Text("Verify"),
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> enterResetPasswordDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.8,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.55,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: TColors.dialogBackground),
            child: Material(
              color: Colors.transparent,
              child: FormBuilder(
                key: resetPasswordFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Set a New Password",
                      style: TextTheme.of(context).titleLarge!.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                            color: TColors.textPrimary,
                          ),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    Text(
                      "Create a strong password for your account",
                      style: TextTheme.of(context).titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: TColors.textPrimary,
                          ),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (controller) {
                        return Obx(
                          () => FormBuilderTextField(
                            name: 'new_password',
                            style: TTextFormFieldTheme.formTextStyle,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                                labelText: 'New Password',
                                suffixIcon: GestureDetector(
                                    onTap: () => controller
                                            .isNewPasswordVisible.value =
                                        !controller.isNewPasswordVisible.value,
                                    child: Icon(
                                        controller.isNewPasswordVisible.isFalse
                                            ? Icons.visibility_off
                                            : Icons.visibility))),
                            obscureText: !controller.isNewPasswordVisible.value,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'new password is required'),
                              FormBuilderValidators.password(),
                            ]),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        );
                      },
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (controller) {
                        return Obx(
                          () => FormBuilderTextField(
                            name: 'confirm_password',
                            style: TTextFormFieldTheme.formTextStyle,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                suffixIcon: GestureDetector(
                                    onTap: () => controller
                                            .isConfirmNewPasswordVisible.value =
                                        !controller
                                            .isConfirmNewPasswordVisible.value,
                                    child: Icon(controller
                                            .isConfirmNewPasswordVisible.isFalse
                                        ? Icons.visibility_off
                                        : Icons.visibility))),
                            obscureText:
                                !controller.isConfirmNewPasswordVisible.value,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'confirm password is required'),
                              FormBuilderValidators.password(),
                            ]),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        );
                      },
                    ),
                    SpacerHelper.verticalSpaceExtraLarge(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          resetPasswordFormKey.currentState!.save();
                          if (resetPasswordFormKey.currentState!.validate()) {
                            Get.back();
                            resetPasswordConfirmationDialog(context);
                          }
                        },
                        child: const Text("Reset Password"),
                      ),
                    ),
                    SpacerHelper.verticalSpaceSmall(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Cancel"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> resetPasswordConfirmationDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: TColors.dialogBackground),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Check your inbox to verify your email",
                  style: TextTheme.of(context).titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Text(
                  "We’ve sent you a verification link to your email address",
                  style: TextTheme.of(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceExtraLarge(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Resend Verification Email"),
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Back to Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> passwordGuildlineDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: TColors.dialogBackground),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Password Requirements",
                  textAlign: TextAlign.center,
                  style: TextTheme.of(context).titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Text(
                  "Passwords must contain at least",
                  style: TextTheme.of(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• At least 12 characters",
                      style: TextTheme.of(context).titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: TColors.textPrimary,
                          ),
                    ),
                    SpacerHelper.verticalSpaceExtraSmall(),
                    Text(
                      "• One letter",
                      style: TextTheme.of(context).titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: TColors.textPrimary,
                          ),
                    ),
                    SpacerHelper.verticalSpaceExtraSmall(),
                    Text(
                      "• 1 number",
                      style: TextTheme.of(context).titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: TColors.textPrimary,
                          ),
                    ),
                    SpacerHelper.verticalSpaceExtraSmall(),
                    Text(
                      "• One Special Ch@aracter",
                      style: TextTheme.of(context).titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: TColors.textPrimary,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> dispatchFormAlertDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: TColors.dialogBackground,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SpacerHelper.verticalSpaceSmall(),
                SvgPicture.asset(
                  Assets.assetsCreateAccountWarningIcon,
                  height: 45,
                  width: 45,
                  colorFilter: ColorFilter.mode(
                    TColors.backIcon,
                    BlendMode.srcIn,
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Text(
                  "Action Incomplete",
                  style: TextTheme.of(context).titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Text(
                  "It is important for you to complete the dispatch form for your safety and record keeping.",
                  textAlign: TextAlign.center,
                  style: TextTheme.of(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceLarge(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.toNamed(AppRoutes.dispatchFormRoute);
                    },
                    child: const Text("Complete Dispatch Form"),
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("I’ll do this later"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> logoutDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: TColors.dialogBackground,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SpacerHelper.verticalSpaceSmall(),
                SvgPicture.asset(
                  Assets.assetsLoginLogoutIcon,
                  height: 30,
                  width: 30,
                  colorFilter: ColorFilter.mode(
                    TColors.backIcon,
                    BlendMode.srcIn,
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Text(
                  "Log Out",
                  style: TextTheme.of(context).titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Text(
                  "Are you sure you want to log out?",
                  textAlign: TextAlign.center,
                  style: TextTheme.of(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceLarge(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Yes, Log Out"),
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> issueResolvedDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: TColors.dialogBackground,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SpacerHelper.verticalSpaceSmall(),
                SvgPicture.asset(
                  Assets.assetsAircraftPaymentTickIcon,
                  height: 40,
                  width: 40,
                  colorFilter: ColorFilter.mode(
                    TColors.backIcon,
                    BlendMode.srcIn,
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Text(
                  "Issue Resolved",
                  style: TextTheme.of(context).titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Text(
                  "Thank you for your patience",
                  textAlign: TextAlign.center,
                  style: TextTheme.of(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceLarge(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Return to Profile"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> suggestedResolutionsDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.45,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: TColors.dialogBackground,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Suggested Resolutions",
                  style: TextTheme.of(context).titleMedium!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: TColors.lightContainer,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: TColors.radioBackgroud,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.refresh, color: TColors.textPrimary),
                          SpacerHelper.horizontalSpaceSmall(),
                          Text(
                            "Full Refund",
                            style: TextTheme.of(context).titleSmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: TColors.lightContainer,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: TColors.radioBackgroud,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today_rounded,
                              color: TColors.textPrimary),
                          SpacerHelper.horizontalSpaceSmall(),
                          Text(
                            "Reschedule Booking",
                            style: TextTheme.of(context).titleSmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: TColors.lightContainer,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: TColors.radioBackgroud,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.messenger_outline_rounded,
                              color: TColors.textPrimary),
                          SpacerHelper.horizontalSpaceSmall(),
                          Text(
                            "Contact Property Owner",
                            style: TextTheme.of(context).titleSmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SpacerHelper.verticalSpaceLarge(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Accept Resolution"),
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Escalate to Super Admin"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> issueEscalatedDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: TColors.dialogBackground,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SpacerHelper.verticalSpaceSmall(),
                SvgPicture.asset(
                  Assets.assetsLoginIssueEscalatedIcon,
                  height: 40,
                  width: 40,
                  colorFilter: ColorFilter.mode(
                    TColors.backIcon,
                    BlendMode.srcIn,
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Text(
                  "Issue Escalated",
                  style: TextTheme.of(context).titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textPrimary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: TColors.textWhite,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Ticket Number',
                              textAlign: TextAlign.start,
                              style: TextTheme.of(context).bodySmall!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '#ESC-2025-0123',
                              textAlign: TextAlign.end,
                              style: TextTheme.of(context).bodySmall!.copyWith(
                                    color: TColors.textSecondary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SpacerHelper.verticalSpaceSmall(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Expected Response',
                              textAlign: TextAlign.start,
                              style: TextTheme.of(context).bodySmall!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '24-48 hours',
                              textAlign: TextAlign.end,
                              style: TextTheme.of(context).bodySmall!.copyWith(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Track Status"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<dynamic> deleteAccountDialog(BuildContext context) {
    return Get.dialog(
      Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: TColors.dialogBackground,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SpacerHelper.verticalSpaceSmall(),
                SvgPicture.asset(
                  Assets.assetsCreateAccountWarningIcon,
                  height: 45,
                  width: 45,
                  colorFilter: ColorFilter.mode(
                    TColors.logoutButtonRed,
                    BlendMode.srcIn,
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Text(
                  "Delete Account",
                  style: TextTheme.of(context).titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: TColors.textSecondary,
                      ),
                ),
                SpacerHelper.verticalSpaceMedium(),
                Text(
                  "Are you sure you want to delete your account?",
                  textAlign: TextAlign.center,
                  style: TextTheme.of(context).titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                Text(
                  "This action cannot be undone.",
                  textAlign: TextAlign.center,
                  style: TextTheme.of(context).bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                ),
                SpacerHelper.verticalSpaceLarge(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: TElevatedButtonTheme.lightElevatedButtonTheme.style
                        ?.copyWith(
                      backgroundColor: WidgetStatePropertyAll(
                        TColors.logoutButtonRed,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Delete My Account"),
                  ),
                ),
                SpacerHelper.verticalSpaceSmall(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
