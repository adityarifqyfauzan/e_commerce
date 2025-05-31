import 'package:e_commerce/utils/devices/device_utility.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text("Hello, World! ${!DeviceUtils.isAndroid() ? "you're Android user" : "you're IPhone user"}"),),
      ),
    );
  }
}

