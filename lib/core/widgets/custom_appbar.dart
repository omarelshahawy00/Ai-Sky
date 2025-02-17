import 'package:flutter/material.dart';

import '../theming/styles.dart';

AppBar buildAppbar(context,
    {required String title, List<Widget>? actions, Widget? leading}) {
  return AppBar(
    elevation: 0,
    actions: actions,
    backgroundColor: Colors.transparent,
    leading: leading ??
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
    title: Text(
      title,
      style: TextStyles.size19Weight700.copyWith(color: Colors.white),
    ),
    centerTitle: true,
  );
}
