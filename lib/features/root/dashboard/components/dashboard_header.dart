import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/notification_button.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: TColors.lightContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage(Assets.assetsDashboardDashboardUserImage),
                    ),
                    SpacerHelper.horizontalSpaceSmall(),
                    Text(
                      title,
                      style: TextTheme.of(context).titleMedium?.copyWith(
                            color: TColors.textSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              SpacerHelper.horizontalSpaceMedium(),
              NotificationButton(),
            ],
          ),
        ),
      ),
    );
  }
}
