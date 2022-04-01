import 'package:flutter/material.dart';
import 'package:konoplev_settings_ui/src/Settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextSettingTile extends Setting {
  TextEditingController textEditingController = TextEditingController();

  TextSettingTile({
    Key? key,
    required String title,
    required String preferenceName,
  }) : super(
          key: key,
          title: title,
          preferenceName: preferenceName,
        );

  @override
  State<TextSettingTile> createState() => _TextSettingTileState();
}

class _TextSettingTileState extends State<TextSettingTile> {
  @override
  void initState() {
    () async {
      var preferences = SharedPreferences.getInstance();
      SharedPreferences prefs = await preferences;
      String newvalue = await prefs.getString(widget.preferenceName) ?? '';
      setState(() {
        widget.value = newvalue;
        widget.textEditingController.text = newvalue;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: Text(widget.value),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(widget.title),
            content: TextFormField(
              style: widget.textStyle,
              controller: widget.textEditingController,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Отмена'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.value = widget.textEditingController.text;
                  });
                  Navigator.pop(context);
                },
                child: Text('Ок'),
              ),
            ],
          ),
        );
      },
    );
  }
}
