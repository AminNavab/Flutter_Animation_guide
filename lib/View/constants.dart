import 'package:flutter/material.dart';

AppBar appBar(
  int keyId,
  BuildContext context,
  TextTheme texttheme,
  String title,
) {
  return AppBar(
    automaticallyImplyLeading: false,

    actions: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward_rounded,
            color: Colors.black,
            size: 40,
          ),
        ),
      ),
    ],
    title: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(title, style: texttheme.titleLarge),
    ),
  );
}
