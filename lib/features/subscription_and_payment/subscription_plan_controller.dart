import 'package:get/get.dart';

class SubscriptionPlanController extends GetxController {
  final RxString selectedSubscription = 'Monthly'.obs;
  final RxInt selectedPlan = 1.obs;
  final RxInt selectedPaymentMethod = 0.obs;
  final RxBool isPaymentSplit = false.obs;
}
