import 'package:aero_lounge/features/aircraft/aircraft_list_card.dart';
import 'package:aero_lounge/features/root/dashboard/components/dashboard_header.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';

class SavedAircraftScreen extends StatefulWidget {
  const SavedAircraftScreen({super.key});

  @override
  State<SavedAircraftScreen> createState() => _SavedAircraftScreenState();
}

class _SavedAircraftScreenState extends State<SavedAircraftScreen> {
  final List<Map<String, dynamic>> aircraftList = [
    {
      "aircraftImage": Assets.assetsAircraftAircraft1,
      "status": "Available",
      "title": "Cessna 172 Skyhawk",
      "location": "KSLC",
      "price": "\$150/hr",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "bookmarked": true,
    },
    {
      "aircraftImage": Assets.assetsAircraftAircraft2,
      "status": "Not Available",
      "title": "Bombardier 650 Jet",
      "location": "KSLC",
      "price": "\$200/hr",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "bookmarked": true,
    },
    {
      "aircraftImage": Assets.assetsAircraftAircraft3,
      "status": "Available",
      "title": "Cropduster plane",
      "location": "KSLC",
      "price": "\$120/hr",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "bookmarked": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading: SizedBox.shrink(),
      //   title: Text('Saved Aircraft'),
      // ),
      body: Column(
        children: [
          HeaderWidget(title: "John’s Saved Aircrafts"),
          Expanded(
            child: Container(
              color: TColors.scaffoldBackground,
              child: Stack(
                children: [
                  BackGroundFiller(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SpacerHelper.verticalSpaceMedium(),
                          Expanded(
                            child: CustomScrollView(
                              slivers: [
                                SliverToBoxAdapter(
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(bottom: 16),
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: aircraftList.length,
                                    separatorBuilder: (context, index) =>
                                        SpacerHelper.verticalSpaceSmall(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final aircraft = aircraftList[index];
                                      return AircraftListCard(
                                          aircraft: aircraft);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
