import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:studio_projects/views/main/settings/settings_bloc.dart';
import 'package:studio_projects/views/main/settings/settings_event.dart';
import 'package:studio_projects/views/main/settings/settings_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  static const id = 'setting';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final settingsBloc = BlocProvider.of<SettingsBloc>(context);

        print(AppLocalizations.of(context)!.preferences);
        print("Hello");

        return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("App Settings", style: TextStyle(fontSize: 16),),
            ),
            ListTile(
              title: const Text("Change Location Settings"),
              onTap: () {
                AppSettings.openAppSettings();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text("Account Settings",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
              ],
            ),
            const ListTile(
              title: Text("Edit Information"),
            ),
            const ListTile(
              title: Text("Change Password"),
            ),
            ListTile(
              onTap: () {
                settingsBloc.add(OnLogOut(context));
                print("Logged Out");
              },
              title: const Text("Log Out"),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(AppLocalizations.of(context)!.preferences,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
              ],
            ),
            SwitchListTile.adaptive(
                title: Text(AppLocalizations.of(context)!.darkMode),
                value: settingsBloc.state.settings.darkMode!,
                onChanged: (value) {
                  setState(() {
                    settingsBloc.add(OnThemeModeChanged(darkMode: value));
                    print(settingsBloc.state.settings!.darkMode);
                  });
                }),
            ListTile(
              title: Text(AppLocalizations.of(context)!.language),
              trailing: PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      child: Text("English"),
                      value: "en",
                    ),
                    const PopupMenuItem(
                      child: Text("Thai"),
                      value: "th",
                    ),
                  ];
                },
                onSelected: (value) {
                  setState(() {
                    settingsBloc.add(OnLanguageChanged(languageId: value));
                    print(value);
                  });
                },
              ),
            )
          ],
        ));
      },
    );
  }
}
