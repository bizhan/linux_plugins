import 'package:flutter/material.dart';
import 'fragments/home_page.dart';
import 'fragments/provider_path_page.dart';
import 'fragments/connectivity_page.dart';
import 'fragments/video_player_page.dart';
import 'fragments/serialport_page.dart';
import 'routes/page_route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes:  {
        PageRoutes.home: (context) => const HomePage(),
        PageRoutes.providerPath: (context) => const ProviderPathPage(),
        PageRoutes.connectivity: (context) => const ConnectivityPage(),
        PageRoutes.videoPlayer: (context) => const VideoPlayerPage(),
        PageRoutes.serialport: (context) => const SerialPortPage(),
      },
    );
  }
}