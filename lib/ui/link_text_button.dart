import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

Widget linkElevatedButton({
  required String url,
  required String label,
  LinkTarget target = LinkTarget.blank,
}) {
  return Link(
    uri: Uri.parse(url),
    target: target,
    builder: (context, followLink) => ElevatedButton(
      onPressed: followLink,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label),
        ],
      ),
    ),
  );
}
