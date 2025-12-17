import 'package:codepo_dev_tool/codepo_service.dart';
import 'package:get/get.dart';

mixin CodepoAdapter {
  CodepoService get service => Get.find<CodepoService>();
}
