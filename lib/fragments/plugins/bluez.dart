import 'package:bluez/bluez.dart';
import 'package:flutter/material.dart';


class BluezPage extends StatefulWidget {
  const BluezPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _BluezState createState() => _BluezState();
}

class _BluezState extends State<BluezPage> {
  final _client = BlueZClient();

  @override
  void initState() {
    super.initState();
    _client.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scrollbar(
          child: ListView(
            children: [
              for (final device in _client.adapters)
                Builder(builder: (context) {
                  return ExpansionTile(
                    title: Text(device.alias),
                    children: [
                      CardListTile('Address', device.address),
                    ],
                  );
                }),
            ],
          ),
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

class CardListTile extends StatelessWidget {
  final String name;
  final String? value;

  CardListTile(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(value ?? 'N/A'),
        subtitle: Text(name),
      ),
    );
  }
}
