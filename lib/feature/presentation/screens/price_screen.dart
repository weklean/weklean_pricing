import 'package:flutter/material.dart';
import 'package:weklean_package/weklean_package.dart';
import 'package:weklean_pricing/feature/presentation/widgets/price_display_widget.dart';
import 'package:weklean_pricing/feature/presentation/widgets/price_options_form.dart';

class PriceScreen extends StatelessWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarWidget(canGoBack: false, title: "Pricing",),
      body: RoundedBodyWidget(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool isMobile = constraints.maxWidth < 768;
            if (isMobile) {
              return const _PriceMobileView();
            } else {
              return const _PriceDesktopView();
            }
          },
        )
      ),
    );
  }
}

class _PriceMobileView extends StatelessWidget {
  const _PriceMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const widgets = [PriceOptionsForm(), PriceDisplayWidget()];
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (context, index) {
        return widgets[index];
      }
    );
  }
}

class _PriceDesktopView extends StatelessWidget {
  const _PriceDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: PriceOptionsForm()),
        Expanded(child: PriceDisplayWidget())
      ],
    );
  }
}

