import 'package:codepo_dev_tool/model/codepo_http_call.dart';
import 'package:codepo_dev_tool/utils/codepo_parser.dart';
import 'package:flutter/material.dart';

class CodepoResponseWidget extends StatelessWidget {
  const CodepoResponseWidget({super.key, required this.call});

  final CodepoHttpCall call;

  @override
  Widget build(BuildContext context) {
    if (call.response?.body == null) {
      return const Center(
        child: Text("There is no response"),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SelectableText(
        (call.response?.body is String)
            ? call.response?.body
            : CodepoParser.formatJson(call.response?.body),
      ),
    );
  }
}
