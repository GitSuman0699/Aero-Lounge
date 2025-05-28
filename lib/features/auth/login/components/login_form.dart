import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.loginFormKey,
  });

  final GlobalKey<FormBuilderState> loginFormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: loginFormKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'email',
            style: TTextFormFieldTheme.formTextStyle,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: const InputDecoration(labelText: 'Email'),
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                  RegExp(r'\s')), // Prevents any whitespace
            ],
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'email is required'),
              FormBuilderValidators.email(),
            ]),
            keyboardType: TextInputType.emailAddress,
          ),
          SpacerHelper.verticalSpaceMedium(),
          GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) {
                return Obx(
                  () => FormBuilderTextField(
                    name: 'password',
                    style: TTextFormFieldTheme.formTextStyle,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                            onTap: () => controller.isPasswordVisible.value =
                                !controller.isPasswordVisible.value,
                            child: Icon(controller.isPasswordVisible.isFalse
                                ? Icons.visibility_off
                                : Icons.visibility))),
                    obscureText: !controller.isPasswordVisible.value,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'password is required'),
                      FormBuilderValidators.password(),
                    ]),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
