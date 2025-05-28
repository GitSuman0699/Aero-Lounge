import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddFlightLogForm extends StatelessWidget {
  const AddFlightLogForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpacerHelper.verticalSpaceLarge(),
        DateFormWidget(
          label: 'Date',
          name: 'date',
          mandatory: true,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Date is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataDropDownField(
          name: 'aircraft',
          label: 'Aircraft',
          hintText: 'Select Aircraft',
          mandatory: true,
          items: [
            DropdownMenuItem(
              value: 'Cesna 172',
              child: Text('Cesna 172'),
            ),
            DropdownMenuItem(
              value: 'Boeing 737',
              child: Text('Boeing 737'),
            ),
            DropdownMenuItem(
              value: 'Aircraft 3',
              child: Text('Aircraft 3'),
            ),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Aircraft is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataDropDownField(
          name: 'tail_number',
          label: 'Tail Number',
          hintText: 'Select Tail Number',
          mandatory: true,
          items: [
            DropdownMenuItem(
              value: 'Cesna 172',
              child: Text('Cesna 172'),
            ),
            DropdownMenuItem(
              value: 'Boeing 737',
              child: Text('Boeing 737'),
            ),
            DropdownMenuItem(
              value: 'Aircraft 3',
              child: Text('Aircraft 3'),
            ),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Tail Number is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'total_time',
          label: 'Total Time',
          hintText: 'Enter Total Time',
          mandatory: true,
          suffixIcon: Icon(Icons.access_time),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Total Time is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'pic',
          label: 'PIC',
          hintText: 'Enter PIC',
          mandatory: true,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'PIC is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'simulated_instrument_time',
          label: 'Simulated Instrument Time',
          hintText: 'Enter Simulated Instrument Time',
          mandatory: true,
          suffixIcon: Icon(Icons.access_time),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Simulated Instrument Time is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'actual_instrument_time',
          label: 'Actual Instrument Time',
          hintText: 'Enter Actual Instrument Time',
          mandatory: true,
          suffixIcon: Icon(Icons.access_time),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Actual Instrument Time is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'dual_received_time',
          label: 'Dual Received Time',
          hintText: 'Enter Dual Received Time',
          mandatory: true,
          suffixIcon: Icon(Icons.access_time),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Dual Received Time is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'solo',
          label: 'Solo',
          hintText: 'Enter Solo',
          mandatory: true,
          suffixIcon: Icon(Icons.access_time),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Solo is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'cross_country',
          label: 'Cross Country',
          hintText: 'Enter Cross Country',
          mandatory: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Cross Country is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'day_takeoffs',
          label: 'Day Takeoffs',
          hintText: '0',
          mandatory: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Day Takeoffs is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataDropDownField(
          name: 'person',
          label: 'Person',
          hintText: 'Select Person',
          mandatory: true,
          items: [
            DropdownMenuItem(
              value: 'Person 1',
              child: Text('Person 1'),
            ),
            DropdownMenuItem(
              value: 'Person 2',
              child: Text('Person 2'),
            ),
            DropdownMenuItem(
              value: 'Person 3',
              child: Text('Person 3'),
            ),
          ],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: 'Person is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'day_landings',
          label: 'Day Landings Full Stop',
          hintText: '0',
          mandatory: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Day Landings Full Stop is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'night_takeoffs',
          label: 'Night Takeoffs',
          hintText: '0',
          mandatory: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Night Takeoffs is required'),
          ]),
        ),
        SpacerHelper.verticalSpaceMedium(),
        DataFieldWidget(
          name: 'night_landings',
          label: 'Night Landings Full Stop',
          hintText: '0',
          mandatory: true,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: 'Night Landings Full Stop is required'),
          ]),
        ),
      ],
    );
  }
}
