import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weklean_pricing/feature/domain/models/cart_model.dart';
import 'package:weklean_pricing/feature/presentation/blocs/cart_cubit.dart';
import 'package:weklean_pricing/feature/presentation/widgets/check_box_widget.dart';
import 'package:weklean_pricing/feature/presentation/widgets/slider_widget.dart';
import 'package:weklean_pricing/feature/presentation/widgets/switch_widget.dart';

class PriceOptionsForm extends StatelessWidget {
  const PriceOptionsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _CustomerTypeSwitch(),
        _EventsQuantitySlider(),
        _ParticipantsSlider(),
        _KleansPerParticipantSlider(),
        _ShootVideosCheckBox(),
        _VideoFrequencySwitch(),
        _InAppAdsCheckBox(),
        _MarketplacePresenceCheckBox(),
        _SupervisionCheckBox()
      ],
    );
  }
}

class _MarketplacePresenceCheckBox extends StatelessWidget {
  const _MarketplacePresenceCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cart.customer == CustomerType.mairie) return const SizedBox.shrink();
        if (state.cart.shootVideos) {
          return MarketplacePresenceCheckBox(
            value: state.cart.marketplacePresence,
            onChanged: context.read<CartCubit>().onMarketplacePresenceChanged
          );
        }
        return const SizedBox.shrink();
      }
    );
  }
}

class _SupervisionCheckBox extends StatelessWidget {
  const _SupervisionCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CartCubit, CartState, bool>(
      selector: (state) => state.cart.supervision,
      builder: (context, value) {
        return SupervisionCheckBox(
          value: value,
          onChanged: context.read<CartCubit>().onSupervisionChanged
        );
      }
    );
  }
}

class _InAppAdsCheckBox extends StatelessWidget {
  const _InAppAdsCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CartCubit, CartState, bool>(
      selector: (state) => state.cart.inAppAds,
      builder: (context, value) {
        return InAppAdsCheckBox(
          value: value,
          onChanged: context.read<CartCubit>().onInAppAdsChanged
        );
      }
    );
  }
}

class _KleansPerParticipantSlider extends StatelessWidget {
  const _KleansPerParticipantSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CartCubit, CartState, double>(
      selector: (state) => state.cart.kleansPerParticipant,
      builder: (context, value) {
        return KleansPerParticipantSlider(
          value: value,
          onChanged: context.read<CartCubit>().onKleansPerParticipantChanged
        );
      }
    );
  }
}

class _ParticipantsSlider extends StatelessWidget {
  const _ParticipantsSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CartCubit, CartState, double>(
      selector: (state) => state.cart.participants,
      builder: (context, value) {
        return ParticipantsSlider(
          value: value,
          onChanged: context.read<CartCubit>().onParticipantsChanged
        );
      }
    );
  }
}

class _EventsQuantitySlider extends StatelessWidget {
  const _EventsQuantitySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CartCubit, CartState, double>(
      selector: (state) => state.cart.eventsQuantity,
      builder: (context, value) {
        return EventsQuantitySlider(
          value: value,
          onChanged: context.read<CartCubit>().onEventsChanged
        );
      }
    );
  }
}

class _ShootVideosCheckBox extends StatelessWidget {
  const _ShootVideosCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cart.customer == CustomerType.mairie) return const SizedBox.shrink();
        return ShootVideosCheckBox(
          value: state.cart.shootVideos,
          onChanged: context.read<CartCubit>().onShootVideosChanged
        );
      }
    );
  }
}

class _VideoFrequencySwitch extends StatelessWidget {
  const _VideoFrequencySwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cart.customer == CustomerType.mairie) return const SizedBox.shrink();
        if (state.cart.shootVideos) {
          return VideosFrequencySwitch(
            selectedValue: state.cart.videosFrequency,
            onChanged: context.read<CartCubit>().onVideosFrequencyChanged
          );
        }
        return const SizedBox.shrink();
      }
    );
  }
}

class _CustomerTypeSwitch extends StatelessWidget {
  const _CustomerTypeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CartCubit, CartState, CustomerType>(
      selector: (state) => state.cart.customer,
      builder: (context, value) {
        return CustomerTypeSwitch(
          selectedValue: value,
          onChanged: context.read<CartCubit>().onCustomerTypeChanged
        );
      }
    );
  }
}
