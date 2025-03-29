import 'package:flutter/material.dart';

class codepoRowWidget extends StatelessWidget {
  const codepoRowWidget({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          "$title: ",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SelectableText(body),
      ],
    );
  }
}
