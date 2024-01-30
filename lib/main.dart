import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mimicon/config/app_theme.dart';
import 'package:mimicon/presentation/pages/export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          home: const CameraPage(),
        );
      }),
    );
  }
}
