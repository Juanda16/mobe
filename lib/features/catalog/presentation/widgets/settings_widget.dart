import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.darkMode),
          trailing: Switch(
            value: false,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
