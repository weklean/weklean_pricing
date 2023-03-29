import 'package:flutter/material.dart';

class InAppAdsCheckBox extends CheckboxListTile {
  const InAppAdsCheckBox({
    super.key,
    required super.value,
    required super.onChanged,
  }) : super(
    title: const Text('Publicité')
  );
}

class MarketplacePresenceCheckBox extends CheckboxListTile {
  const MarketplacePresenceCheckBox({
    super.key,
    required super.value,
    required super.onChanged,
  }) : super(
    title: const Text('Présence Marketplace'),
    subtitle: const Text('1 event = 1 mois de présence marketplace\n1 an de présence au delà de 8 events')
  );
}

class SupervisionCheckBox extends CheckboxListTile {
  const SupervisionCheckBox({
    super.key,
    required super.value,
    required super.onChanged,
  }) : super(
    title: const Text('Encadrement'),
    subtitle: const Text("Encadrement de l'event + matériel")
  );
}

class ShootVideosCheckBox extends CheckboxListTile {
  const ShootVideosCheckBox({
    super.key,
    required super.value,
    required super.onChanged,
  }) : super(
    title: const Text('Videos'),
  );
}