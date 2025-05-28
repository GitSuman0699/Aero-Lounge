import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class ProfileSetup1Form extends StatelessWidget {
  const ProfileSetup1Form({
    super.key,
    required this.profileSetup1FormKey,
  });

  final GlobalKey<FormBuilderState> profileSetup1FormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: profileSetup1FormKey,
      child: Column(
        children: [
          DataDropDownField(
            mandatory: true,
            initialValue: null,
            name: 'pilot_certificate_type',
            label: 'Pilot Certificate Type',
            hintText: 'Select',
            items:
                ["Private Pilot", "Commercial Pilot", "Airline Transport Pilot"]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Pilot certificate type is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'pilot_certificate_number',
            label: 'Pilot Certificate Number',
            mandatory: true,
            hintText: 'Enter certificate number',
            keyboardType: TextInputType.text,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Pilot certificate number is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DateFormWidget(
            label: 'Pilot Certificate Issued',
            name: "pilot_certificate_issued",
            mandatory: true,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Medical certificate class is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DateFormWidget(
            label: 'Medical Certificate Issued',
            name: "medical_certificate_issued",
            mandatory: true,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Medical certificate issued is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceExtraSmall(),
          CheckboxDataField(
            name: 'basic_med',
            label: '',
            options: [
              FormBuilderFieldOption(
                value: 'Basic Med',
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Basic Med',
                    style: TTextFormFieldTheme.formTextStyle,
                  ),
                ),
              ),
            ],
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'medical_certificate_class',
            label: 'Medical Certificate Class',
            mandatory: true,
            hintText: 'Enter medical certificate class',
            keyboardType: TextInputType.text,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Medical certificate class is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DateFormWidget(
            label: 'Medical Expiration Date',
            name: "neda_expiration_date",
            mandatory: true,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Medical expiration date is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          MultiSelectDropDownField(
            name: '',
            label: 'Ratings Held',
            mandatory: true,
            items: ["Instrument", "Multi-engine", "Seaplane"]
                .map(
                  (e) => DropdownItem(
                    value: e,
                    label: e,
                  ),
                )
                .toList(),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Ratings held is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          MultiSelectDropDownField(
            name: '',
            label: 'Specialized Training',
            items:
                ['Aerobatics', 'Mountain Flying', 'Formation Flying', 'Other']
                    .map(
                      (e) => DropdownItem(
                        value: e,
                        label: e,
                      ),
                    )
                    .toList(),
          ),
          SpacerHelper.verticalSpaceMedium(),
          MultiSelectDropDownField(
            name: '',
            label: 'Additional Safety Training',
            items: [
              'FAA WINGS Credit Course',
              'AOPA Safety Institute Course',
              'Simulator-Based Safety Scenarios'
            ]
                .map(
                  (e) => DropdownItem(
                    value: e,
                    label: e,
                  ),
                )
                .toList(),
          ),
          SpacerHelper.verticalSpaceMedium(),
          CheckboxDataField(
            name: 'instrument_rating',
            label: 'Instrument Rating',
            options: [
              FormBuilderFieldOption(
                value: 'Instrument - Airplane',
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Instrument - Airplane',
                    style: TTextFormFieldTheme.formTextStyle,
                  ),
                ),
              ),
            ],
          ),
          SpacerHelper.verticalSpaceMedium(),
          DateFormWidget(
            label: 'Last Flight Review Date',
            name: "last_flight_review_date",
            mandatory: true,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Flight review date is required',
                ),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataDropDownField(
            initialValue: null,
            name: 'tsa_clearance',
            label: 'TSA Clearance',
            hintText: 'Select',
            items: ["Yes", "No"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataDropDownField(
            initialValue: null,
            name: 'category_class_ratings',
            label: 'Category & Class Ratings',
            hintText: 'Select',
            items: ["Yes", "No"]
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
          ),
          SpacerHelper.verticalSpaceMedium(),
        ],
      ),
    );
  }
}
