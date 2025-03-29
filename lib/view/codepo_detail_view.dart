import 'package:codepo_dev_tool/model/codepo_http_call.dart';
import 'package:codepo_dev_tool/view/components/codepo_error_widget.dart';
import 'package:codepo_dev_tool/view/components/codepo_headers_widget.dart';
import 'package:codepo_dev_tool/view/components/codepo_response_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodepoDetailView extends StatelessWidget {
  const CodepoDetailView({super.key, required this.call});

  final CodepoHttpCall call;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HTTP Call Detail"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Headers",
              ),
              Tab(
                text: "Response",
              ),
              Tab(
                text: "Error",
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Clipboard.setData(
            ClipboardData(text: call.request!.curl),
          ),
          child: const Icon(
            Icons.copy,
          ),
        ),
        body: TabBarView(
          children: [
            CodepoHeadersWidget(call: call),
            CodepoResponseWidget(call: call),
            CodepoErrorWidget(call: call),
          ],
        ),
      ),
    );
  }
}
