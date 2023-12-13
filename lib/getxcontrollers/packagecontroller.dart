import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:yarn_modified/model/packagelistresponse.dart';
import 'package:yarn_modified/model/packagesummaryresponse.dart';
import 'package:yarn_modified/screens/package/packagelist.dart';
import 'package:yarn_modified/services/all_api_services.dart';

class PackageController extends GetxController{

  List<Package>? getData = [];
  List<PaymentDetail>? paymentdetails = [];

  Future<void> PackagelistgetAPI() async {
    Get.context!.loaderOverlay.show();
    await Packagelist().then((value) {
      getData = value.package;
      paymentdetails = value.paymentDetails;
      Get.to(packageListScreen(package:value));
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }
  Future<void> PackagelistgetAPI2() async {
    Get.context!.loaderOverlay.show();
    await Packagelist().then((value) {
      getData = value.package;
      paymentdetails = value.paymentDetails;
      Get.offAll(packageListScreen(package:value,));
      Get.context!.loaderOverlay.hide();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }

  Packagessummaryresponse? packagessummary;
  bool  showsummary = false;
  Future<void> PackageSummaryAPi() async {
    Get.context!.loaderOverlay.show();
    await PackageSummary().then((value) {
      packagessummary = value;
     showsummary = true;
      Get.context!.loaderOverlay.hide();
      update();
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      print(error);
    });
  }
}