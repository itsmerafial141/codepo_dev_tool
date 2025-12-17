import 'dart:async';
import 'dart:developer';

import 'package:codepo_dev_tool/model/codepo_http_call.dart';
import 'package:codepo_dev_tool/model/codepo_http_error.dart';
import 'package:codepo_dev_tool/model/codepo_http_response.dart';
import 'package:codepo_dev_tool/view/codepo_view.dart';
import 'package:get/get.dart';

class CodepoService extends GetxService {
  static Future<CodepoService> initialize() async => Get.put(CodepoService(), permanent: true);

  RxList<CodepoHttpCall> calls = <CodepoHttpCall>[].obs;

  var isInspectorOpened = false.obs;

  void addCall(CodepoHttpCall call) => calls.add(call);

  /// Add response to existing alice http call
  FutureOr<void> addResponse(CodepoHttpResponse res, int requestId) async {
    final index = calls.indexWhere((call) => call.id == requestId);

    if (index != -1) {
      var seed = calls[index];
      int duration = res.time.difference(seed.createdTime).inMilliseconds;
      calls[index] = seed.copyWith(response: res, duration: duration);
      calls.refresh();
    } else {
      log("No call found with id $requestId to update the response.");
    }
  }

  /// Add error to existing alice http call
  FutureOr<void> addError(CodepoHttpError error, int requestId) async {
    final index = calls.indexWhere((call) => call.id == requestId);

    if (index != -1) {
      var seed = calls[index];
      int duration = DateTime.now().difference(seed.createdTime).inMilliseconds;
      calls[index] = seed.copyWith(error: error, duration: duration);
      calls.refresh();
    } else {
      log("No call found with id $requestId to update the response.");
    }
  }

  Future<void> navigateToCallListScreen() async {
    if (!isInspectorOpened.value) {
      isInspectorOpened.value = true;
      await Get.to(() => CodepoView(service: this));
      isInspectorOpened.value = false;
    }
  }
}
