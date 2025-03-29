import 'package:codepo_dev_tool/model/codepo_http_call.dart';
import 'package:get/get.dart';

import 'codepo_service.dart';

export 'codepo_interceptor.dart';
export 'codepo_service.dart';

class CodepoDevTool {
  late final CodepoService _service;

  CodepoDevTool() {
    _service = Get.put(CodepoService());
  }

  RxList<CodepoHttpCall> get calls => _service.calls;

  void showInspector() => _service.navigateToCallListScreen();

  RxBool get isInspectorOpened => _service.isInspectorOpened;
}
