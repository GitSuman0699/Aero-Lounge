import 'package:aero_lounge/features/auth/account_review/components/support_link.dart';
import 'package:aero_lounge/features/root/logbook/upcoming_flights/components/add_squawk_form.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddSquawkScreen extends StatefulWidget {
  const AddSquawkScreen({super.key});

  @override
  State<AddSquawkScreen> createState() => _AddSquawkScreenState();
}

class _AddSquawkScreenState extends State<AddSquawkScreen> {
  final addSquawkFormKey = GlobalKey<FormBuilderState>();

  final List<String> squawkCategories = [
    'Airframe',
    'Avionics',
    'Electrical',
    'Engine/Powerplant',
    'Flight Controls',
    'Hydraulics',
    'Landing Gear',
    'Fuel System',
    'Cabin/Interior',
    'Navigation',
    'Oil System',
    'Safety Equipment',
    'Other',
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
          ),
        ),
        centerTitle: true,
        title: Text('Add Squawk'),
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
                    AddSquawkForm(
                        addSquawkFormKey: addSquawkFormKey,
                        squawkCategories: squawkCategories),
                    SpacerHelper.verticalSpaceExtraLarge(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          addSquawkFormKey.currentState?.save();
                          if (addSquawkFormKey.currentState!.validate()) {}
                        },
                        child: Text('Submit Squawk'),
                      ),
                    ),
                    SpacerHelper.verticalSpaceLarge(),
                    SupportLink(),
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
