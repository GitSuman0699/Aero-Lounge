import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ProfileSetup5Form extends StatelessWidget {
  const ProfileSetup5Form({
    super.key,
    required this.profileSetup5FormKey,
  });

  final GlobalKey<FormBuilderState> profileSetup5FormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: profileSetup5FormKey,
      child: Column(
        children: [
          DataFieldWidget(
            name: 'emergency_contact_name',
            label: 'Emergency Contact Name',
            hintText: 'Enter contact name',
            keyboardType: TextInputType.name,
          ),
          SpacerHelper.verticalSpaceMedium(),
          DataFieldWidget(
            name: 'emergency_contact_number',
            label: 'Emergency Contact Phone Number',
            hintText: '+1 (555) 000-0000',
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: FormBuilderValidators.compose(
              [
                (value) {
                  if (value != null) {
                    // Regular expression for US phone numbers
                    final usPhoneRegex = RegExp(
                        r'^(\+1|1)?[\s-]?\(?[0-9]{3}\)?[\s-]?[0-9]{3}[\s-]?[0-9]{4}$');

                    // Remove all non-digit characters for validation
                    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

                    if (digitsOnly.length != 10) {
                      return 'US phone numbers must have 10 digits';
                    }

                    if (!usPhoneRegex.hasMatch(value)) {
                      return 'Enter a valid US phone number';
                    }
                  }
                  return null;
                },
              ],
            ),
          ),
          // SpacerHelper.verticalSpaceMedium(),
          // DataFieldWidget(
          //   name: 'operational_limitations',
          //   label:
          //       'Operational limitations, schedule notes, or flying conditions?',
          //   hintText: 'Enter notes',
          //   keyboardType: TextInputType.text,
          //   maxLines: 4,
          // ),
        ],
      ),
    );
  }
}
