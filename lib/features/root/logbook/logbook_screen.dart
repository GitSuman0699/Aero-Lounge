import 'package:aero_lounge/utils/constants/widgets/section_heading_widget.dart';
import 'package:aero_lounge/features/root/logbook/components/add_flight_log_button.dart';
import 'package:aero_lounge/features/root/logbook/components/header_data_widget.dart';
import 'package:aero_lounge/features/root/logbook/components/upcoming_flight_card.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/constants/widgets/section_heading_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogbookScreen extends StatefulWidget {
  const LogbookScreen({super.key});

  @override
  State<LogbookScreen> createState() => _LogbookScreenState();
}

class _LogbookScreenState extends State<LogbookScreen> {
  final List<Map<String, dynamic>> flightData = [
    {
      "date": "Jan 15, 2025",
      "duration": "2.5 hrs",
      "start_airport": "LAX",
      "end_airport": "SFO",
      "aircraft": "Boeing 737-800",
    },
    {
      "date": "Jan 12, 2025",
      "duration": "1.8 hrs",
      "start_airport": "SFO",
      "end_airport": "SEA",
      "aircraft": "Airbus A320",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox.shrink(),
        title: Text('Logbook'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset(
              Assets.assetsRootFilterIcon,
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          BackGroundFiller(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpacerHelper.verticalSpaceMedium(),
                    SpacerHelper.verticalSpaceExtraSmall(),
                    HeaderDataWidget(),
                    SpacerHelper.verticalSpaceLarge(),
                    AddFlightLogButton(),
                    SpacerHelper.verticalSpaceLarge(),
                    SectionHeadingRow(
                      widget1: SectionHeadingWidget(title: "Upcoming Flights"),
                      widget2: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.upcomingFlightListRoute);
                        },
                        child: Text(
                          "See all",
                          style: TextTheme.of(context).bodySmall?.copyWith(
                                color: TColors.buttonPrimary,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                        ),
                      ),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    SizedBox(
                      height: 230,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: flightData.length,
                        itemBuilder: (context, index) {
                          final data = flightData[index];
                          return UpcomingFlightCard(data: data);
                        },
                        separatorBuilder: (context, index) {
                          return SpacerHelper.verticalSpaceSmall();
                        },
                      ),
                    ),
                    SpacerHelper.verticalSpaceLarge(),
                    SectionHeadingRow(
                      widget1: SectionHeadingWidget(title: "Recent Flights"),
                      widget2: Row(
                        children: [
                          SvgPicture.asset(Assets.assetsRootFilterIcon,
                              height: 16, width: 16),
                          SpacerHelper.horizontalSpaceExtraSmall(),
                          Text(
                            "Filter",
                            style: TextTheme.of(context).bodySmall?.copyWith(
                                  color: TColors.buttonPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    SizedBox(
                      height: 230,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: flightData.length,
                        itemBuilder: (context, index) {
                          final data = flightData[index];
                          return UpcomingFlightCard(data: data);
                        },
                        separatorBuilder: (context, index) {
                          return SpacerHelper.verticalSpaceSmall();
                        },
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
    );
  }
}
