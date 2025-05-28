import 'package:aero_lounge/features/root/logbook/upcoming_flights/components/button_row_widget.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';

class UpComingFlightsCard extends StatelessWidget {
  const UpComingFlightsCard({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
                data['title'],
                style: TextTheme.of(context).titleMedium?.copyWith(
                      color: TColors.textPrimary,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: data['status'] == 'Pending'
                      ? TColors.pendingBadge
                      : TColors.buttonGreen,
                ),
                child: Center(
                  child: Text(
                    data['status'],
                    style: TextTheme.of(context).bodySmall?.copyWith(
                          color: TColors.white,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
              )
            ],
          ),
          SpacerHelper.verticalSpaceExtraSmall(),
          Text(
            data['aircraft'],
            style: TextTheme.of(context).bodySmall?.copyWith(
                  color: TColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: TColors.textPrimary,
                size: 22,
              ),
              SpacerHelper.horizontalSpaceSmall(),
              Text(
                data['date'],
                style: TextTheme.of(context).bodySmall?.copyWith(
                      color: TColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          SpacerHelper.verticalSpaceMedium(),
          Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                color: TColors.textPrimary,
                size: 24,
              ),
              SpacerHelper.horizontalSpaceSmall(),
              Text(
                data['time'],
                style: TextTheme.of(context).bodySmall?.copyWith(
                      color: TColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          SpacerHelper.verticalSpaceMedium(),
          ButtonRowWidget(data: data),
        ],
      ),
    );
  }
}
