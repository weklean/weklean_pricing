import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weklean_package/weklean_package.dart';
import 'package:weklean_pricing/feature/presentation/blocs/cart_cubit.dart';

class PriceDisplayWidget extends StatelessWidget {
  const PriceDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.primarySoftColor,
        borderRadius: MyShapes.roundedBordersRadius,
        //border: Border.all(width: 3, color: MyColors.primaryColor)
      ),
      margin: MyShapes.mediumPadding,
      padding: MyShapes.smallPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          _TotalPriceText(),
          _EventUnitPrice(),
          _VideosTotalPrice(),
          _EventsWithVideosQuantity(),
          _MarketplacePresenceDuration()
        ],
      ),
    );
  }
}

class _TotalPriceText extends StatelessWidget {
  const _TotalPriceText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyShapes.mediumPadding,
      child: BlocSelector<CartCubit, CartState, double>(
        selector: (state) => state.cart.totalPrice,
        builder: (context, value) {
          return Text("PRIX TOTAL: $value€", style: MyTextStyles.headline2, textAlign: TextAlign.center,);
        }
      ),
    );
  }
}

class _EventUnitPrice extends StatelessWidget {
  const _EventUnitPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;
    return BlocSelector<CartCubit, CartState, double>(
      selector: (state) => state.cart.pricePerEvent,
      builder: (context, value) {
        return Text("Prix par Event: $value€", style: textStyle,);
      }
    );
  }
}

class _VideosTotalPrice extends StatelessWidget {
  const _VideosTotalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;
    return BlocSelector<CartCubit, CartState, double>(
      selector: (state) => state.cart.totalVideosPrice,
      builder: (context, value) {
        return Text("Prix total videos: $value€", style: textStyle,);
      }
    );
  }
}

class _EventsWithVideosQuantity extends StatelessWidget {
  const _EventsWithVideosQuantity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;
    return BlocSelector<CartCubit, CartState, double>(
      selector: (state) => state.cart.eventsWithVideos,
      builder: (context, value) {
        return Text("Nombre d'Events avec videos: $value", style: textStyle,);
      }
    );
  }
}

class _MarketplacePresenceDuration extends StatelessWidget {
  const _MarketplacePresenceDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;
    return BlocSelector<CartCubit, CartState, double>(
      selector: (state) => state.cart.marketplaceDisplayedMonths,
      builder: (context, value) {
        return Text("Temps de presence marketplace: $value", style: textStyle,);
      }
    );
  }
}
