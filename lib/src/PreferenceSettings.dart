import 'package:flutter/material.dart';
import 'package:konoplev_settings_ui/konoplev_settings_ui.dart';

abstract class PreferenceSetting extends Setting {
  var textStyle = TextStyle(
    fontSize: 20,
  );
  final String title;
  final String preferenceName;
  String value = '';

  PreferenceSetting({
    Key? key,
    required this.title,
    required this.preferenceName,
  }) : super(key: key, title: title);
}
