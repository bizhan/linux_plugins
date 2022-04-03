import 'package:flutter/material.dart';
import 'package:linux_plugins/navigationDrawer/navigation_drawer.dart';
import 'package:linux_plugins/fragments/plugins/path_provider.dart';

class ProviderPathPage extends StatelessWidget {
  static const String routeName = '/providerPathPage';

  const ProviderPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider Path"),
        ),
        drawer: const NavigationDrawer(),
        body: const PathProvider(title: 'Path Provider'));
  }
}