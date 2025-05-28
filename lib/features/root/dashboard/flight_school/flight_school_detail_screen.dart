import 'package:aero_lounge/features/root/dashboard/flight_school/components/aircraft_card.dart';
import 'package:aero_lounge/features/root/dashboard/flight_school/components/flight_school_header.dart';
import 'package:aero_lounge/features/root/dashboard/flight_school/components/flight_school_profile_picture.dart';
import 'package:aero_lounge/features/root/dashboard/flight_school/components/rating_row.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightSchoolDetailScreen extends StatefulWidget {
  const FlightSchoolDetailScreen({super.key});

  @override
  State<FlightSchoolDetailScreen> createState() =>
      _FlightSchoolDetailScreenState();
}

class _FlightSchoolDetailScreenState extends State<FlightSchoolDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: TColors.lightGrey,
        height: 74,
        elevation: 5,
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: Text('Rate School'),
              ),
            ),
            SpacerHelper.horizontalSpaceSmall(),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.flightSchoolSendInquiryRoute);
                },
                child: Text('Send Inquiry'),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                Assets.assetsSplashSplashCloudImage,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacerHelper.verticalSpaceMedium(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: BackButtonWidget(),
                ),
                SpacerHelper.verticalSpaceLarge(),
                SpacerHelper.verticalSpaceExtraLarge(),
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: TColors.grey,
                          image: DecorationImage(
                            image: AssetImage(
                                Assets.assetsOnboardOnboardBackground),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlightSchoolHeader(),
                              SpacerHelper.verticalSpaceMedium(),
                              SpacerHelper.verticalSpaceMedium(),
                              RatingRow(),
                              SpacerHelper.verticalSpaceMedium(),
                              SpacerHelper.verticalSpaceMedium(),
                              Text(
                                "About",
                                style:
                                    TextTheme.of(context).titleLarge?.copyWith(
                                          color: TColors.textPrimary,
                                          fontWeight: FontWeight.w900,
                                        ),
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              Text(
                                'Premier flight training facility with over 20 years of experience. FAA-certified instructors and modern fleet of training aircraft.',
                                style:
                                    TextTheme.of(context).titleSmall?.copyWith(
                                          color: TColors.textPrimary,
                                          fontWeight: FontWeight.w500,
                                        ),
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              Text(
                                "Aircrafts",
                                style:
                                    TextTheme.of(context).titleLarge?.copyWith(
                                          color: TColors.textPrimary,
                                          fontWeight: FontWeight.w900,
                                        ),
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              Expanded(
                                child: ListView.separated(
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return AircraftCard();
                                  },
                                  padding: EdgeInsets.only(top: 4),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SpacerHelper.verticalSpaceMedium();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      FlightSchoolProfilePicture()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
