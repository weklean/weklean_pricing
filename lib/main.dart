import 'package:flutter/material.dart';
import 'package:weklean_package/weklean_package.dart';
import 'package:weklean_pricing/feature/presentation/pages/price_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeKlean Pricing',
      theme: MyTheme.theme.copyWith(
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(MyColors.primaryColor),
          trackColor: MaterialStateProperty.all(MyColors.primaryShadowColor),
        )
      ),
      home: const PricePage(),
    );
  }
}