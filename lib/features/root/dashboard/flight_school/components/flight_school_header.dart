import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FlightSchoolHeader extends StatelessWidget {
  const FlightSchoolHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 130,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SkyWings Academy",
              textAlign: TextAlign.start,
              style: TextTheme.of(context).titleMedium?.copyWith(
                    color: TColors.textPrimary,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 16,
                  color: TColors.textPrimary,
                ),
                Text(
                  'Miami International Airport, FL',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextTheme.of(context).bodySmall?.copyWith(
                        color: TColors.textPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
