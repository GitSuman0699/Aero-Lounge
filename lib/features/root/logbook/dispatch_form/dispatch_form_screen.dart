import 'package:aero_lounge/features/root/logbook/dispatch_form/components/dispatch_form.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DispatchFormScreen extends StatefulWidget {
  const DispatchFormScreen({super.key});

  @override
  State<DispatchFormScreen> createState() => _DispatchFormScreenState();
}

class _DispatchFormScreenState extends State<DispatchFormScreen> {
  final dispatchFormFormKey = GlobalKey<FormBuilderState>();

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
        title: Text('Dispatch Form'),
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
                      key: dispatchFormFormKey,
                      child: DispatchForm(),
                    ),
                    SpacerHelper.verticalSpaceExtraLarge(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          dispatchFormFormKey.currentState?.save();
                          if (dispatchFormFormKey.currentState!.validate()) {}
                        },
                        child: Text('Submit'),
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
