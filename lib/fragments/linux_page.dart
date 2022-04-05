import 'package:flutter/material.dart';
import 'package:linux_plugins/fragments/plugins/bluez.dart';
import 'package:linux_plugins/fragments/plugins/gsettings.dart';
import 'package:linux_plugins/fragments/plugins/xdg_directories.dart';
import 'package:linux_plugins/navigationDrawer/navigation_drawer.dart';
import 'package:linux_plugins/fragments/plugins/fwupd.dart';

class LinuxPage extends StatelessWidget {
  static const String routeName = '/linuxPage';

  const LinuxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
            length: 4,
            child: Scaffold(
              drawer: const NavigationDrawer(),
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Fwupd'),
                    Tab(text: 'Bluez'),
                    Tab(text: 'GSettings'),
                    Tab(text: 'XDG Directories'),
                  ],
                ),
                title: const Text('Linux Specific'),
              ),
              body: const TabBarView(
                children: [
                  FwupdPage(title: 'fwupd'),
                  BluezPage(title: 'BlueZ'),
                  GSettingsPage(title: 'GSettings'),
                  XdgDirectoriesPage(title: 'XDG Directories'),
                ],
              ),
          ),
        );
    }
  }