import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FlightSchoolProfilePicture extends StatelessWidget {
  const FlightSchoolProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -55,
      left: 24,
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(
          color: TColors.white,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(Assets.assetsDashboardTwinPlaneImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
