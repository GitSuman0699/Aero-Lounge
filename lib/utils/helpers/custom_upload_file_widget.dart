import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/features/auth/profile_setup/components/profile_setup/upload_file_widget.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/dotted_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomUploadFileWidget extends StatelessWidget {
  final bool? mandatory;
  final String label;
  final SizedBox? spacer;
  final Function()? onTap;
  final Color color;
  final int index;

  const CustomUploadFileWidget({
    super.key,
    required this.label,
    this.mandatory = false,
    this.spacer,
    this.onTap,
    this.color = TColors.borderPrimary,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: label,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: TColors.textSecondary,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: mandatory! ? '*' : '',
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
                        () => controller.uploadFilePathList[index] == '' ||
                                mandatory == true
                            ? SizedBox.shrink()
                            : InkWell(
                                onTap: () {
                                  controller.uploadFilePathList[index] = '';
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
              )
            : const SizedBox.shrink(),
        spacer ?? SpacerHelper.verticalSpace(8),
        InkWell(
          onTap: onTap,
          child: DashedBorderContainer(
            child: UploadFileWidget(
              index: index,
            ),
          ),
        ),
      ],
    );
  }
}
