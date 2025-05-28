import 'package:aero_lounge/features/root/logbook/flight_log/components/add_flight_log_form.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/constants/widgets/icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddFlightLogScreen extends StatefulWidget {
  const AddFlightLogScreen({super.key});

  @override
  State<AddFlightLogScreen> createState() => _AddFlightLogScreenState();
}

class _AddFlightLogScreenState extends State<AddFlightLogScreen> {
  final addFlightLogFormKey = GlobalKey<FormBuilderState>();

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
        title: Text('Flight Log'),
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
                    FormBuilder(
                      key: addFlightLogFormKey,
                      child: AddFlightLogForm(),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    IconTextButtonWidget(
                      onPressed: () {},
                      widget1: Text(
                        'Add new crew / passenger',
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
                          addFlightLogFormKey.currentState?.save();
                          if (addFlightLogFormKey.currentState!.validate()) {}
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
