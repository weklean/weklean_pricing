import 'package:flutter/material.dart';
import 'package:weklean_package/weklean_package.dart';

abstract class _GenericSlider extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final String valueText;
  final void Function(double) onChanged;
  const _GenericSlider({
    Key? key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.valueText,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(label),
      title: Slider(
        label: label,
        value: value,
        min: min,
        max: max,
        divisions: divisions,
        onChanged: onChanged
      ),
      trailing: Text(valueText),
    );
  }
}


class EventsQuantitySlider extends _GenericSlider {
  EventsQuantitySlider({
    super.key,
    required super.value,
    required super.onChanged
  }) : super(
    min: 1,
    max: 10,
    divisions: 9,
    label: 'Events',
    valueText: value.toString()
  );
}

class ParticipantsSlider extends _GenericSlider {
  ParticipantsSlider({
    super.key,
    required super.value,
    required super.onChanged
  }) : super(
    min: 10,
    max: 50,
    divisions: 40,
    label: 'Participants par event',
    valueText: value.toString()
  );
}

class KleansPerParticipantSlider extends _GenericSlider {
  KleansPerParticipantSlider({
    super.key,
    required super.value,
    required super.onChanged
  }) : super(
    min: 100,
    max: 200,
    divisions: 2,
    label: 'Recompense par utilisateur par event',
    valueText: "${value.toEuro()} €"
  );
}