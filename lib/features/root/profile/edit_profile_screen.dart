import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final editProfileFormKey = GlobalKey<FormBuilderState>();

  List<String> selectedCertificates = <String>[];

  final List<String> pilotCertificates = [
    'ATP',
    'Commercial',
    'Instrument',
    'Multi-Engine',
  ];
  final List<String> geographyTags = [
    'North America',
    'Europe',
    'Asia',
    'Africa',
  ];

  final List<String> flyingBasesUSA = [
    "KSNA - John Wayne Airport, California",
    "KAPA - Centennial Airport, Colorado",
    "KFXE - Fort Lauderdale Executive Airport, Florida",
    "KSDL - Scottsdale Airport, Arizona",
    "KPDX - Portland International Airport, Oregon",
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
        title: Text('Edit Profile'),
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
                    SpacerHelper.verticalSpaceLarge(),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: TColors.lightGrey,
                        backgroundImage:
                            AssetImage(Assets.assetsLoginUserProfilePicture),
                      ),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: TColors.textPrimary,
                          size: 20,
                        ),
                        SpacerHelper.horizontalSpaceExtraSmall(),
                        Text(
                          'Edit Photo',
                          style: TextTheme.of(context).titleSmall?.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ],
                    ),
                    FormBuilder(
                      key: editProfileFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpacerHelper.verticalSpaceLarge(),
                          DataFieldWidget(
                            name: 'full_name',
                            label: 'Full Name',
                            hintText: 'Enter Full Name',
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                          SpacerHelper.verticalSpaceMedium(),
                          DataFieldWidget(
                            name: 'phone_number',
                            label: 'Phone Number',
                            hintText: '+1 (555) 000-0000',
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: 'Mobile number is required',
                                ),
                                FormBuilderValidators.minLength(10,
                                    errorText:
                                        'Mobile number must be at least 10 characters'),
                                (value) {
                                  if (value != null) {
                                    // Regular expression for US phone numbers
                                    final usPhoneRegex = RegExp(
                                        r'^(\+1|1)?[\s-]?\(?[0-9]{3}\)?[\s-]?[0-9]{3}[\s-]?[0-9]{4}$');

                                    // Remove all non-digit characters for validation
                                    final digitsOnly =
                                        value.replaceAll(RegExp(r'[^\d]'), '');

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
                          SpacerHelper.verticalSpaceMedium(),
                          DataDropDownField(
                              name: 'flying_base',
                              label: 'Flying Base/Location',
                              hintText: 'Select Location',
                              items: flyingBasesUSA
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList()),
                          SpacerHelper.verticalSpaceMedium(),
                          DataFieldWidget(
                            name: 'pilot_license_number',
                            label: 'Pilot License Number',
                            mandatory: true,
                            enabled: false,
                            initialValue: 'A7293300SD',
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: TColors.lightContainer,
                            ),
                          ),
                          SpacerHelper.verticalSpaceMedium(),
                          MultiChipSelectField(
                            label: 'Certifications',
                            name: 'certifications',
                            options: pilotCertificates,
                          ),
                          SpacerHelper.verticalSpaceMedium(),
                          MultiChipSelectField(
                            label: 'Geography Tags',
                            name: 'geography_tags',
                            options: geographyTags,
                          ),
                        ],
                      ),
                    ),
                    SpacerHelper.verticalSpaceLarge(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          editProfileFormKey.currentState?.save();
                          if (editProfileFormKey.currentState!.validate()) {}
                        },
                        child: Text('Save Changes'),
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
