import 'package:flutter/material.dart';
import 'package:weklean_pricing/core/style.dart';

abstract class _GenericCheckBoxListTile extends CheckboxListTile {
  _GenericCheckBoxListTile({
    required super.value,
    required super.onChanged,
    super.enabled,
    required String title,
    required String description
  }) : super(
    title: Text(title, style: CustomStyle.titleTextStyle),
    subtitle: Text(description, style: CustomStyle.bodyTextStyle,),
    controlAffinity: ListTileControlAffinity.leading,
  );

}

class InAppAdsCheckBox extends _GenericCheckBoxListTile {
  InAppAdsCheckBox({
    required super.value,
    required super.onChanged,
  }) : super(
    title: 'Publicité',
    description: 'Bannière publicitaire sous chacun de vos Events',
  );
}

class MarketplacePresenceCheckBox extends _GenericCheckBoxListTile {
  MarketplacePresenceCheckBox({
    required super.value,
    required super.onChanged,
  }) : super(
    title: 'Présence Marketplace',
    description: '1 event = 1 mois de présence marketplace\n1 an de présence au delà de 8 events'
  );
}

class SupervisionCheckBox extends _GenericCheckBoxListTile {
  SupervisionCheckBox({
    required super.value,
    required super.onChanged,
  }) : super(
    title: 'Organisation (obligatoire)',
    description: "Encadrement de l'event + matériel",
    enabled: false
  );
}

class ShootVideosCheckBox extends _GenericCheckBoxListTile {
  ShootVideosCheckBox({
    required super.value,
    required super.onChanged,
  }) : super(
    title: 'Videos',
    description: '3 videos filmees durant vos events pour votre communication'
  );
}