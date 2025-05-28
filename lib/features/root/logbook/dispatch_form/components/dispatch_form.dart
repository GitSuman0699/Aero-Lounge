import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DispatchForm extends StatelessWidget {
  const DispatchForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpacerHelper.verticalSpaceLarge(),
        Text(
          'Owner Provided Information',
          style: TextTheme.of(context).titleLarge!.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
                color: TColors.textSecondary,
              ),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'aircraft_tail_number',
          label: 'Aircraft Tail Number',
          hintText: '',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'fuel_capacity',
          label: 'Fuel Capacity (Gallons)',
          hintText: '',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'max_takeoff_weight',
          label: 'Max Takeoff Weight (lbs)',
          hintText: '',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'aircraft_front_seat',
          label: 'Arm - Front Seat',
          hintText: '',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'aircraft_rear_seat',
          label: 'Arm - Rear Seat',
          hintText: '',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'aircraft_baggage_area',
          label: 'Arm - Baggage Area',
          hintText: '',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'aircraft_fuel_tanks',
          label: 'Arm - Fuel Tanks',
          hintText: '',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        SpacerHelper.verticalSpaceLarge(),
        Text(
          'To be filled by the pilot',
          style: TextTheme.of(context).titleLarge!.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
                color: TColors.textSecondary,
              ),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DateFormWidget(
          label: 'Flight Date',
          name: 'flight_date',
          mandatory: true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Flight Date is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'fuel_on_board',
          label: 'Fuel on Board (Gallons)',
          hintText: 'Fuel on Board',
          mandatory: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Fuel on Board is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'pilot_weight',
          label: 'Pilot Weight (lbs)',
          hintText: 'Pilot Weight',
          mandatory: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Pilot Weight is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'co_pilot_weight',
          label: 'Co-Pilot/Passenger Front (lbs)',
          hintText: 'Co-Pilot/Passenger Front',
          mandatory: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Co-Pilot/Passenger Front is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'rear_passenger_weight',
          label: 'Rear Passenger Weight (lbs)',
          hintText: 'Rear Passenger Weight',
          mandatory: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Rear Passenger Weight is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'total_weight',
          label: 'Total Weight (Auto Calculated)',
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Total Weight',
            filled: true,
            fillColor: TColors.lightContainer,
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Total Weight is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'front',
          label: 'Moments (Auto Calculated)',
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Front:',
            filled: true,
            fillColor: TColors.lightContainer,
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Front: is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceExtraSmall(),
        DataFieldWidget(
          name: 'rear',
          label: '',
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Rear:',
            filled: true,
            fillColor: TColors.lightContainer,
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Rear: is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceExtraSmall(),
        DataFieldWidget(
          name: 'baggage',
          label: '',
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Baggage:',
            filled: true,
            fillColor: TColors.lightContainer,
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Baggage: is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceExtraSmall(),
        DataFieldWidget(
          name: 'fuel_tank',
          label: '',
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Fuel Tank:',
            filled: true,
            fillColor: TColors.lightContainer,
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Fuel Tank: is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'total_moment',
          label: 'Total Moment of the Aircraft',
          hintText: 'Moment + Total Weight',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'center_of_gravity',
          label: 'Center of Gravity (CG)',
          hintText: 'Moment + Total Weight',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        SpacerHelper.verticalSpaceMedium(),
        RadioDataField(
          name: 'within_cg',
          label: 'Within CG',
          mandatory: true,
          options: [
            FormBuilderFieldOption(
              value: 'Yes',
              child: Text(
                'Yes',
                style: TTextFormFieldTheme.formTextStyle,
              ),
            ),
            FormBuilderFieldOption(
              value: 'No',
              child: Text(
                'No',
                style: TTextFormFieldTheme.formTextStyle,
              ),
            ),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Within CG is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        RadioDataField(
          name: 'within_weight',
          label: 'Within Weight',
          mandatory: true,
          options: [
            FormBuilderFieldOption(
              value: 'Yes',
              child: Text(
                'Yes',
                style: TTextFormFieldTheme.formTextStyle,
              ),
            ),
            FormBuilderFieldOption(
              value: 'No',
              child: Text(
                'No',
                style: TTextFormFieldTheme.formTextStyle,
              ),
            ),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Within Weight is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        CheckboxDataField(
          name: 'certify',
          label:
              'I certify that this information is completed to best of my knowledge and I have had a CFI review the accuracy of this information',
          mandatory: true,
          options: [
            FormBuilderFieldOption(
              value: 'Yes',
              child: Text(
                'Yes',
                style: TTextFormFieldTheme.formTextStyle,
              ),
            ),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'This Field is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        CheckboxDataField(
          name: 'reviewed',
          label:
              'I have reviewed the current METAR/TAF and confirm flight readiness',
          mandatory: true,
          options: [
            FormBuilderFieldOption(
              value: 'Yes',
              child: Text(
                'Yes',
                style: TTextFormFieldTheme.formTextStyle,
              ),
            ),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'This Field is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'email',
          label: 'Email',
          hintText: 'Enter your email address',
          mandatory: true,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ],
          keyboardType: TextInputType.emailAddress,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: 'Email is required',
              ),
              FormBuilderValidators.email(),
            ],
          ),
        ),
      ],
    );
  }
}
