import 'package:flutter/material.dart';

abstract class Setting extends StatefulWidget {
  var textStyle = TextStyle(
    fontSize: 20,
  );
  final String title;
  String value = '';
  Widget? icon;

  Setting({
    Key? key,
    required this.title,
    this.value = '',
    this.icon,
  }) : super(key: key);
}
