import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusWidget extends StatelessWidget {
  final Color containerColor;
  final Color borderColor;
  final String iconPath;
  final String title;
  final String subTitle;
  const StatusWidget({
    super.key,
    required this.containerColor,
    required this.borderColor,
    required this.iconPath,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 25,
                  width: 25,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextTheme.of(context).titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: TColors.textSecondary,
                        ),
                  ),
                  SpacerHelper.verticalSpace(2),
                  Text(
                    subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextTheme.of(context).bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: TColors.textSecondary,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
