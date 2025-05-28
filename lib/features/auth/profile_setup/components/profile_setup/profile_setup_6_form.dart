import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileSetup6Form extends StatelessWidget {
  const ProfileSetup6Form({
    super.key,
    required this.profileSetup6FormKey,
  });

  final GlobalKey<FormBuilderState> profileSetup6FormKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: profileSetup6FormKey,
      child: Column(
        children: [
          DataDropDownField(
            name: 'who_can_view_your_profile',
            label: 'Who can view your profile?',
            hintText: 'Select',
            items: ['Everyone', 'Only me']
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
          ),
          SpacerHelper.verticalSpaceMedium(),
          CheckboxDataField(
            name: 'email_notification_preferences',
            label: 'Email and notification preferences',
            options: [
              FormBuilderFieldOption(
                value: 'Platform updates',
                child: Text(
                  'Platform updates',
                  style: TTextFormFieldTheme.formTextStyle,
                ),
              ),
              FormBuilderFieldOption(
                value: 'Networking invites',
                child: Text(
                  'Networking invites',
                  style: TTextFormFieldTheme.formTextStyle,
                ),
              ),
              FormBuilderFieldOption(
                value: 'Flight alerts',
                child: Text(
                  'Flight alerts',
                  style: TTextFormFieldTheme.formTextStyle,
                ),
              ),
              FormBuilderFieldOption(
                value: 'Newsletter',
                child: Text(
                  'Newsletter',
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
