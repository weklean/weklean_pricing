import 'package:flutter/material.dart';

class InAppAdsCheckBox extends CheckboxListTile {
  const InAppAdsCheckBox({
    super.key,
    required super.value,
    required super.onChanged,
  }) : super(
    controlAffinity: ListTileControlAffinity.leading,
    title: const Text('Publicité'),
    subtitle: const Text('Bannière publicitaire sous chacun de vos Events')
  );
}

class MarketplacePresenceCheckBox extends CheckboxListTile {
  const MarketplacePresenceCheckBox({
    super.key,
    required super.value,
    required super.onChanged,
  }) : super(
    controlAffinity: ListTileControlAffinity.leading,
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
    enabled: false,
    controlAffinity: ListTileControlAffinity.leading,
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
    controlAffinity: ListTileControlAffinity.leading,
    title: const Text('Videos'),
  );
}