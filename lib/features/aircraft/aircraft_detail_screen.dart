import 'package:aero_lounge/features/aircraft/components/bottom_bar_widget.dart';
import 'package:aero_lounge/features/aircraft/components/image_view_widget.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AircraftDetailScreen extends StatefulWidget {
  const AircraftDetailScreen({super.key});

  @override
  State<AircraftDetailScreen> createState() => _AircraftDetailScreenState();
}

class _AircraftDetailScreenState extends State<AircraftDetailScreen> {
  final List<Map<String, String>> aircraftSpecs = [
    {
      "label": "Flights",
      "value": "700 mph",
    },
    {
      "label": "Range",
      "value": "7,000 mi",
    },
    {
      "label": "Capacity",
      "value": "19 pax",
    },
  ];

  final List<String> ownerConditions = [
    "Minimum 3-hour booking required",
    "Pet-friendly",
    "Catering available",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      bottomNavigationBar: BottomBarWidget(),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            Assets.assetsCreateAccountBackIcon,
            height: 25,
            width: 25,
          ),
        ),
        title: Text('Aircraft Details'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_rounded,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            BackGroundFiller(),
            Column(
              children: [
                ImageViewWidget(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpacerHelper.verticalSpaceMedium(),
                          Text(
                            'Cessna 172N',
                            style: TextTheme.of(context).titleLarge?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: TColors.textPrimary,
                                ),
                          ),
                          SpacerHelper.verticalSpaceExtraSmall(),
                          Text(
                            'Heavy Jet',
                            style: TextTheme.of(context).labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: TColors.textPrimary,
                                ),
                          ),
                          SpacerHelper.verticalSpace(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: TColors.textPrimary,
                                  ),
                                  SpacerHelper.horizontalSpaceExtraSmall(),
                                  Text(
                                    'KJFK - New York',
                                    style: TextTheme.of(context)
                                        .labelLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: TColors.textPrimary,
                                        ),
                                  )
                                ],
                              ),
                              Text(
                                '(12 miles away)',
                                style:
                                    TextTheme.of(context).labelMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: TColors.textSecondary,
                                        ),
                              )
                            ],
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          Row(
                            children: [
                              for (int i = 0;
                                  i < aircraftSpecs.length;
                                  i++) ...[
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: TColors.white,
                                      border: Border.all(
                                        color: TColors.radioBackgroud,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          aircraftSpecs[i]['label']!,
                                          style: TextTheme.of(context)
                                              .labelMedium
                                              ?.copyWith(
                                                  color: TColors.darkGrey,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          aircraftSpecs[i]['value']!,
                                          style: TextTheme.of(context)
                                              .titleMedium
                                              ?.copyWith(
                                                color: TColors.textSecondary,
                                                fontWeight: FontWeight.w900,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                i == aircraftSpecs.length - 1
                                    ? SizedBox.shrink()
                                    : SpacerHelper.horizontalSpaceSmall(),
                              ],
                            ],
                          ),
                          SpacerHelper.verticalSpaceLarge(),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: TColors.lightContainer,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: TColors.radioBackgroud),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Owner Conditions',
                                  style: TextTheme.of(context)
                                      .titleMedium
                                      ?.copyWith(
                                        color: TColors.textSecondary,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                                SpacerHelper.verticalSpaceMedium(),
                                for (int i = 0;
                                    i < ownerConditions.length;
                                    i++) ...[
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.assetsSubscriptionTickIcon,
                                      ),
                                      SpacerHelper.horizontalSpaceSmall(),
                                      Text(
                                        ownerConditions[i],
                                        style: TextTheme.of(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: TColors.textSecondary,
                                            ),
                                      ),
                                    ],
                                  ),
                                  i == ownerConditions.length - 1
                                      ? SizedBox.shrink()
                                      : SpacerHelper.verticalSpaceSmall(),
                                ],
                                SpacerHelper.verticalSpaceMedium(),
                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton(
                                    style: TOutlinedButtonTheme
                                        .lightOutlinedButtonTheme.style
                                        ?.copyWith(
                                      padding: WidgetStatePropertyAll(
                                        EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 13),
                                      ),
                                      backgroundColor: WidgetStateProperty.all(
                                          TColors.lightContainer),
                                      textStyle: WidgetStatePropertyAll(
                                        TTextTheme.lightTextTheme.titleMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.5,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Check Availability',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SpacerHelper.verticalSpaceMedium(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
