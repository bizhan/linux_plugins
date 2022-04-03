import 'package:flutter/material.dart';
import 'package:linux_plugins/navigationDrawer/navigation_drawer.dart';
import 'package:linux_plugins/fragments/plugins/flutter_libserialport.dart';

class SerialPortPage extends StatelessWidget {
  static const String routeName = '/serialPortPage';

  const SerialPortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Serial Ports"),
        ),
        drawer: const NavigationDrawer(),
        body: const FlutterLibSerialPort(title: 'Flutter libserialport'));
  }
}