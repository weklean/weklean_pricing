import 'dart:math';

import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final CustomerType customer;
  final double eventsQuantity;
  final double participants;
  final double rewardPerParticipant;
  final bool supervision;
  final bool marketplacePresence;
  final bool shootVideos;
  final VideosFrequency videosFrequency;
  final bool inAppAds;

  const CartModel({
    required this.eventsQuantity,
    required this.participants,
    required this.rewardPerParticipant,
    required this.supervision,
    required this.marketplacePresence,
    required this.shootVideos,
    required this.inAppAds,
    required this.customer,
    required this.videosFrequency
  });

  CartModel copyWith({
    CustomerType? customer,
    double? eventsQuantity,
    double? participants,
    double? rewardPerParticipant,
    bool? supervision,
    bool? marketplacePresence,
    bool? shootVideos,
    VideosFrequency? videosFrequency,
    bool? inAppAds,
  }) {
    return CartModel(
      customer: customer ?? this.customer,
      eventsQuantity: eventsQuantity ?? this.eventsQuantity,
      participants: participants ?? this.participants,
      rewardPerParticipant: rewardPerParticipant ?? this.rewardPerParticipant,
      supervision: supervision ?? this.supervision,
      marketplacePresence: marketplacePresence ?? this.marketplacePresence,
      shootVideos: shootVideos ?? this.shootVideos,
      videosFrequency: videosFrequency ?? this.videosFrequency,
      inAppAds: inAppAds ?? this.inAppAds
    );
  }

  double get pricePerEvent {
    return eventBasePrice + inAppAdsPrice + _supervisionPrice + marketplacePresencePrice;
  }

  double get totalPrice {
    return max(0, eventsQuantity) * pricePerEvent + totalVideosPrice;
  }

  double get eventBasePrice {
    double price = max(0, participants) * max(0, rewardPerParticipant.toDouble());

    if (customer == CustomerType.entreprise) {
      if (eventsQuantity <= 4) {
        price += 200;
      } else if (eventsQuantity <= 7) {
        price += 100;
      }
    }
    else if (customer == CustomerType.mairie) {
      if (eventsQuantity <= 4) {
        price += 200;
      }
    }
    return price;
  }

  double get inAppAdsPrice {
    if (inAppAds == true) return 200;
    return 0;
  }

  double get marketplacePresencePrice {
    if (marketplacePresence == true && customer == CustomerType.entreprise) return 900;
    return 0;
  }

  double get _supervisionPrice {
    if (supervision == false) return 0;
    if (participants >= 25) return 700;
    return 500;
  }

  double get totalVideosPrice {
    if (customer == CustomerType.mairie) return 0;
    if (shootVideos == false) return 0;
    switch (videosFrequency) {
      case VideosFrequency.eachEvent: return eventsWithVideos * 600;
      case VideosFrequency.halfEvents: return eventsWithVideos * 900;
    }
  }

  double get eventsWithVideos {
    if (shootVideos == false) return 0;
    switch (videosFrequency) {
      case VideosFrequency.eachEvent: return eventsQuantity;
      case VideosFrequency.halfEvents: return (eventsQuantity/2).ceilToDouble();
    }
  }

  double get marketplaceDisplayedMonths {
    if (eventsQuantity >= 8) return 12;
    return eventsQuantity;
  }

  factory CartModel.defaultModel() {
    return const CartModel(
      customer: CustomerType.entreprise,
      eventsQuantity: 10,
      participants: 50,
      rewardPerParticipant: 20,
      supervision: true,
      marketplacePresence: true,
      shootVideos: true,
      videosFrequency: VideosFrequency.eachEvent,
      inAppAds: true,
    );
  }

  @override
  List<Object?> get props => [
    eventsQuantity,
    participants,
    rewardPerParticipant,
    supervision,
    marketplacePresence,
    shootVideos,
    inAppAds,
    customer,
    videosFrequency
  ];
}

enum CustomerType {
  mairie,
  entreprise
}

enum VideosFrequency {
  eachEvent,
  halfEvents
}