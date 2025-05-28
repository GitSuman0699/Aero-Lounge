import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FlightReviewScreen extends StatefulWidget {
  const FlightReviewScreen({super.key});

  @override
  State<FlightReviewScreen> createState() => _FlightReviewScreenState();
}

class _FlightReviewScreenState extends State<FlightReviewScreen> {
  final flightFeedbackFormKey = GlobalKey<FormBuilderState>();

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
        title: Text('Flight Rating'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacerHelper.verticalSpaceLarge(),
                  RatingWidget(
                    name: '',
                    label: 'Overall Rating',
                    initialValue: 1,
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  RatingWidget(
                    name: '',
                    label: 'Aircraft Condition',
                    initialValue: 3,
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  RatingWidget(
                    name: '',
                    label: 'Owner Professionalism',
                    initialValue: 2,
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  FormBuilder(
                    key: flightFeedbackFormKey,
                    child: DataFieldWidget(
                      name: 'feedback',
                      label: 'Your Feedback',
                      hintText: 'Share your experience',
                      maxLines: 5,
                    ),
                  ),
                  SpacerHelper.verticalSpaceLarge(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        flightFeedbackFormKey.currentState?.save();
                        if (flightFeedbackFormKey.currentState!.validate()) {}
                      },
                      child: Text('Submit Rating'),
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
