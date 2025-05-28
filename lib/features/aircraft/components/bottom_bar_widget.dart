import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: TColors.lightGrey,
      height: 74,
      elevation: 5,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Starting from',
                    style: TextTheme.of(context).labelLarge?.copyWith(
                          color: TColors.darkGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraSmall(),
                  Text(
                    '\$233.50/hr',
                    style: TextTheme.of(context).titleLarge?.copyWith(
                          color: TColors.textSecondary,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                  )
                ],
              ),
            ),
          ),
          SpacerHelper.horizontalSpaceSmall(),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.aircraftBookingRoute);
              },
              child: Text('Request Booking'),
            ),
          ),
        ],
      ),
    );
  }
}
