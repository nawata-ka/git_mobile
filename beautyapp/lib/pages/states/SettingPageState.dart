import 'package:flutter/material.dart';
import 'package:beautyapp/pages/SettingPage.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../uidata.dart';

class SettingPageState extends State<SettingPage> {
  
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('Account'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              onPressed: (context) {
                //Navigator.of(context, rootNavigator: true).pushNamed(UIData.SettingPageRoute);
              },
              leading: Icon(Icons.people),
              title: const Text('Acount'),
              value: Text('Kaori Nawata'),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.email),
              title: Text('E-mail'),
              //value: Text('415-XXXX-XXXX'),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.password),
              title: Text('Password'),
              //value: Text('English'),
            ),
          ],
        ),       
      ],
    );
  }
}