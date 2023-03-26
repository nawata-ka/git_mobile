import 'package:flutter/material.dart';
import 'package:salonapp/pages/SettingPage.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../uidata.dart';

class SettingPageState extends State<SettingPage> {
  
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Account'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              onPressed: (context) {
                Navigator.of(context, rootNavigator: true).pushNamed(UIData.accountPageRoute);
              },
              leading: Icon(Icons.people),
              title: Text('Acount'),
              value: Text('Kaori Nawata'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.email),
              title: Text('E-mail'),
              //value: Text('415-XXXX-XXXX'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              //value: Text('English'),
            ),
          ],
        ),
        SettingsSection(
          title: Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: Icon(Icons.format_paint),
              title: Text('Enable custom theme'),
            ),
          ],
        ),
        
      ],
    );
  }
}