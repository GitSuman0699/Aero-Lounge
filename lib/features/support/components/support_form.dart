import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/dotted_container.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SupportForm extends StatelessWidget {
  const SupportForm({
    super.key,
    required this.supportFormKey,
    required this.supportCategories,
  });

  final GlobalKey<FormBuilderState> supportFormKey;
  final List<String> supportCategories;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: supportFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacerHelper.verticalSpaceLarge(),
          DataFieldWidget(
            name: 'subject',
            label: 'Subject',
            hintText: 'Enter Subject',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataDropDownField(
              name: 'category',
              label: 'Category',
              hintText: 'Select Category',
              items: supportCategories
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList()),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'description',
            label: 'Description',
            hintText: 'Describe your issue',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            maxLines: 5,
          ),
          SpacerHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Attachments (Optional)',
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
                    () => controller.supportAttachmentPath.isEmpty
                        ? SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              controller.supportAttachmentPath.value = "";
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
              Get.find<AuthController>().getFile(type: 'support');
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
                              if (controller.supportAttachmentPath.isEmpty) ...[
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
                                  controller.supportAttachmentPath.value
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
    );
  }
}
