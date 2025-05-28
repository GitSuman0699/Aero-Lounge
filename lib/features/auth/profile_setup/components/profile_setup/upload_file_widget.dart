import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UploadFileWidget extends StatelessWidget {
  final int index;
  const UploadFileWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              return Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.uploadFilePathList[index] == '') ...[
                        SvgPicture.asset(
                          Assets.assetsCreateAccountUploadIcon,
                          height: 24,
                          width: 24,
                        ),
                        SpacerHelper.verticalSpaceExtraSmall(),
                        Text(
                          'Tap to upload file',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: TColors.textSecondary,
                                  ),
                        ),
                      ] else ...[
                        Text(
                          controller.uploadFilePathList[index].split('/').last,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: TColors.textPrimary,
                                  ),
                        ),
                        SpacerHelper.verticalSpaceExtraSmall(),
                        Text(
                          'Tap to replace file',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: TColors.textSecondary,
                                  ),
                        ),
                      ],
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
