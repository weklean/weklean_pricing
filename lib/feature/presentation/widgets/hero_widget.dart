import 'package:flutter/material.dart';
import 'package:weklean_package/weklean_package.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage("assets/illustrations/hero_background.jpg")
        )
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: MyShapes.defaultBorderRadius
        ),
        height: 150,
        width: MediaQuery.of(context).size.width * 0.6,
        child: const Text('Calculez vote tarif', style: MyTextStyles.headline3Primary,),
      ),
    );
  }
}