import 'package:flutter/material.dart';
import 'package:linux_plugins/navigationDrawer/navigation_drawer.dart';
//import 'package:linux_plugins/fragments/plugins/connectivity_plus.dart';
import 'package:linux_plugins/fragments/plugins/network_info_plus.dart';

class ConnectivityPage extends StatelessWidget {
  static const String routeName = '/connectivityPage';

  const ConnectivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Connectivity"),
        ),
        drawer: const NavigationDrawer(),
        body: const NetworkInfoPlusPage(title: 'Network Info Plus'));
  }
}
