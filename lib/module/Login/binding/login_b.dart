
import 'package:get/get.dart';

import '../controller/login_c.dart';

class LoginBinding extends Bindings{
   @override
     void dependencies() {
    Get.put(LoginController());
  }
}