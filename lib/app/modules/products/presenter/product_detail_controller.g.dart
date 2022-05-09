// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProductDetailController = BindInject(
  (i) => ProductDetailController(
      i<IGetDetailProduct>(), i<IGetCartItems>(), i<IAddToCart>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailController on _ProductDetailControllerBase, Store {
  final _$productAtom = Atom(name: '_ProductDetailControllerBase.product');

  @override
  Product? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$countCartItemsAtom =
      Atom(name: '_ProductDetailControllerBase.countCartItems');

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

  final _$getProductAsyncAction =
      AsyncAction('_ProductDetailControllerBase.getProduct');

  @override
  Future getProduct(String id) {
    return _$getProductAsyncAction.run(() => super.getProduct(id));
  }

  final _$getCountCartItemsAsyncAction =
      AsyncAction('_ProductDetailControllerBase.getCountCartItems');

  @override
  Future getCountCartItems() {
    return _$getCountCartItemsAsyncAction.run(() => super.getCountCartItems());
  }

  final _$addToCartAsyncAction =
      AsyncAction('_ProductDetailControllerBase.addToCart');

  @override
  Future addToCart() {
    return _$addToCartAsyncAction.run(() => super.addToCart());
  }

  @override
  String toString() {
    return '''
product: ${product},
countCartItems: ${countCartItems}
    ''';
  }
}
