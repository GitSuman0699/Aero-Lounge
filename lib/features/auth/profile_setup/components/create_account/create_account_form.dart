import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/services/local_storage_service.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/enums.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/dotted_container.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({
    super.key,
    required this.createAccountFormKey,
  });

  final GlobalKey<FormBuilderState> createAccountFormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: createAccountFormKey,
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
            name: 'preferred_name',
            label: 'Preferred Name/Callsign',
            hintText: 'Enter your preferred name/callsign',
            keyboardType: TextInputType.name,
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'email',
            label: 'Email',
            hintText: 'Enter your email address',
            initialValue: "david@flyersclub.com",
            mandatory: true,
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Enter your email address",
              filled: true,
              fillColor: TColors.lightContainer,
            ),
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
          DataFieldWidget(
            name: 'home_airport',
            label: 'Home Airport (ICAO code or name)',
            hintText: 'Enter home airport',
            mandatory: true,
            keyboardType: TextInputType.name,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: 'Home airport is required',
              ),
              FormBuilderValidators.minLength(3,
                  errorText: 'Home airport must be at least 3 characters'),
            ]),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'time_zone',
            label: 'Time Zone',
            hintText: 'Enter time zone',
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'linkedin_url',
            label: 'Linkedin URL or Avation Resume',
            hintText: 'Enter Linkedin URL',
            keyboardType: TextInputType.url,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.url(
                errorText: 'Enter a valid URL',
              ),
            ]),
          ),
          SpacerHelper.verticalSpaceMedium(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Upload Resume',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: TColors.textSecondary,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: TColors.textSecondary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<AuthController>(
                    init: AuthController(),
                    builder: (controller) {
                      return Obx(
                        () => controller.resumePath.isEmpty
                            ? SizedBox.shrink()
                            : InkWell(
                                onTap: () {
                                  controller.resumePath.value = "";
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.cancel,
                                      size: 16,
                                    ),
                                    Text(
                                      "Discard",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w900,
                                            color: TColors.textSecondary,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                      );
                    },
                  )
                ],
              ),
              SpacerHelper.verticalSpace(8),
              InkWell(
                onTap: () {
                  Get.find<AuthController>().getFile(type: 'resume');
                },
                child: DashedBorderContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        minHeight: 50,
                        maxHeight: 92,
                      ),
                      decoration: BoxDecoration(
                        color: TColors.lightContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: GetBuilder<AuthController>(
                          init: AuthController(),
                          builder: (controller) {
                            return Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (controller.resumePath.isEmpty) ...[
                                    SvgPicture.asset(
                                      Assets.assetsCreateAccountUploadIcon,
                                      height: 24,
                                      width: 24,
                                    ),
                                    SpacerHelper.verticalSpaceExtraSmall(),
                                    Text(
                                      'Tap to upload file',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                  ] else ...[
                                    Text(
                                      controller.resumePath.value
                                          .split('/')
                                          .last,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: TColors.textPrimary,
                                          ),
                                    ),
                                    SpacerHelper.verticalSpaceExtraSmall(),
                                    Text(
                                      'Tap to replace file',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: TColors.textSecondary,
                                          ),
                                    ),
                                  ],
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'short_bio',
            label: 'Short Bio',
            hintText:
                'Tell us a little about your aviation story, goals, or what you’re here for.',
            maxLines: 4,
          ),
          SpacerHelper.verticalSpaceMedium(),
          DateFormWidget(
            label: "Date of Birth",
            name: 'date_of_birth',
            mandatory: true,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Date of birth is required',
                ),
              ],
            ),
          ),
          Visibility(
            visible: LocalStorageService.getRole == Role.pilot.name &&
                (LocalStorageService.getRoleType ==
                        PilotRoleType.student.name ||
                    LocalStorageService.getRoleType == PilotRoleType.cfi.name),
            child: Column(
              children: [
                SpacerHelper.verticalSpaceMedium(),
                RadioDataField(
                  name: 'us_citizen',
                  label: 'Are you a US Citizen?',
                  mandatory: true,
                  options: [
                    FormBuilderFieldOption(
                      value: 'Yes',
                      child: Text(
                        "Yes",
                        style: TTextFormFieldTheme.formTextStyle,
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: 'No',
                      child: Text(
                        "No",
                        style: TTextFormFieldTheme.formTextStyle,
                      ),
                    ),
                  ],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Please select an option',
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Visibility(
            visible: LocalStorageService.getRole == Role.pilot.name &&
                LocalStorageService.getRoleType == PilotRoleType.cfi.name,
            child: Column(
              children: [
                SpacerHelper.verticalSpaceMedium(),
                RadioDataField(
                  name: 'open_to_train_international_students',
                  label:
                      'Are you open to train international students? (CFI Only)',
                  options: [
                    FormBuilderFieldOption(
                      value: 'Yes',
                      child: Text(
                        "Yes",
                        style: TTextFormFieldTheme.formTextStyle,
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: 'No',
                      child: Text(
                        "No",
                        style: TTextFormFieldTheme.formTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
