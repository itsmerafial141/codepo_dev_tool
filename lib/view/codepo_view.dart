import 'package:codepo_dev_tool/codepo_service.dart';
import 'package:codepo_dev_tool/view/codepo_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodepoView extends StatelessWidget {
  const CodepoView({super.key, required this.service});

  final CodepoService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('codepo View'),
        actions: [
          IconButton(
            onPressed: () {
              service.calls.clear();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Obx(
        () {
          final calls = service.calls.reversed.toList();
          if (calls.isEmpty) {
            return const Center(
              child: Text("There is no logged data"),
            );
          }
          return ListView.separated(
            itemCount: calls.length,
            itemBuilder: (context, index) {
              final call = calls[index];
              return ListTile(
                title: Text(
                  "${call.method} ${call.endpoint}",
                  style: TextStyle(
                    color: call.error != null ? Colors.red : null,
                  ),
                ),
                isThreeLine: true,
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(call.server),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${call.createdTime}"),
                        Text("${call.duration} ms"),
                      ],
                    ),
                  ],
                ),
                trailing: call.response?.status == null
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      )
                    : Text(
                        "${call.response?.status}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: call.error != null ? Colors.red : Colors.green,
                        ),
                      ),
                onTap: call.response?.status == null
                    ? null
                    : () => Get.to(
                          () => CodepoDetailView(call: call),
                        ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          );
        },
      ),
    );
  }
}
