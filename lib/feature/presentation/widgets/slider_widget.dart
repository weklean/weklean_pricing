import 'package:flutter/material.dart';
import 'package:weklean_pricing/core/style.dart';

abstract class _GenericSlider extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final String Function(double)? textFormat;
  final void Function(double) onChanged;
  const _GenericSlider({
    Key? key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
   this.textFormat,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$label: ${textFormat?.call(value) ?? value.toString()}",
          style: CustomStyle.titleTextStyle,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                textFormat?.call(min) ?? min.toString(),
                textAlign: TextAlign.center,
                style: CustomStyle.bodyTextStyle,
              )
            ),
            Expanded(
              flex: 8,
              child: Slider(
                label: textFormat?.call(value) ?? value.toString(),
                value: value,
                min: min,
                max: max,
                divisions: divisions,
                onChanged: onChanged
              ),
            ),
            Expanded(
              child: Text(
                textFormat?.call(max) ?? max.toString(),
                textAlign: TextAlign.center,
                style: CustomStyle.bodyTextStyle
              )
            )
          ],
        )
      ],
    );
  }
}


class EventsQuantitySlider extends _GenericSlider {
  const EventsQuantitySlider({
    super.key,
    required super.value,
    required super.onChanged
  }) : super(
    min: 1,
    max: 10,
    divisions: 9,
    label: "Nombre d'Events",
  );
}

class ParticipantsSlider extends _GenericSlider {
  const ParticipantsSlider({
    super.key,
    required super.value,
    required super.onChanged
  }) : super(
    min: 20,
    max: 50,
    divisions: 6,
    label: 'Participants par event',
  );
}

class RewardPerParticipantSlider extends _GenericSlider {
  RewardPerParticipantSlider({
    super.key,
    required super.value,
    required super.onChanged
  }) : super(
    min: 10,
    max: 20,
    divisions: 2,
    label: 'Recompense par utilisateur par event',
    textFormat: (double value) => "$value €"
  );
}