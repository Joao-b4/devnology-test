// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CartController = BindInject(
  (i) => CartController(i<IGetCartItems>(), i<IAddQuantityCartItem>(),
      i<IRemoveQuantityCartItem>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  final _$cartItemsAtom = Atom(name: '_CartControllerBase.cartItems');

  @override
  List<Cart> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(List<Cart> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  final _$countCartItemsAtom = Atom(name: '_CartControllerBase.countCartItems');

  @override
  int get countCartItems {
    _$countCartItemsAtom.reportRead();
    return super.countCartItems;
  }

  @override
  set countCartItems(int value) {
    _$countCartItemsAtom.reportWrite(value, super.countCartItems, () {
      super.countCartItems = value;
    });
  }

  final _$totalPriceAtom = Atom(name: '_CartControllerBase.totalPrice');

  @override
  double get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  final _$getCartItemsAsyncAction =
      AsyncAction('_CartControllerBase.getCartItems');

  @override
  Future getCartItems() {
    return _$getCartItemsAsyncAction.run(() => super.getCartItems());
  }

  final _$addQuantityProductAsyncAction =
      AsyncAction('_CartControllerBase.addQuantityProduct');

  @override
  Future addQuantityProduct(Cart cart) {
    return _$addQuantityProductAsyncAction
        .run(() => super.addQuantityProduct(cart));
  }

  final _$removeQuantityProductAsyncAction =
      AsyncAction('_CartControllerBase.removeQuantityProduct');

  @override
  Future removeQuantityProduct(Cart cart) {
    return _$removeQuantityProductAsyncAction
        .run(() => super.removeQuantityProduct(cart));
  }

  @override
  String toString() {
    return '''
cartItems: ${cartItems},
countCartItems: ${countCartItems},
totalPrice: ${totalPrice}
    ''';
  }
}
