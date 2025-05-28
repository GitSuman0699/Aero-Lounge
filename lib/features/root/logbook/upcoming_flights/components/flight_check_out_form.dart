import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/dotted_container.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class FlightCheckOutForm extends StatelessWidget {
  const FlightCheckOutForm({
    super.key,
    required this.flightCheckOutFormKey,
  });

  final GlobalKey<FormBuilderState> flightCheckOutFormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: flightCheckOutFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacerHelper.verticalSpaceLarge(),
          DataFieldWidget(
            name: 'hobbs_out',
            label: 'Hobbs out',
            hintText: 'Enter Hobbs out',
            mandatory: true,
            suffixIcon: Icon(Icons.access_time),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                  errorText: 'Hobbs out is required'),
            ]),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'tach_1_out',
            label: 'Tach 1 out',
            hintText: 'Enter Tach 1 out',
            mandatory: true,
            suffixIcon: Icon(Icons.access_time),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                  errorText: 'Tach 1 out is required'),
            ]),
          ),
          SpacerHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Upload Walkthrough',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
                    () => controller.walkthroughPath.isEmpty
                        ? SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              controller.walkthroughPath.value = "";
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
              Get.find<AuthController>().getFile(type: 'walkthrough');
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
                              if (controller.walkthroughPath.isEmpty) ...[
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
                                  controller.walkthroughPath.value
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
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'notes',
            label: 'Notes',
            hintText: 'Enter Notes',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            maxLines: 3,
          ),
          SpacerHelper.verticalSpaceMedium(),
          CheckboxDataField(name: 'checklist', label: 'Checklist', options: [
            FormBuilderFieldOption(
              value: 'Night Flying Allowed',
              child: Text(
                'Night Flying Allowed',
                style: TTextFormFieldTheme.formTextStyle,
              ),
            ),
            FormBuilderFieldOption(
              value: 'Paved Runway Only',
              child: Text(
                'Paved Runway Only',
                style: TTextFormFieldTheme.formTextStyle,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
