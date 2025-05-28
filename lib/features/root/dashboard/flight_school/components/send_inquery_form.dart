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

class SendInqueryForm extends StatelessWidget {
  const SendInqueryForm({
    super.key,
    required this.sendInqueryFormKey,
  });

  final GlobalKey<FormBuilderState> sendInqueryFormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: sendInqueryFormKey,
      child: Column(
        children: [
          DataFieldWidget(
            name: 'subject',
            label: 'Subject',
            hintText: 'Enter subject',
            keyboardType: TextInputType.name,
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'message',
            label: 'Message',
            hintText: 'Type your message here',
            keyboardType: TextInputType.text,
            maxLines: 5,
          ),
          SpacerHelper.verticalSpaceMedium(),
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
                                  controller.resumePath.value.split('/').last,
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
