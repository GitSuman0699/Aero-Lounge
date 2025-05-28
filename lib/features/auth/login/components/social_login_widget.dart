import 'dart:io';

import 'package:aero_lounge/features/auth/login/components/dialogs.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            AppDiaLogs.suggestedResolutionsDialog(context);
          },
          child: SvgPicture.asset(
            Assets.assetsLoginGoogleLoginIcon,
            height: 60,
            width: 60,
          ),
        ),
        if (Platform.isIOS) ...[
          SpacerHelper.horizontalSpaceMedium(),
          SvgPicture.asset(
            Assets.assetsLoginAppleLoginIcon,
            height: 60,
            width: 60,
          ),
        ]
      ],
    );
  }
}
