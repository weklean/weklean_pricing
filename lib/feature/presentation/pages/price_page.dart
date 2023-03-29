import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weklean_pricing/feature/presentation/blocs/cart_cubit.dart';
import 'package:weklean_pricing/feature/presentation/screens/price_screen.dart';

class PricePage extends StatelessWidget {
  const PricePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(),
      child: const PriceScreen(),
    );
  }
}
