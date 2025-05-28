import 'package:aero_lounge/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: SvgPicture.asset(
        Assets.assetsCreateAccountBackIcon,
        height: 24,
        width: 24,
      ),
    );
  }
}
