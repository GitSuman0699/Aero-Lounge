import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';

class UpcomingFlightWidget extends StatelessWidget {
  const UpcomingFlightWidget({
    super.key,
    required this.data,
  });

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: TColors.lightContainer,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['title']!,
                style: TextTheme.of(context).titleMedium?.copyWith(
                      color: TColors.textSecondary,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: TColors.buttonGreen,
                ),
                child: Center(
                  child: Text(
                    data['status']!,
                    style: TextTheme.of(context).bodySmall?.copyWith(
                          color: TColors.white,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
              ),
            ],
          ),
          SpacerHelper.verticalSpaceExtraSmall(),
          Text(
            "${data['date']!} ${data['time']!}",
            style: TextTheme.of(context).bodyMedium?.copyWith(
                color: TColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 13),
          ),
        ],
      ),
    );
  }
}
