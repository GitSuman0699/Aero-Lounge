import 'package:aero_lounge/features/auth/login/components/dialogs.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/sizes.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class DateFormWidget extends StatelessWidget {
  final String? initialValue;
  final bool? mandatory;
  final String label;
  final String name;
  final SizedBox? spacer;
  final String? Function(DateTime?)? validator;
  final bool isDatePicker;
  const DateFormWidget({
    super.key,
    this.initialValue,
    this.mandatory = false,
    required this.label,
    required this.name,
    this.spacer,
    this.validator,
    this.isDatePicker = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isNotEmpty
            ? Text.rich(
                TextSpan(
                  text: label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: mandatory! ? '*' : '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: TColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        spacer ?? SpacerHelper.verticalSpace(2),
        FormBuilderDateTimePicker(
          name: name,
          style: TTextFormFieldTheme.formTextStyle,
          decoration: InputDecoration(
            hintText: isDatePicker ? "Select Date" : "Select Time",
            hintStyle: const TextStyle().copyWith(
              fontSize: TSizes.fontSizeSm,
              color: TColors.hintText,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
            suffixIcon:
                Icon(isDatePicker ? Icons.calendar_today : Icons.access_time),
          ),
          initialValue: initialValue != null
              ? DateTime.parse(initialValue!).toUtc()
              : null,
          inputFormatters: isDatePicker
              ? [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'\d{2}-\d{2}-\d{4}')),
                ]
              : null,
          valueTransformer: (value) {
            if (value != null) {
              return (value).toUtc();
            }
            return null;
          },
          format: isDatePicker ? DateFormat('MM-dd-yyyy') : null,
          inputType: isDatePicker ? InputType.date : InputType.time,
          validator: validator,
        ),
      ],
    );
  }
}

class RatingWidget extends StatelessWidget {
  final TextEditingController? controller;
  final double? initialValue;
  final bool? mandatory;
  final String label;
  final String name;
  final bool readOnly;
  final bool enabled;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final dynamic Function(String?)? valueTransformer;
  final InputDecoration? decoration;
  final SizedBox? spacer;
  final Widget? suffixIcon;
  final bool? obscureText;
  const RatingWidget({
    super.key,
    required this.name,
    required this.label,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.mandatory = false,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.controller,
    this.initialValue,
    this.hintText,
    this.maxLines = 1,
    this.inputFormatters,
    this.valueTransformer,
    this.decoration,
    this.spacer,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isNotEmpty
            ? Text.rich(
                TextSpan(
                  text: label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: mandatory! ? '*' : '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: TColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        spacer ?? SpacerHelper.verticalSpace(2),
        RatingBar.builder(
          initialRating: initialValue ?? 0,
          minRating: 1,
          maxRating: 5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 24,
          unratedColor: TColors.hintText,
          itemBuilder: (context, _) => SvgPicture.asset(
            Assets.assetsDashboardRatingStarIcon,
            height: 14,
            width: 14,
          ),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}

class DataFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final bool? mandatory;
  final String label;
  final String name;
  final bool readOnly;
  final bool enabled;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final String? hintText;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final dynamic Function(String?)? valueTransformer;
  final InputDecoration? decoration;
  final SizedBox? spacer;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final bool isInfoIconVisible;
  final AutovalidateMode autovalidateMode;
  const DataFieldWidget({
    super.key,
    required this.name,
    required this.label,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.mandatory = false,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.controller,
    this.initialValue,
    this.hintText,
    this.maxLines = 1,
    this.inputFormatters,
    this.valueTransformer,
    this.decoration,
    this.spacer,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.textInputAction = TextInputAction.done,
    this.isInfoIconVisible = false,
    this.autovalidateMode = AutovalidateMode.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: label,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: TColors.textSecondary,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: mandatory! ? '*' : '',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: TColors.textSecondary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isInfoIconVisible,
                    child: InkWell(
                      onTap: () {
                        AppDiaLogs.passwordGuildlineDialog(context);
                      },
                      child: SvgPicture.asset(
                          Assets.assetsCreateAccountInformationIcon,
                          height: 16,
                          width: 16,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                            TColors.textSecondary,
                            BlendMode.srcIn,
                          )),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        spacer ?? SpacerHelper.verticalSpace(2),
        FormBuilderTextField(
          autovalidateMode: autovalidateMode,
          controller: controller,
          obscureText: obscureText!,
          initialValue: initialValue,
          enabled: enabled,
          onTap: onTap,
          onChanged: onChanged,
          style: TTextFormFieldTheme.formTextStyle,
          name: name,
          readOnly: readOnly,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization!,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          inputFormatters: inputFormatters,
          validator: validator,
          maxLines: maxLines,
          valueTransformer: valueTransformer,
          textInputAction: textInputAction,
          decoration: decoration ??
              InputDecoration(
                hintText: hintText,
                suffixIcon: suffixIcon,
              ),
        ),
      ],
    );
  }
}

class DataDropDownField extends StatelessWidget {
  final Object? initialValue;
  final bool? mandatory;
  final String label;
  final String name;
  final bool enabled;
  final String? Function(Object?)? validator;
  final Function(Object?)? onChanged;
  final String? hintText;
  final List<DropdownMenuItem<Object?>> items;
  final SizedBox? spacer;

  const DataDropDownField({
    super.key,
    required this.name,
    required this.label,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.mandatory = false,
    required this.items,
    this.initialValue,
    this.hintText,
    this.spacer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isNotEmpty
            ? Text.rich(
                TextSpan(
                  text: label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: mandatory! ? '*' : '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: TColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        spacer ?? SpacerHelper.verticalSpace(2),
        FormBuilderDropdown<Object?>(
          name: name,
          initialValue: initialValue,
          enabled: enabled,
          onChanged: onChanged,
          dropdownColor: TColors.primaryBackground,
          hint: Text(
            hintText ?? '',
            style: TextStyle().copyWith(
              fontSize: TSizes.fontSizeSm,
              color: TColors.hintText,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
          ),
          icon: SvgPicture.asset(Assets.assetsCreateAccountDropDownIcon),
          style: TTextFormFieldTheme.formTextStyle,
          validator: validator,
          items: items,
        ),
      ],
    );
  }
}

class RadioDataField extends StatelessWidget {
  final String? initialValue;
  final bool? mandatory;
  final String label;
  final String name;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final dynamic Function(String?)? valueTransformer;
  final InputDecoration? decoration;
  final SizedBox? spacer;
  final List<FormBuilderFieldOption<dynamic>> options;

  const RadioDataField({
    super.key,
    required this.name,
    required this.label,
    this.validator,
    this.onChanged,
    this.mandatory = false,
    this.initialValue,
    this.valueTransformer,
    this.decoration,
    this.spacer,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isNotEmpty
            ? Text.rich(
                TextSpan(
                  text: label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: mandatory! ? '*' : '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: TColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        spacer ?? SpacerHelper.verticalSpace(4),
        FormBuilderRadioGroup(
          name: name,
          options: options,
          wrapDirection: Axis.vertical,
          orientation: OptionsOrientation.vertical,
          activeColor: TColors.borderPrimary,
          decoration: InputDecoration(
            filled: true,
            fillColor: TColors.grey,
          ),
        )
      ],
    );
  }
}

class CheckboxDataField extends StatelessWidget {
  final String? initialValue;
  final bool? mandatory;
  final String label;
  final String name;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final dynamic Function(String?)? valueTransformer;
  final InputDecoration? decoration;
  final SizedBox? spacer;
  final List<FormBuilderFieldOption<dynamic>> options;

  const CheckboxDataField({
    super.key,
    required this.name,
    required this.label,
    this.validator,
    this.onChanged,
    this.mandatory = false,
    this.initialValue,
    this.valueTransformer,
    this.decoration,
    this.spacer,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isNotEmpty
            ? Text.rich(
                TextSpan(
                  text: label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: mandatory! ? '*' : '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: TColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        spacer ?? SpacerHelper.verticalSpace(4),
        FormBuilderCheckboxGroup(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          name: name,
          options: options,
          wrapDirection: Axis.vertical,
          orientation: OptionsOrientation.vertical,
          activeColor: TColors.borderPrimary,
          decoration: InputDecoration(
            filled: true,
            fillColor: TColors.grey,
          ),
        )
      ],
    );
  }
}

class MultiChipSelectField extends StatefulWidget {
  final String? initialValue;
  final bool? mandatory;
  final String label;
  final String name;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final dynamic Function(String?)? valueTransformer;
  final InputDecoration? decoration;
  final SizedBox? spacer;
  final List<dynamic> options;

  const MultiChipSelectField({
    super.key,
    required this.name,
    required this.label,
    this.validator,
    this.onChanged,
    this.mandatory = false,
    this.initialValue,
    this.valueTransformer,
    this.decoration,
    this.spacer,
    required this.options,
  });

  @override
  State<MultiChipSelectField> createState() => _MultiChipSelectFieldState();
}

class _MultiChipSelectFieldState extends State<MultiChipSelectField> {
  List<dynamic> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label.isNotEmpty
            ? Text.rich(
                TextSpan(
                  text: widget.label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.mandatory! ? '*' : '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: TColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        widget.spacer ?? SpacerHelper.verticalSpace(4),
        FormBuilderFilterChip(
          name: widget.name,
          elevation: 0,
          spacing: 8,
          runSpacing: -4,
          selectedColor: TColors.textPrimary,
          backgroundColor: TColors.lightContainer,
          shadowColor: TColors.textPrimary,
          showCheckmark: false,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          decoration: const InputDecoration(
            fillColor: Colors.transparent,
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(0),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              selectedOptions = value!;
            });
          },
          pressElevation: 0,
          selectedShadowColor: Colors.transparent,
          options: widget.options.map((e) {
            final isSelected = selectedOptions.contains(e);

            return FormBuilderChipOption<dynamic>(
              value: e,
              child: Text(
                e,
                style: TextStyle(
                  color: isSelected ? TColors.textWhite : TColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class MultiSelectDropDownField extends StatelessWidget {
  final Object? initialValue;
  final bool? mandatory;
  final String label;
  final String name;
  final bool enabled;
  final String? Function(Object?)? validator;
  final Function(Object?)? onChanged;
  final String? hintText;
  final List<DropdownItem<Object>> items;
  final SizedBox? spacer;

  const MultiSelectDropDownField({
    super.key,
    required this.name,
    required this.label,
    this.enabled = true,
    this.validator,
    this.onChanged,
    this.mandatory = false,
    required this.items,
    this.initialValue,
    this.hintText,
    this.spacer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isNotEmpty
            ? Text.rich(
                TextSpan(
                  text: label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: TColors.textSecondary,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: mandatory! ? '*' : '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: TColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        spacer ?? SpacerHelper.verticalSpace(2),
        MultiDropdown<Object>(
          items: items,
          enabled: true,
          searchDecoration: SearchFieldDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          chipDecoration: ChipDecoration(
            deleteIcon: Icon(
              Icons.close,
              size: 16,
              color: TColors.white,
            ),
            backgroundColor: TColors.textPrimary,
            labelStyle: TextTheme.of(context).titleSmall?.copyWith(
                  color: TColors.white,
                  fontWeight: FontWeight.w900,
                ),
            wrap: true,
            runSpacing: 8,
            spacing: 8,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          fieldDecoration: FieldDecoration(
            hintText: 'Select',
            hintStyle: TextStyle().copyWith(
              fontSize: TSizes.fontSizeSm,
              color: TColors.hintText,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
            showClearIcon: false,
            backgroundColor: TColors.white,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            suffixIcon: SvgPicture.asset(
              Assets.assetsCreateAccountDropDownIcon,
              height: 8,
              width: 8,
              fit: BoxFit.scaleDown,
            ),
            borderRadius: 4,
          ),
          dropdownDecoration: DropdownDecoration(
            elevation: 10,
            marginTop: 2,
            maxHeight: 700,
            borderRadius: BorderRadius.circular(4),
            backgroundColor: TColors.softGrey,
            // footer: Container(
            //   color: TColors.lightContainer,
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //     child: Text(
            //       "Tap to add more options",
            //       style: TextTheme.of(context).titleSmall?.copyWith(
            //             color: TColors.textPrimary,
            //             fontWeight: FontWeight.w900,
            //           ),
            //     ),
            //   ),
            // ),
            header: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Select options',
                textAlign: TextAlign.start,
                style: TextTheme.of(context).titleMedium?.copyWith(
                      color: TColors.textPrimary,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
          ),
          dropdownItemDecoration: DropdownItemDecoration(
            textColor: TColors.textPrimary,
            selectedIcon: const Icon(Icons.check_box),
            disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
          ),
          validator: validator,
          onSelectionChange: (selectedItems) {
            debugPrint("OnSelectionChange: $selectedItems");
          },
        ),
      ],
    );
  }
}
