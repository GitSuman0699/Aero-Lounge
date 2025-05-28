import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileSetup4Form extends StatelessWidget {
  const ProfileSetup4Form({
    super.key,
    required this.profileSetup4FormKey,
  });

  final GlobalKey<FormBuilderState> profileSetup4FormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: profileSetup4FormKey,
      child: Column(
        children: [
          DataDropDownField(
            name: 'what_brings_you_to_aerolounge',
            label: 'What brings you to AeroLounge?',
            hintText: 'Select',
            items: ["Flight Training", "Aircraft Rental", "Charter Services"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'aircraft_you_are_most_interested_in_flying',
            label: 'Aircraft you’re most interested in flying',
            hintText: 'Enter aircraft',
            keyboardType: TextInputType.text,
          ),
          SpacerHelper.verticalSpaceMedium(),
          DateFormWidget(
            name: 'availability_preferred_schedule',
            label: 'Availability/Preferred Schedule',
          ),
          SpacerHelper.verticalSpaceMedium(),
          RadioDataField(
            name: 'mentorship',
            label: 'Open to mentorship or flight-sharing?',
            options: [
              FormBuilderFieldOption(
                value: 'Yes',
                child: Text(
                  "Yes",
                  style: TTextFormFieldTheme.formTextStyle,
                ),
              ),
              FormBuilderFieldOption(
                value: 'No',
                child: Text(
                  "No",
                  style: TTextFormFieldTheme.formTextStyle,
                ),
              ),
            ],
          ),
          SpacerHelper.verticalSpaceMedium(),
          RadioDataField(
            name: 'discoverable',
            label: 'Discoverable to other pilots in your area?',
            options: [
              FormBuilderFieldOption(
                value: 'Yes',
                child: Text(
                  "Yes",
                  style: TTextFormFieldTheme.formTextStyle,
                ),
              ),
              FormBuilderFieldOption(
                value: 'No',
                child: Text(
                  "No",
                  style: TTextFormFieldTheme.formTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
