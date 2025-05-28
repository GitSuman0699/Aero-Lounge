import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AircraftListCard extends StatelessWidget {
  const AircraftListCard({
    super.key,
    required this.aircraft,
  });

  final Map<String, dynamic> aircraft;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.aircraftDetailRoute);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image with bookmark
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    aircraft['aircraftImage'],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: -5,
                  right: 0,
                  child: aircraft['bookmarked']
                      ? Image.asset(
                          Assets.assetsAircraftBookmarkActiveIcon,
                          height: 40,
                        )
                      : Image.asset(
                          Assets.assetsAircraftBookmarkInactiveIcon,
                          height: 40,
                        ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: aircraft['status'] == "Available"
                            ? TColors.buttonGreen
                            : TColors.buttonRed,
                      ),
                      child: Text(
                        aircraft['status'],
                        style: TextTheme.of(context).bodySmall?.copyWith(
                              color: TColors.white,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: TColors.dialogBackground,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.assetsAircraftAirportRadarIcon,
                            height: 20,
                          ),
                          SpacerHelper.horizontalSpaceExtraSmall(),
                          Text(
                            aircraft['location'],
                            style: TextTheme.of(context).bodySmall?.copyWith(
                                  color: TColors.textSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          aircraft['title'],
                          style: TextTheme.of(context).titleLarge?.copyWith(
                                color: TColors.textSecondary,
                                fontWeight: FontWeight.w900,
                                fontSize: 17,
                              ),
                        ),
                      ),
                      Text(
                        aircraft['price'],
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                              color: TColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    ],
                  ),

                  SpacerHelper.verticalSpaceSmall(),
                  Text(
                    aircraft['description'],
                    style: TextTheme.of(context).labelMedium?.copyWith(
                          color: TColors.darkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
