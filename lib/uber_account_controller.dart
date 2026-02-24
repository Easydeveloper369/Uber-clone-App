import 'package:get/get.dart';

class UberAccountController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
  }
}
