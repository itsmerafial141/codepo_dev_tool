import 'package:codepo_dev_tool/model/codepo_http_call.dart';
import 'package:codepo_dev_tool/view/components/codepo_row_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CodepoHeadersWidget extends StatelessWidget {
  const CodepoHeadersWidget({
    super.key,
    required this.call,
  });

  final CodepoHttpCall call;

  @override
  Widget build(BuildContext context) {
    var requestHeader =
        call.request!.headers.entries.map((entry) => {entry.key: entry.value}).toList();

    var responseHeader =
        call.response!.headers.entries.map((entry) => {entry.key: entry.value}).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ExpandablePanel(
            controller: ExpandableController(initialExpanded: true),
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
            ),
            header: const Text(
              "General",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            collapsed: const SizedBox.shrink(),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CodepoRowWidget(
                  title: "Request URL",
                  body: call.uri,
                ),
                const SizedBox(height: 8),
                CodepoRowWidget(
                  title: "Request Method",
                  body: call.method,
                ),
                const SizedBox(height: 8),
                CodepoRowWidget(
                  title: "Status Code",
                  body: "${call.response?.status}",
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ExpandablePanel(
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
            ),
            header: const Text(
              "Request Headers",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            collapsed: const SizedBox.shrink(),
            expanded: ListView.separated(
              primary: false,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: requestHeader.length,
              itemBuilder: (context, index) {
                var map = requestHeader[index];
                return CodepoRowWidget(
                  title: map.keys.first,
                  body: map.values.first,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 4);
              },
            ),
          ),
          const SizedBox(height: 8),
          ExpandablePanel(
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
            ),
            header: const Text(
              "Response Headers",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            collapsed: const SizedBox.shrink(),
            expanded: ListView.separated(
              primary: false,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: responseHeader.length,
              itemBuilder: (context, index) {
                var map = responseHeader[index];
                return CodepoRowWidget(
                  title: map.keys.first,
                  body: map.values.first,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 4);
              },
            ),
          ),
          if ((call.request?.formDataFields ?? []).isNotEmpty) ...[
            const SizedBox(height: 8),
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
              ),
              header: const Text(
                "Form Data Field",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              collapsed: const SizedBox.shrink(),
              expanded: ListView.separated(
                primary: false,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: call.request!.formDataFields!.length,
                itemBuilder: (context, index) {
                  var map = call.request!.formDataFields![index];
                  return CodepoRowWidget(
                    title: map.name,
                    body: map.value,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 4);
                },
              ),
            ),
          ],
          if ((call.request?.formDataFiles ?? []).isNotEmpty) ...[
            const SizedBox(height: 8),
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
              ),
              header: const Text(
                "Form Data Files",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              collapsed: const SizedBox.shrink(),
              expanded: ListView.separated(
                primary: false,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: call.request!.formDataFiles!.length,
                itemBuilder: (context, index) {
                  var map = call.request!.formDataFiles![index];
                  return CodepoRowWidget(
                    title: map.fileName ?? "",
                    body: map.contentType,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 4);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
