import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weklean_pricing/feature/domain/models/cart_model.dart';

abstract class GenericSwitchWidget<T> extends StatelessWidget {
  // first value is false
  final SliderOption<T> firstOption;
  // second value is true
  final SliderOption<T> secondOption;

  final T selectedValue;
  final void Function(T) onChanged;
  const GenericSwitchWidget({
    Key? key,
    required this.firstOption,
    required this.secondOption,
    required this.selectedValue,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(firstOption.label),
          Switch(
            value: selectedValue == secondOption.value ? true : false,
            onChanged: (bool value) {
              value ? onChanged(secondOption.value) : onChanged(firstOption.value);
            }
          ),
          Text(secondOption.label)
        ],
      ),
    );
  }
}

class VideosFrequencySwitch extends GenericSwitchWidget<VideosFrequency> {
  const VideosFrequencySwitch({
    super.key,
    required super.selectedValue,
    required super.onChanged
  }) : super(
    firstOption: const SliderOption<VideosFrequency>(label: 'chaque event', value: VideosFrequency.eachEvent),
    secondOption: const SliderOption<VideosFrequency>(label: '1 event sur 2', value: VideosFrequency.halfEvents),
  );
}

class CustomerTypeSwitch extends GenericSwitchWidget<CustomerType> {
  const CustomerTypeSwitch({
    super.key,
    required super.selectedValue,
    required super.onChanged
  }) : super(
    firstOption: const SliderOption<CustomerType>(label: 'Mairie', value: CustomerType.mairie),
    secondOption: const SliderOption<CustomerType>(label: 'Entreprise', value: CustomerType.entreprise),
  );
}

class SliderOption<T> extends Equatable {
  final String label;
  final T value;

  const SliderOption({required this.label, required this.value});

  @override
  List<Object?> get props => [label, value];
}