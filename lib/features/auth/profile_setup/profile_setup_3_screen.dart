import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/services/local_storage_service.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/enums.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/helpers/custom_upload_file_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetup3Screen extends StatefulWidget {
  const ProfileSetup3Screen({super.key});

  @override
  State<ProfileSetup3Screen> createState() => _ProfileSetup3ScreenState();
}

class _ProfileSetup3ScreenState extends State<ProfileSetup3Screen> {
  final List<Map<String, dynamic>> items = [
    {
      'label': 'Pilot Certificates (Front)',
      'mandatory': true,
    },
    {
      'label': 'Pilot Certificates (Back)',
      'mandatory': true,
    },
    {
      'label': 'Medical Certificate',
      'mandatory': true,
    },
    {
      'label': 'Government-Issued Photo ID',
      'mandatory': true,
    },
    if (LocalStorageService.getRole == Role.pilot.name &&
        LocalStorageService.getRoleType == PilotRoleType.student.name) ...[
      {
        'label': 'TSA AFSP Approval Upload',
        'mandatory': true,
      },
    ],
    if (LocalStorageService.getRole == Role.pilot.name &&
        LocalStorageService.getRoleType == PilotRoleType.cfi.name) ...[
      {
        'label': 'TSA Security Awareness Certificate',
        'mandatory': true,
      },
    ],
    {
      'label': 'Endorsements',
      'mandatory': false,
    },
    {
      'label': 'CFI-Credentials',
      'mandatory': false,
    },
    {
      'label': 'Logbook Snapshop',
      'mandatory': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.scaffoldBackground,
        body: Stack(
          children: [
            BackGroundFiller(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacerHelper.verticalSpaceMedium(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackButtonWidget(),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.profileSetup4Route);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: TColors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              "Skip",
                              style: TextTheme.of(context).bodySmall?.copyWith(
                                    color: TColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    SpacerHelper.verticalSpaceSmall(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Document Uploads',
                              style: TextTheme.of(context).titleLarge!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.5,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                            SpacerHelper.verticalSpaceMedium(),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return CustomUploadFileWidget(
                                  label: items[index]['label'],
                                  mandatory: items[index]['mandatory'],
                                  index: index,
                                  onTap: () {
                                    Get.find<AuthController>().getFile(
                                      type: 'documents',
                                      index: index,
                                    );
                                  },
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SpacerHelper.verticalSpaceLarge();
                              },
                            ),
                            SpacerHelper.verticalSpaceExtraLarge(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.profileSetup4Route);
                                },
                                child: Text("Continue"),
                              ),
                            ),
                            SpacerHelper.verticalSpaceLarge(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
