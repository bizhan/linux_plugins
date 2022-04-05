import 'package:flutter/material.dart';
import 'package:linux_plugins/navigationDrawer/navigation_drawer.dart';
import 'package:linux_plugins/fragments/plugins/path_provider.dart';
import 'package:linux_plugins/fragments/plugins/shared_preferences.dart';
import 'package:linux_plugins/fragments/plugins/url_launcher.dart';
import 'package:linux_plugins/fragments/plugins/fwupd.dart';

class MiscPage extends StatelessWidget {
  static const String routeName = '/miscPage';

  const MiscPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
            length: 4,
            child: Scaffold(
              drawer: const NavigationDrawer(),
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Path'),
                    Tab(text: 'Shared Preferences'),
                    Tab(text: 'URL Launcher'),
                    Tab(text: 'fwupd'),
                  ],
                ),
                title: const Text('Misc'),
              ),
              body: const TabBarView(
                children: [
                  PathProvider(),
                  SharedPreferencesPage(),
                  UrlLauncherPage(title: 'Url Launcher'),
                  FwupdPage(title: 'fwupd'),
                ],
              ),
          ),
        );
    }

}
