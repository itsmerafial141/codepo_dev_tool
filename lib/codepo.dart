import 'package:codepo_dev_tool/model/codepo_http_call.dart';
import 'package:get/get.dart';

import 'codepo_service.dart';

class Codepo {
  late final CodepoService _service;

  Codepo() {
    _service = Get.put(CodepoService());
  }

  RxList<CodepoHttpCall> get calls => _service.calls;

  void showInspector() => _service.navigateToCallListScreen();

  RxBool get isInspectorOpened => _service.isInspectorOpened;
}
