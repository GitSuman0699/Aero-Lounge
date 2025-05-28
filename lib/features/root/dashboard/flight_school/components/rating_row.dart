import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "4.8",
          style: TextTheme.of(context).bodyMedium?.copyWith(
                color: TColors.textPrimary,
                fontWeight: FontWeight.w900,
              ),
        ),
        SpacerHelper.horizontalSpaceSmall(),
        RatingBar.builder(
          initialRating: 4.5,
          minRating: 1,
          maxRating: 5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 14,
          unratedColor: TColors.hintText,
          itemBuilder: (context, _) => SvgPicture.asset(
            Assets.assetsDashboardRatingStarIcon,
            height: 14,
            width: 14,
          ),
          onRatingUpdate: (rating) {},
        ),
        SpacerHelper.horizontalSpaceSmall(),
        Text(
          '(124 reviews)',
          style: TextTheme.of(context).titleSmall?.copyWith(
                color: TColors.textSecondary,
                fontWeight: FontWeight.w300,
              ),
        )
      ],
    );
  }
}
