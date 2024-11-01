import 'package:get/get.dart';

import '../controller/salestransaction_c.dart';

class SalesTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SalesTransactionController());
  }
}
