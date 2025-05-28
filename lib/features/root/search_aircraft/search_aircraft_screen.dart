import 'package:aero_lounge/features/aircraft/aircraft_list_card.dart';
import 'package:aero_lounge/features/root/dashboard/components/search_bar_widget.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';

class SearchAircraftScreen extends StatefulWidget {
  const SearchAircraftScreen({super.key});

  @override
  State<SearchAircraftScreen> createState() => _SearchAircraftScreenState();
}

class _SearchAircraftScreenState extends State<SearchAircraftScreen> {
  final List<Map<String, dynamic>> aircraftList = [
    {
      "aircraftImage": Assets.assetsAircraftAircraft1,
      "status": "Available",
      "title": "Cessna 172 Skyhawk",
      "location": "KSLC",
      "price": "\$150/hr",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "bookmarked": false,
    },
    {
      "aircraftImage": Assets.assetsAircraftAircraft1,
      "status": "Not Available",
      "title": "Cessna 172 Skyhawk",
      "location": "KSLC",
      "price": "\$200/hr",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "bookmarked": false,
    },
    {
      "aircraftImage": Assets.assetsAircraftAircraft1,
      "status": "Available",
      "title": "Cessna 172 Skyhawk",
      "location": "KSLC",
      "price": "\$120/hr",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "bookmarked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox.shrink(),
        title: Text('Search Aircraft'),
      ),
      body: Stack(
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
                  SearchBarWidget(),
                  SpacerHelper.verticalSpaceMedium(),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: ListView.separated(
                            padding: EdgeInsets.only(bottom: 16),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: aircraftList.length,
                            separatorBuilder: (context, index) =>
                                SpacerHelper.verticalSpaceSmall(),
                            itemBuilder: (BuildContext context, int index) {
                              final aircraft = aircraftList[index];
                              return AircraftListCard(aircraft: aircraft);
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
    );
  }
}
