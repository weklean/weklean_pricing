import 'package:flutter/material.dart';
import 'package:weklean_package/weklean_package.dart';
import 'package:weklean_pricing/feature/presentation/widgets/hero_widget.dart';
import 'package:weklean_pricing/feature/presentation/widgets/price_options_form.dart';

class PriceScreen extends StatelessWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWidget(canGoBack: false, title: "Pricing",),
      body: RoundedBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeroWidget(),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final isMobile = constraints.maxWidth < 768;
                  if (isMobile) return const PriceOptionsForm();
                  return const PriceOptionsFormDesktopView();
                },
              )
            ],
          ),
        )
      ),
    );
  }
}


