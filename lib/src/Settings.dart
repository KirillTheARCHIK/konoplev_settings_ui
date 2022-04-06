import 'package:flutter/material.dart';

abstract class Setting extends StatefulWidget {
  var textStyle = TextStyle(
    fontSize: 20,
  );
  final String title;
  String value = '';

  Setting({
    Key? key,
    required this.title,
  }) : super(key: key);
}
