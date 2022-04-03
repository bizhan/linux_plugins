import 'package:flutter/material.dart';
import 'package:linux_plugins/routes/page_route.dart';
import 'package:linux_plugins/widgets/create_drawer_body_item.dart';
import 'package:linux_plugins/widgets/create_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.home),
          ),
          const Divider(),
          createDrawerBodyItem(
            icon: Icons.directions,
            text: 'Provider Path',
            onTap: () =>
                Navigator.pushReplacementNamed(
                    context, PageRoutes.providerPath),
          ),
          createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Connectivity',
            onTap: () =>
                Navigator.pushReplacementNamed(
                    context, PageRoutes.connectivity),
          ),
          createDrawerBodyItem(
            icon: Icons.video_stable,
            text: 'Video Player',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.videoPlayer),
          ),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: 'Serial',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.serialport),
          ),
          const Divider(),
          ListTile(
            title: const Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}