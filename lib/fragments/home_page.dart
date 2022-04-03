import 'package:flutter/material.dart';
import 'package:linux_plugins/navigationDrawer/navigation_drawer.dart';
import 'package:linux_plugins/fragments/plugins/device_info_plus.dart';

class HomePage extends StatelessWidget {
 static const String routeName = '/homePage';

  const HomePage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const NavigationDrawer(),
        body: const DeviceInfoPlusPage(title: 'Device Info'));
 }
}
