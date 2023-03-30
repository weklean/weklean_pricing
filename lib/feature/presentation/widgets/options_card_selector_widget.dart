import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weklean_package/weklean_package.dart';
import 'package:weklean_pricing/core/style.dart';
import 'package:weklean_pricing/feature/domain/models/cart_model.dart';

class CustomerOptionsCardSelectorWidget extends OptionsCardSelectorWidget<CustomerType> {
  const CustomerOptionsCardSelectorWidget({
    super.key,
    required super.selectedValue,
    required super.onChanged
  }) : super(
    options: OptionCardModel.customer,
  );
}


class OptionsCardSelectorWidget<T> extends StatelessWidget {
  final List<OptionCardModel<T>> options;
  final T selectedValue;
  final void Function(T) onChanged;
  const OptionsCardSelectorWidget({
    Key? key,
    required this.options,
    required this.selectedValue,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: options.map((e) {
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(e.value),
            child: OptionCard<T>(
              option: e,
              isSelected: selectedValue == e.value
            ),
          )
        );
      }).toList(),
    );
  }
}

class OptionCard<T> extends StatelessWidget {
  final OptionCardModel<T> option;
  final bool isSelected;
  const OptionCard({Key? key, required this.option, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(option.label, style: CustomStyle.titleTextStyle,),
        Container(
          clipBehavior: Clip.hardEdge,
          margin: MyShapes.mediumPadding,
          padding: MyShapes.smallPadding,
          decoration: BoxDecoration(
            color: isSelected ? MyColors.primaryShadowColor : null,
            borderRadius: MyShapes.defaultBorderRadius,
          ),
          child: SvgPicture.asset(
            option.image,
            height: 180,
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}

class OptionCardModel<T> extends Equatable {
  final T value;
  final String label;
  final String image;

  const OptionCardModel({required this.value, required this.label, required this.image});

  static const List<OptionCardModel<CustomerType>> customer = [
    OptionCardModel<CustomerType>(value: CustomerType.mairie, label: "Une Mairie", image: "assets/illustrations/city_girl.svg"),
    OptionCardModel<CustomerType>(value: CustomerType.entreprise, label: "Une Entreprise", image: "assets/illustrations/business_plan.svg"),
  ];

  @override
  List<Object?> get props => [value, label, image];
}