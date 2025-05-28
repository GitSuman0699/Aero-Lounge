import 'dart:io';
import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/dotted_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddPhotoSection extends StatelessWidget {
  const AddPhotoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<AuthController>().getImageFromGallery();
      },
      child: DashedBorderContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.5),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              minHeight: 50,
              maxHeight: 205,
            ),
            decoration: BoxDecoration(
              color: TColors.lightContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacerHelper.verticalSpaceLarge(),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: TColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: TColors.borderSecondary,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: GetBuilder<AuthController>(
                        init: AuthController.instance,
                        builder: (controller) {
                          return Obx(
                            () => controller.profilePicturePath.value.isEmpty
                                ? SvgPicture.asset(
                                    Assets.assetsCreateAccountUserIcon,
                                  )
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(
                                      File(controller.profilePicturePath.value),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ),
                  SpacerHelper.verticalSpaceSmall(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.assetsCreateAccountCameraIcon,
                        height: 22,
                        width: 22,
                      ),
                      SpacerHelper.horizontalSpaceSmall(),
                      Text(
                        'Add Photo',
                        style: TextTheme.of(context).titleMedium!.copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                              color: TColors.textPrimary,
                            ),
                      ),
                    ],
                  ),
                  SpacerHelper.verticalSpaceSmall(),
                  Text(
                    '(Professional or friendly, aviation-friendly)',
                    style: TextTheme.of(context).labelLarge?.copyWith(
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          color: TColors.textPrimary,
                        ),
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
