import 'package:aero_lounge/features/on_board/on_board_controller.dart';
import 'package:aero_lounge/routes/app_routes.dart';
import 'package:aero_lounge/services/local_storage_service.dart';
import 'package:aero_lounge/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: GetBuilder<OnBoardController>(
        init: OnBoardController(),
        builder: (controller) {
          return Obx(
            () => ElevatedButton(
              onPressed: controller.userRole.value == ""
                  ? null
                  : () {
                      if (controller.userRole.value == "pilot") {
                        LocalStorageService.setRole = Role.pilot.name;
                        LocalStorageService.setRoleType =
                            controller.userType.value;

                        Get.toNamed(AppRoutes.loginRoute);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Not available yet"),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      }
                    },
              child: Text(
                'Continue',
              ),
            ),
          );
        },
      ),
    );
  }
}
