import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.signUpFormKey,
  });

  final GlobalKey<FormBuilderState> signUpFormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: signUpFormKey,
      child: Column(
        children: [
          DataFieldWidget(
            name: 'full_name',
            label: 'Full Name',
            hintText: 'Enter your full name',
            mandatory: true,
            keyboardType: TextInputType.name,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: 'Full name is required',
              ),
              FormBuilderValidators.minLength(3,
                  errorText: 'Full name must be at least 3 characters'),
            ]),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'email',
            label: 'Email',
            hintText: 'Enter your email address',
            initialValue: "david@flyersclub.com",
            mandatory: true,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Email is required',
                ),
                FormBuilderValidators.email(),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'mobile_number',
            label: 'Mobile Number',
            hintText: '+1 (555) 000-0000',
            mandatory: true,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Mobile number is required',
                ),
                FormBuilderValidators.minLength(10,
                    errorText: 'Mobile number must be at least 10 characters'),
                (value) {
                  if (value != null) {
                    // Regular expression for US phone numbers
                    final usPhoneRegex = RegExp(
                        r'^(\+1|1)?[\s-]?\(?[0-9]{3}\)?[\s-]?[0-9]{3}[\s-]?[0-9]{4}$');

                    // Remove all non-digit characters for validation
                    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

                    if (digitsOnly.length != 10) {
                      return 'US phone numbers must have 10 digits';
                    }

                    if (!usPhoneRegex.hasMatch(value)) {
                      return 'Enter a valid US phone number';
                    }
                  }
                  return null;
                },
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          GetBuilder<AuthController>(
            init: AuthController(),
            builder: (controller) {
              return Obx(
                () => DataFieldWidget(
                  name: 'password',
                  label: 'Create password',
                  hintText: 'Create password',
                  isInfoIconVisible: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  mandatory: true,
                  obscureText: !controller.isCreatePasswordVisible.value,
                  suffixIcon: GestureDetector(
                    onTap: () => controller.isCreatePasswordVisible.value =
                        !controller.isCreatePasswordVisible.value,
                    child: Icon(
                      controller.isCreatePasswordVisible.isFalse
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                        errorText: 'Create Password is required',
                      ),
                      FormBuilderValidators.minLength(12,
                          errorText: 'Password must be at least 12 characters'),
                      (value) {
                        if (value == null || value.isEmpty) return null;
                        if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
                          return 'Password must contain at least one letter';
                        }
                        if (!RegExp(r'\d').hasMatch(value)) {
                          return 'Password must contain at least one number';
                        }
                        if (!RegExp(r'[!@#\$&*~^%()\[\]{}:;,.<>?\/\\|_\-+=]')
                            .hasMatch(value)) {
                          return 'Password must contain at least one special character';
                        }
                        return null;
                      }
                    ],
                  ),
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
                () => DataFieldWidget(
                  name: 'confirm_password',
                  label: 'Confirm Password',
                  hintText: 'Confirm password',
                  mandatory: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  suffixIcon: GestureDetector(
                    onTap: () => controller.isConfirmPasswordVisible.value =
                        !controller.isConfirmPasswordVisible.value,
                    child: Icon(
                      controller.isConfirmPasswordVisible.isFalse
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Confirm Password is required'),
                    (value) {
                      final password =
                          signUpFormKey.currentState?.fields['password']?.value;
                      if (password == null) {
                        return 'Please create a password first';
                      }
                      if (password != null && value != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ]),
                  keyboardType: TextInputType.visiblePassword,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
