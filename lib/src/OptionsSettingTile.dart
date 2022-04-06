import 'package:flutter/material.dart';
import 'package:konoplev_settings_ui/src/Settings.dart';

class OptionsSettingTile extends Setting {
  Map<String, String> options;
  void Function() onTapSetting;
  OptionsSettingTile({
    Key? key,
    required this.options,
    required String title,
    required this.onTapSetting,
    String value = '',
  }) : super(
          key: key,
          title: title,
          value: value,
        );

  @override
  State<OptionsSettingTile> createState() => _OptionsSettingTileState();
}

class _OptionsSettingTileState extends State<OptionsSettingTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      subtitle: Text(widget.value),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: ListView(
                children: [
                  ...widget.options.entries
                      .map((e) => ListTile(
                            title: Text(e.key),
                            trailing: widget.value == e.value
                                ? Icon(Icons.done)
                                : Container(
                                    width: 0,
                                    height: 0,
                                  ),
                            onTap: () {
                              // setState(() {
                              //   widget.value = e.value;
                              // });
                              widget.onTapSetting();
                              Navigator.pop(context);
                            },
                          ))
                      .toList()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
