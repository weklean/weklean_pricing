import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weklean_pricing/feature/domain/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(CartModel.defaultModel()));

  CartModel cart = CartModel.defaultModel();

  void onParticipantsChanged(double value) {
    cart = cart.copyWith(participants: value);
    emitNotLoading();
  }

  void onEventsChanged(double value) {
    cart = cart.copyWith(eventsQuantity: value);
    emitNotLoading();
  }

  void onKleansPerParticipantChanged(double value) {
    cart = cart.copyWith(rewardPerParticipant: value);
    emitNotLoading();
  }

  void onCustomerTypeChanged(CustomerType customer) {
    cart = cart.copyWith(customer: customer);
    emitNotLoading();
  }

  void onVideosFrequencyChanged(VideosFrequency frequency) {
    cart = cart.copyWith(videosFrequency: frequency);
    emitNotLoading();
  }

  void onShootVideosChanged(bool? value) {
    if (value == null) return;
    cart = cart.copyWith(shootVideos: value);
    emitNotLoading();
  }

  void onInAppAdsChanged(bool? value) {
    if (value == null) return;
    cart = cart.copyWith(inAppAds: value);
    emitNotLoading();
  }

  void onMarketplacePresenceChanged(bool? value) {
    if (value == null) return;
    cart = cart.copyWith(marketplacePresence: value);
    emitNotLoading();
  }

  void onSupervisionChanged(bool? value) {
    if (value == null) return;
    cart = cart.copyWith(supervision: value);
    emitNotLoading();
  }

  void emitNotLoading() {
    emit(CartState(cart));
  }
}
