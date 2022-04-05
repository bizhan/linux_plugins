import 'package:flutter/material.dart';
import 'package:dbus/dbus.dart';
import 'package:packagekit/packagekit.dart';


class PackagekitPage extends StatefulWidget {
  const PackagekitPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _PackagekitPageState createState() => _PackagekitPageState();
}

class _PackagekitPageState extends State<PackagekitPage> {

  final _client = PackageKitClient();

  @override
  void initState() {
    super.initState();
    _client.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                print('Server version: ${_client.versionMajor}.${_client.versionMinor}.${_client.versionMicro}');
                print('Backend: ${_client.backendDescription} (${_client.backendName})');
                print('Supported MIME types: ${_client.mimeTypes.join(', ')}');
              },
              child: const Text('Info'),
            ),
            ElevatedButton(
              onPressed: () async {
                var transaction = await _client.createTransaction();
                var completer = Completer();
                transaction.events.listen((event) {
                  if (event is PackageKitPackageEvent) {
                    var id = event.packageId;
                    var status = {
                          PackageKitInfo.available: 'Available',
                          PackageKitInfo.installed: 'Installed'
                        }[event.info] ??
                        '         ';
                    print('$status ${id.name}-${id.version}.${id.arch} (${id.data})  ${event.summary}');
                  } else if (event is PackageKitErrorCodeEvent) {
                    print('${event.code}: ${event.details}');
                  } else if (event is PackageKitFinishedEvent) {
                    completer.complete();
                  }
                });
                await transaction.getPackages();
                await completer.future;
              },
              child: const Text('Get Packages'),
            ),
            ElevatedButton(
              onPressed: () async {
                final settings = GSettings('org.gnome.desktop.notifications.application',
                path: '/org/gnome/desktop/notifications/application/org-gnome-terminal/');
                var id = (await settings.get('application-id') as DBusString).value;
                var enable = (await settings.get('enable') as DBusBoolean).value;
                print('Notifications for $id: $enable');
              },
              child: const Text('Relocatable Schema'),
            ),
            ElevatedButton(
              onPressed: () async {
                var settings = GSettings('org.gnome.desktop.interface');
                await settings.set('show-battery-percentage', const DBusBoolean(true));
              },
              child: const Text('Set'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _client.close();
  }
}
