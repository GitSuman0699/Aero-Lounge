import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Get.currentRoute == AppRoutes.notificationRoute) {
          Get.back();
          return;
        }
        Get.toNamed(AppRoutes.notificationRoute);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              Assets.assetsDashboardNotificationIcon,
              height: 35,
              width: 35,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Icon(
                Icons.circle,
                color: TColors.borderRed,
                size: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
