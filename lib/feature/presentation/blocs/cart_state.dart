part of 'cart_cubit.dart';

@immutable
class CartState extends Equatable {
  final CartModel cart;

  const CartState(this.cart);

  @override
  List<Object?> get props => [cart];
}