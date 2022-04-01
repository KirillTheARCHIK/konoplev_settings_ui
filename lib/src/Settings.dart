import 'package:flutter/material.dart';

abstract class Setting extends StatefulWidget {
  var textStyle = TextStyle(
    fontSize: 20,
  );
  final String title;
  final String preferenceName;
  String value = '';

  Setting({
    Key? key,
    required this.title,
    required this.preferenceName,
  }) : super(key: key);
}
