import 'package:flutter/material.dart';
import 'package:konoplev_settings_ui/konoplev_settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveSettingsButton extends StatefulWidget {
  List<Setting> settingsList;
  void Function()? additionalActions;
  SaveSettingsButton({
    Key? key,
    required this.settingsList,
    this.additionalActions,
  }) : super(key: key);

  @override
  State<SaveSettingsButton> createState() => _SaveSettingsButtonState();
}

class _SaveSettingsButtonState extends State<SaveSettingsButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var preferences = SharedPreferences.getInstance();
        SharedPreferences prefs = await preferences;
        widget.settingsList.forEach((e) async {
          await prefs.setString(e.preferenceName, e.value);
        });
        var scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          SnackBar(
            content: const Text('Настройки сохранены'),
          ),
        );
        if (widget.additionalActions != null) widget.additionalActions!();
      },
      child: Text('Сохранить и перезагрузить'),
    );
  }
}
