import 'package:aero_lounge/features/root/dashboard/components/aircraft_widget.dart';
import 'package:aero_lounge/features/root/dashboard/components/dashboard_header.dart';
import 'package:aero_lounge/features/root/dashboard/components/flight_schools_widget.dart';
import 'package:aero_lounge/features/root/dashboard/components/search_bar_widget.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/widgets/section_heading_widget.dart';
import 'package:aero_lounge/features/root/dashboard/components/upcoming_flight_widget.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Map<String, String>> flights = [
    {
      'title': 'Cross Country Flight',
      'date': 'Jan 15, 2025 •',
      'time': '2:00 PM',
      'status': 'Confirmed',
    },
    {
      'title': 'Cross Country Flight',
      'date': 'Jan 21, 2025 •',
      'time': '2:30 PM',
      'status': 'Confirmed',
    },
    {
      'title': 'Cross Country Flight',
      'date': 'Feb 11, 2025 •',
      'time': '1:00 PM',
      'status': 'Confirmed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: Column(
        children: [
          HeaderWidget(title: "John’s Dashboard"),
          Expanded(
            child: Container(
              color: TColors.scaffoldBackground,
              child: Stack(
                children: [
                  BackGroundFiller(),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpacerHelper.verticalSpaceMedium(),
                            SearchBarWidget(),
                            SpacerHelper.verticalSpaceLarge(),
                            SectionHeadingWidget(title: "Aircrafts in My Area"),
                            SpacerHelper.verticalSpaceSmall(),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 200,
                                minHeight: 175,
                              ),
                              child: SizedBox(
                                height: 175,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ImageTextCard(
                                      imagePath: Assets
                                          .assetsDashboardAircraftZoomedOutImage,
                                      widget: Text(
                                        "Cessna 172",
                                        style: TextTheme.of(context)
                                            .bodyMedium
                                            ?.copyWith(
                                              color: TColors.textSecondary,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                    );
                                  },
                                  itemCount: 5,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SpacerHelper.horizontalSpace(10);
                                  },
                                ),
                              ),
                            ),
                            SpacerHelper.verticalSpaceLarge(),
                            SectionHeadingWidget(title: "Upcoming Flights"),
                            SpacerHelper.verticalSpaceSmall(),
                            ListView.separated(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = flights[index];
                                return UpcomingFlightWidget(data: data);
                              },
                              itemCount: 3,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SpacerHelper.verticalSpace(10);
                              },
                            ),
                            SpacerHelper.verticalSpaceLarge(),
                            SectionHeadingWidget(
                                title: "Your Aviation Network"),
                            SpacerHelper.verticalSpaceSmall(),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 200,
                                minHeight: 175,
                              ),
                              child: SizedBox(
                                height: 190,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ImageTextCard(
                                      imagePath:
                                          Assets.assetsDashboardDanceImage,
                                      widget: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dance Class",
                                            style: TextTheme.of(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: TColors.textSecondary,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          SpacerHelper
                                              .verticalSpaceExtraSmall(),
                                          Text(
                                            'Learn how to dance',
                                            style: TextTheme.of(context)
                                                .labelMedium
                                                ?.copyWith(
                                                    color:
                                                        TColors.textSecondary),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: 5,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SpacerHelper.horizontalSpace(10);
                                  },
                                ),
                              ),
                            ),
                            SpacerHelper.verticalSpaceLarge(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SectionHeadingWidget(
                                    title: "Explore Flight Schools"),
                                Text(
                                  "See all",
                                  style:
                                      TextTheme.of(context).bodySmall?.copyWith(
                                            color: TColors.buttonPrimary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),
                                )
                              ],
                            ),
                            SpacerHelper.verticalSpaceSmall(),
                            FlightSchoolsWidget(),
                            SpacerHelper.verticalSpaceMedium(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
