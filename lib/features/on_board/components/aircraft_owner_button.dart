import 'package:aero_lounge/features/on_board/on_board_controller.dart';
import 'package:aero_lounge/generated/assets.dart';
import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/enums.dart';
import 'package:aero_lounge/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AirCraftOwnerButton extends StatefulWidget {
  const AirCraftOwnerButton({
    super.key,
  });

  @override
  State<AirCraftOwnerButton> createState() => _AirCraftOwnerButtonState();
}

class _AirCraftOwnerButtonState extends State<AirCraftOwnerButton>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  String selectedRole = "general";
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OnBoardController(),
      builder: (controller) {
        return Obx(
          () => AnimatedCrossFade(
            crossFadeState: controller.userRole.value == Role.airCraftOwner.name
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 300),
            firstChild: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: OutlinedButton.icon(
                onPressed: () {
                  controller.userRole.value = Role.airCraftOwner.name;
                },
                icon: SvgPicture.asset(
                  Assets.assetsOnboardAircraftOwnerIcon,
                  height: 20,
                ),
                label: Text(
                  "Aircraft Owner",
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
                        Assets.assetsOnboardAircraftOwnerIcon,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Aircraft Owner",
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
                      _buildRoleOption("General"),
                      _buildRoleOption("Flight School"),
                      _buildRoleOption("Business"),
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

  Widget _buildRoleOption(String role) {
    final isSelected = selectedRole == role.toLowerCase();
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedRole = role.toLowerCase();
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? TColors.textPrimary : TColors.softGrey,
        foregroundColor: isSelected ? TColors.textWhite : TColors.textPrimary,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        textStyle: TextTheme.of(context).titleSmall!.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
      ),
      child: Text(role),
    );
  }
}
