import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ProfileSetup2Form extends StatelessWidget {
  const ProfileSetup2Form({
    super.key,
    required this.profileSetup2FormKey,
  });

  final GlobalKey<FormBuilderState> profileSetup2FormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: profileSetup2FormKey,
      child: Column(
        children: [
          DataFieldWidget(
            name: 'total_logged_hours',
            label: 'Total Logged Hours',
            hintText: 'Enter hours',
            mandatory: true,
            suffixIcon: Icon(Icons.access_time_rounded),
            keyboardType: TextInputType.number,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: 'Total logged hours is required',
              ),
            ]),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataDropDownField(
            mandatory: true,
            initialValue: null,
            name: 'aircraft_types_flown',
            label: 'Aircraft Types Flown',
            hintText: 'Select',
            items: ["Cessna", "Piper", "Beechcraft"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Aircraft types flown is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataDropDownField(
            mandatory: true,
            initialValue: null,
            name: 'recent_flight_time',
            label: 'Recent Flight Time',
            hintText: 'Select',
            items: ["Last 30 days", "Last 60 days", "Last 90 days"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Recent flight time is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'pilot_in_command_hours',
            label: 'Pilot-in-Command Hours',
            hintText: 'Enter hours',
            keyboardType: TextInputType.number,
            suffixIcon: Icon(Icons.access_time_rounded),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'multi_engine_time',
            label: 'Multi-Engine Time',
            hintText: 'Enter hours',
            keyboardType: TextInputType.number,
            suffixIcon: Icon(Icons.access_time_rounded),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'instrument_time',
            label: 'Instrument Time',
            hintText: 'Enter hours',
            keyboardType: TextInputType.number,
            suffixIcon: Icon(Icons.access_time_rounded),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'night_hours',
            label: 'Night Hours',
            hintText: 'Enter hours',
            keyboardType: TextInputType.number,
            suffixIcon: Icon(Icons.access_time_rounded),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'cross_country_time',
            label: 'Cross-Country Time',
            hintText: 'Enter hours',
            keyboardType: TextInputType.number,
            suffixIcon: Icon(Icons.access_time_rounded),
          ),
          SpacerHelper.verticalSpaceMedium(),
        ],
      ),
    );
  }
}
