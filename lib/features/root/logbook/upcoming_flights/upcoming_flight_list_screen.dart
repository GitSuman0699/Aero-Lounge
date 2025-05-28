import 'package:aero_lounge/features/root/logbook/upcoming_flights/components/upcoming_flights_card.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UpcomingFlightListScreen extends StatefulWidget {
  const UpcomingFlightListScreen({super.key});

  @override
  State<UpcomingFlightListScreen> createState() =>
      _UpcomingFlightListScreenState();
}

class _UpcomingFlightListScreenState extends State<UpcomingFlightListScreen> {
  final List<Map<String, dynamic>> flightBookings = [
    {
      "title": "Cross Country",
      "aircraft": "Cessna 172S",
      "date": "March 15, 2025",
      "time": "09:00 AM - 11:00 AM",
      "status": "Confirmed",
      "actions": ["Cancel", "Fill Dispatch"],
    },
    {
      "title": "Local Training",
      "aircraft": "Piper PA-28",
      "date": "May 2, 2025",
      "time": "10:00 AM - 11:00 AM",
      "status": "Pending",
      "actions": ["Cancel", "Check In"],
    },
    {
      "title": "Night Flight",
      "aircraft": "Cessna 182T",
      "date": "May 5, 2025",
      "time": "09:00 PM - 11:00 PM",
      "status": "Confirmed",
      "actions": ["Add a review", "Check Out"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              Assets.assetsCreateAccountBackIcon,
              height: 25,
              width: 25,
            )),
        centerTitle: true,
        title: Text('Upcoming Flights'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
              color: TColors.buttonPrimary,
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
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SpacerHelper.verticalSpaceMedium()),
                  SliverToBoxAdapter(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: flightBookings.length,
                      separatorBuilder: (context, index) =>
                          SpacerHelper.verticalSpaceSmall(),
                      itemBuilder: (context, index) {
                        final data = flightBookings[index];
                        return UpComingFlightsCard(data: data);
                      },
                    ),
                  ),
                  SliverToBoxAdapter(child: SpacerHelper.verticalSpaceMedium()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
