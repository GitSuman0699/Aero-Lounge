import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/helpers/custom_text_fields.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_field_theme.dart';
import 'package:calendar_slider/calendar_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookAircraftScreen extends StatefulWidget {
  const BookAircraftScreen({super.key});

  @override
  State<BookAircraftScreen> createState() => _BookAircraftScreenState();
}

class _BookAircraftScreenState extends State<BookAircraftScreen> {
  List<String> aircraftTypes = [
    'Single Engine',
    'Multi-Engine',
    'Turboprop',
    'Ultralight',
  ];

  List<String> usAirportLocations = [
    'KJFK - New York',
    'KLAX - Los Angeles',
    'KORD - Chicago',
    'KATL - Atlanta',
    'KDFW - Dallas/Fort Worth'
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
        title: Text('Book Aircraft'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            BackGroundFiller(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacerHelper.verticalSpaceMedium(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'STEP 1 OF 3',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: TColors.textSecondary,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
                SpacerHelper.verticalSpaceLarge(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CalendarSlider(
                          // controller: _firstController,
                          selectedDayPosition: SelectedDayPosition.center,
                          fullCalendarScroll: FullCalendarScroll.horizontal,
                          fullCalendarWeekDay: WeekDay.short,
                          selectedTileBackgroundColor: TColors.textPrimary,
                          monthYearButtonBackgroundColor: Colors.transparent,
                          tileBackgroundColor: Colors.white,
                          selectedDateColor: Colors.white,
                          dateColor: TColors.textSecondary,
                          calendarEventColor: TColors.textPrimary,
                          calendarEventSelectedColor: Colors.white,
                          // events: controller.events,
                          locale: 'en',
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now()
                              .toLocal()
                              .subtract(const Duration(days: 100)),
                          lastDate: DateTime.now()
                              .toLocal()
                              .add(const Duration(days: 100)),
                          onDateSelected: (DateTime date) {},
                        ),
                        SpacerHelper.verticalSpaceMedium(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: DateFormWidget(
                                      label: 'Start Time',
                                      name: 'start_time',
                                      isDatePicker: false,
                                    ),
                                  ),
                                  SpacerHelper.horizontalSpaceSmall(),
                                  Expanded(
                                    child: DateFormWidget(
                                      label: 'End Time',
                                      name: 'end_time',
                                      isDatePicker: false,
                                    ),
                                  ),
                                ],
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              DataDropDownField(
                                  name: 'aircraft_type',
                                  label: 'Aircraft Type',
                                  hintText: 'Select',
                                  items: aircraftTypes
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList()),
                              SpacerHelper.verticalSpaceMedium(),
                              DataDropDownField(
                                name: 'location',
                                label: 'Location',
                                hintText: 'Select',
                                items: usAirportLocations
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              CheckboxDataField(
                                name: 'additional_filters',
                                label: 'Additional Filters',
                                options: [
                                  FormBuilderFieldOption(
                                    value: 'Night Flying Allowed',
                                    child: Text(
                                      'Night Flying Allowed',
                                      style: TTextFormFieldTheme.formTextStyle,
                                    ),
                                  ),
                                  FormBuilderFieldOption(
                                    value: 'Paved Runway Only',
                                    child: Text(
                                      'Paved Runway Only',
                                      style: TTextFormFieldTheme.formTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              SpacerHelper.verticalSpaceLarge(),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(
                                        AppRoutes.aircraftBookingReviewRoute);
                                  },
                                  child: Text('Continue to Details'),
                                ),
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
