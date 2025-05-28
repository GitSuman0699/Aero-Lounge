import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';

class HeaderDataWidget extends StatelessWidget {
  const HeaderDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: TColors.white,
                border: Border.all(
                  color: TColors.radioBackgroud,
                ),
                boxShadow: [
                  BoxShadow(
                    color: TColors.darkGrey,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Hours',
                  style: TextTheme.of(context).bodySmall?.copyWith(
                        color: TColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  '156.5',
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                        color: TColors.textPrimary,
                        fontWeight: FontWeight.w900,
                      ),
                )
              ],
            ),
          ),
        ),
        SpacerHelper.horizontalSpaceMedium(),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: TColors.white,
                border: Border.all(
                  color: TColors.radioBackgroud,
                ),
                boxShadow: [
                  BoxShadow(
                    color: TColors.darkGrey,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Flights',
                  style: TextTheme.of(context).bodySmall?.copyWith(
                        color: TColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  '42',
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                        color: TColors.textPrimary,
                        fontWeight: FontWeight.w900,
                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
