import 'package:aero_lounge/features/root/logbook/upcoming_flights/components/flight_check_in_form.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/constants/widgets/icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FlightCheckInScreen extends StatefulWidget {
  const FlightCheckInScreen({super.key});

  @override
  State<FlightCheckInScreen> createState() => _FlightCheckInScreenState();
}

class _FlightCheckInScreenState extends State<FlightCheckInScreen> {
  final flightCheckInFormKey = GlobalKey<FormBuilderState>();

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
          ),
        ),
        centerTitle: true,
        title: Text('Check In'),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlightCheckInForm(
                        flightCheckInFormKey: flightCheckInFormKey),
                    SpacerHelper.verticalSpaceMedium(),
                    IconTextButtonWidget(
                      onPressed: () {
                        Get.toNamed(
                          AppRoutes.addSquawkRoute,
                        );
                      },
                      widget1: Text(
                        'Report Aircraft Squawks',
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                              color: TColors.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      widget2: Icon(
                        Icons.add,
                        size: 28,
                        color: TColors.textPrimary,
                      ),
                    ),
                    SpacerHelper.verticalSpaceLarge(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          flightCheckInFormKey.currentState?.save();
                          if (flightCheckInFormKey.currentState!.validate()) {}
                        },
                        child: Text('Continue to Details'),
                      ),
                    ),
                    SpacerHelper.verticalSpaceLarge(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
