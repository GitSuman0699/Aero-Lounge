import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AircraftCard extends StatelessWidget {
  const AircraftCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: TColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              // color: TColors.grey,
            ),
            child: Image.asset(
              Assets.assetsDashboardAircraftImage,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Text(
                  "Cessna 172",
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                        color: TColors.textSecondary,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Container(
                  height: 20,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: TColors.buttonGreen,
                  ),
                  child: Center(
                    child: Text(
                      "Available",
                      style: TextTheme.of(context).bodySmall?.copyWith(
                            color: TColors.white,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
