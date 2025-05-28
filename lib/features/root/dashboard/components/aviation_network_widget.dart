import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AviationNetworkWidget extends StatelessWidget {
  const AviationNetworkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 2; i++) ...[
          Padding(
            padding: EdgeInsets.only(
              left: i == 1 ? 8.0 : 0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.34,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: TColors.lightContainer,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    i == 0
                        ? Assets.assetsDashboardFlightClubIcon
                        : Assets.assetsDashboardStudyGroupIcon,
                    height: 40,
                    width: 40,
                  ),
                  SpacerHelper.verticalSpaceSmall(),
                  Text(
                    i == 0 ? "Flight Club" : "Study Group",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextTheme.of(context).headlineSmall?.copyWith(
                          color: TColors.textSecondary,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraSmall(),
                  Text(
                    i == 0 ? "15 members" : "8 members",
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                          color: TColors.textSecondary,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ],
    );
  }
}
