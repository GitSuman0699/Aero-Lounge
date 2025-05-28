import 'package:aero_lounge/features/on_board/on_board_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/enums.dart';
import 'package:aero_lounge/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PilotButton extends StatefulWidget {
  const PilotButton({
    super.key,
  });

  @override
  State<PilotButton> createState() => _PilotButtonState();
}

class _PilotButtonState extends State<PilotButton>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  String selectedRole = PilotRoleType.pilot.name;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OnBoardController(),
      builder: (controller) {
        return Obx(
          () => AnimatedCrossFade(
            crossFadeState: controller.userRole.value == Role.pilot.name
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
            firstChild: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: OutlinedButton.icon(
                onPressed: () {
                  controller.userRole.value = Role.pilot.name;
                },
                icon: SvgPicture.asset(
                  Assets.assetsOnboardPilotIcon,
                  height: 20,
                ),
                label: Text(
                  "Pilot",
                ),
                style: TOutlinedButtonTheme.lightOutlinedButtonTheme.style,
              ),
            ),
            secondChild: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: TColors.light,
                border: Border.all(color: TColors.textPrimary, width: 1.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Assets.assetsOnboardPilotIcon,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Pilot",
                        style: TextTheme.of(context).titleMedium!.copyWith(
                              color: TColors.textPrimary,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var role in PilotRoleType.values) ...[
                        _buildRoleOption(role)
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRoleOption(PilotRoleType role) {
    return GetBuilder(
      init: OnBoardController(),
      builder: (controller) {
        return Obx(
          () => OutlinedButton(
            onPressed: () {
              if (controller.userType.value != role.name) {
                controller.userType.value = role.name;
              }
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: controller.userType.value == role.name
                  ? TColors.textPrimary
                  : TColors.softGrey,
              foregroundColor: controller.userType.value == role.name
                  ? TColors.textWhite
                  : TColors.textPrimary,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              textStyle: TextTheme.of(context).titleSmall!.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
            ),
            child: Text(
              role == PilotRoleType.cfi
                  ? role.name.toUpperCase()
                  : role.name[0].toUpperCase() + role.name.substring(1),
            ),
          ),
        );
      },
    );
  }
}
