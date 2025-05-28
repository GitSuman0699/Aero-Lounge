import 'package:aero_lounge/features/auth/account_review/components/status_widget.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingReviewScreen extends StatefulWidget {
  const BookingReviewScreen({super.key});

  @override
  State<BookingReviewScreen> createState() => _BookingReviewScreenState();
}

class _BookingReviewScreenState extends State<BookingReviewScreen> {
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
        title: Text('Booking Review'),
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
                    SpacerHelper.verticalSpaceMedium(),
                    Text(
                      'Your booking is under review',
                      style: TextTheme.of(context).titleLarge!.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                            color: TColors.textSecondary,
                          ),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    Text(
                      "We're currently reviewing your submitted information. This usually takes 24-48 hours.",
                      style: TTextFormFieldTheme.formTextStyle
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SpacerHelper.verticalSpaceLarge(),
                    StatusWidget(
                      containerColor: TColors.containerLightBlue,
                      borderColor: TColors.borderblue,
                      iconPath: Assets.assetsCreateAccountInformationIcon,
                      title: 'Verification Status',
                      subTitle: 'Submitted on Jan 15, 2025',
                    ),
                    SpacerHelper.verticalSpaceLarge(),
                    StatusWidget(
                      containerColor: TColors.containerLightRed,
                      borderColor: TColors.borderRed,
                      iconPath: Assets.assetsCreateAccountWarningIcon,
                      title: 'Rejected - please update details',
                      subTitle: 'Please review and update your submission',
                    ),
                    SpacerHelper.verticalSpaceExtraLarge(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          // AppDiaLogs.dispatchFormAlertDialog(context);
                          Get.toNamed(AppRoutes.aircraftBookingDetailRoute);
                        },
                        child: Text("Back to Dashboard"),
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
