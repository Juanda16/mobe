// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SettingsPage extends StatefulWidget {
//   const SettingsPage({Key? key}) : super(key: key);
//
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   bool _isDarkMode = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }
//
//   void _loadSettings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _isDarkMode = prefs.getBool('isDarkMode') ?? false;
//     });
//   }
//
//   void _saveSettings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isDarkMode', _isDarkMode);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: const Text('Dark Mode'),
//             trailing: Switch(
//               value: _isDarkMode,
//               onChanged: (value) {
//                 setState(() {
//                   _isDarkMode = value;
//                 });
//                 _saveSettings();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSpanish = true;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    bool _isDarkMode = brightness == Brightness.dark;
    isDarkMode = _isDarkMode;
    print('_isDarkMode??? {$_isDarkMode}');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${AppLocalizations.of(context)!.language} En/Es'),
            value: isSpanish,
            onChanged: (value) {
              if (value) {
                MyApp.of(context).changeLocale(const Locale('es'));
              } else {
                MyApp.of(context).changeLocale(const Locale('en'));
              }
              setState(() {
                isSpanish = value;
              });
            },
          ),
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.darkMode),
            value: isDarkMode,
            onChanged: (value) {
              if (value)
                MyApp.of(context).changeTheme(ThemeMode.dark);
              else
                MyApp.of(context).changeTheme(ThemeMode.light);
              setState(() {
                isDarkMode = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
