import 'package:flutter/material.dart';
import 'package:weklean_package/weklean_package.dart';

class CustomStyle {

  CustomStyle._();

  static const greyColor = Colors.black38;
  static final titleTextStyle = MyTextStyles.headline5.copyWith(color: greyColor);
  static final bodyTextStyle = MyTextStyles.bigBodyText.copyWith(color: greyColor);
  static final sectionTitleStyle = MyTextStyles.headline3.copyWith(color: Colors.grey.shade400, decoration: TextDecoration.underline);
}