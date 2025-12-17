import 'package:codepo_dev_tool/model/codepo_http_call.dart';
import 'package:flutter/material.dart';

class CodepoErrorWidget extends StatelessWidget {
  const CodepoErrorWidget({super.key, required this.call});

  final CodepoHttpCall call;

  @override
  Widget build(BuildContext context) {
    if (call.error == null) {
      return const Center(
        child: Text("There is no error"),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SelectableText("${call.error?.error}"),
    );
  }
}
