import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpcomingFlightCard extends StatelessWidget {
  const UpcomingFlightCard({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: TColors.lightContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: TColors.radioBackgroud,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['date'],
                style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: TColors.textSecondary,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Text(
                data['duration'],
                style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: TColors.textSecondary,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          SpacerHelper.verticalSpaceSmall(),
          Row(
            children: [
              SvgPicture.asset(
                Assets.assetsRootFlightTakeoffIcon,
                height: 16,
                width: 16,
              ),
              SpacerHelper.horizontalSpaceMedium(),
              Text(
                data['start_airport'],
                style: TextTheme.of(context).titleLarge?.copyWith(
                      color: TColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              SpacerHelper.horizontalSpaceSmall(),
              SvgPicture.asset(
                Assets.assetsRootForwardArrowIcon,
                height: 14,
                width: 14,
              ),
              SpacerHelper.horizontalSpaceSmall(),
              Text(
                data['end_airport'],
                style: TextTheme.of(context).titleLarge?.copyWith(
                      color: TColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
            ],
          ),
          SpacerHelper.verticalSpaceSmall(),
          Text(
            data['aircraft'],
            style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: TColors.textSecondary,
                  fontWeight: FontWeight.normal,
                ),
          )
        ],
      ),
    );
  }
}
