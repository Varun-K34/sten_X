import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:varun_s_application20/database/signup_db.dart';
import 'package:varun_s_application20/database/summary.dart';

import 'package:varun_s_application20/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(SignupdbAdapter().typeId)) {
    Hive.registerAdapter(SignupdbAdapter());
  }
  if (!Hive.isAdapterRegistered(summarytextAdapter().typeId)) {
    Hive.registerAdapter(summarytextAdapter());
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'StenX',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.oneScreen,

      
      routes: AppRoutes.routes,
    );
  }
}
