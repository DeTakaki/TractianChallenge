import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'routing/app_router.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue[900],
        statusBarBrightness: Brightness.light,
      ),
    );
    return MaterialApp.router(
      title: 'Tractian',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        useMaterial3: true,
      ),
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: kDebugMode,
      routerConfig: router,
    );
  }
}
