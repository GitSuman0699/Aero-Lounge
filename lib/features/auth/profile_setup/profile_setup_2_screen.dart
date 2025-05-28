import 'package:aero_lounge/features/auth/auth_controller.dart';
import 'package:aero_lounge/features/auth/profile_setup/components/profile_setup/profile_setup_2_form.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/spacer_helper.dart';
import 'package:aero_lounge/utils/constants/widgets/back_button_widget.dart';
import 'package:aero_lounge/utils/constants/widgets/background_filler.dart';
import 'package:aero_lounge/utils/constants/widgets/dotted_container.dart';
import 'package:aero_lounge/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileSetup2Screen extends StatefulWidget {
  const ProfileSetup2Screen({super.key});

  @override
  State<ProfileSetup2Screen> createState() => _ProfileSetup2ScreenState();
}

class _ProfileSetup2ScreenState extends State<ProfileSetup2Screen> {
  final profileSetup2FormKey = GlobalKey<FormBuilderState>();

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
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                              'Flight Experience Overview',
                              style: TextTheme.of(context).titleLarge!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.5,
                                    color: TColors.textSecondary,
                                  ),
                            ),
                            SpacerHelper.verticalSpaceMedium(),
                            GetBuilder<AuthController>(
                                init: AuthController(),
                                builder: (controller) {
                                  return Obx(
                                    () => Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller.isLogbookManually
                                                  .value = false;
                                            },
                                            style: controller
                                                    .isLogbookManually.isTrue
                                                ? TElevatedButtonTheme
                                                    .lightElevatedButtonTheme
                                                    .style
                                                    ?.copyWith(
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                            TColors.white),
                                                    foregroundColor:
                                                        WidgetStatePropertyAll(
                                                            TColors.hintText),
                                                  )
                                                : TElevatedButtonTheme
                                                    .lightElevatedButtonTheme
                                                    .style,
                                            child: Text('Upload Logbook'),
                                          ),
                                        ),
                                        SpacerHelper.horizontalSpaceSmall(),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: controller
                                                    .isLogbookManually.isFalse
                                                ? TElevatedButtonTheme
                                                    .lightElevatedButtonTheme
                                                    .style
                                                    ?.copyWith(
                                                    backgroundColor:
                                                        WidgetStatePropertyAll(
                                                            TColors.white),
                                                    foregroundColor:
                                                        WidgetStatePropertyAll(
                                                            TColors.hintText),
                                                  )
                                                : TElevatedButtonTheme
                                                    .lightElevatedButtonTheme
                                                    .style,
                                            onPressed: () {
                                              controller.isLogbookManually
                                                  .value = true;
                                            },
                                            child: Text('Add Manually'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            SpacerHelper.verticalSpaceLarge(),
                            GetBuilder<AuthController>(
                                init: AuthController(),
                                builder: (controller) {
                                  return Obx(
                                    () => Visibility(
                                      visible:
                                          controller.isLogbookManually.isFalse,
                                      replacement: ProfileSetup2Form(
                                          profileSetup2FormKey:
                                              profileSetup2FormKey),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GetBuilder<AuthController>(
                                                init: AuthController(),
                                                builder: (controller) {
                                                  return Obx(
                                                    () => controller
                                                            .logbookPath.isEmpty
                                                        ? SizedBox.shrink()
                                                        : InkWell(
                                                            onTap: () {
                                                              controller
                                                                  .logbookPath
                                                                  .value = "";
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.cancel,
                                                                  size: 16,
                                                                ),
                                                                Text(
                                                                  "Discard",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodySmall
                                                                      ?.copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w900,
                                                                        color: TColors
                                                                            .textSecondary,
                                                                      ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                          SpacerHelper.verticalSpace(8),
                                          InkWell(
                                            onTap: () {
                                              Get.find<AuthController>()
                                                  .getFile(type: 'logbook');
                                            },
                                            child: DashedBorderContainer(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 1),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints:
                                                      const BoxConstraints(
                                                    minHeight: 50,
                                                    maxHeight: 92,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        TColors.lightContainer,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Center(
                                                    child: GetBuilder<
                                                        AuthController>(
                                                      init: AuthController(),
                                                      builder: (controller) {
                                                        return Obx(
                                                          () => Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if (controller
                                                                  .logbookPath
                                                                  .isEmpty) ...[
                                                                SvgPicture
                                                                    .asset(
                                                                  Assets
                                                                      .assetsCreateAccountUploadIcon,
                                                                  height: 24,
                                                                  width: 24,
                                                                ),
                                                                SpacerHelper
                                                                    .verticalSpaceExtraSmall(),
                                                                Text(
                                                                  'Tap to upload file',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodySmall
                                                                      ?.copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: TColors
                                                                            .textSecondary,
                                                                      ),
                                                                ),
                                                              ] else ...[
                                                                Text(
                                                                  controller
                                                                      .logbookPath
                                                                      .value
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyMedium
                                                                      ?.copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: TColors
                                                                            .textPrimary,
                                                                      ),
                                                                ),
                                                                SpacerHelper
                                                                    .verticalSpaceExtraSmall(),
                                                                Text(
                                                                  'Tap to replace file',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodySmall
                                                                      ?.copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: TColors
                                                                            .textSecondary,
                                                                      ),
                                                                ),
                                                              ],
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            SpacerHelper.verticalSpaceExtraLarge(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  // profileSetup2FormKey.currentState?.save();
                                  // if (profileSetup2FormKey.currentState!
                                  //     .validate()) {
                                  Get.toNamed(AppRoutes.profileSetup3Route);
                                  // }
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
