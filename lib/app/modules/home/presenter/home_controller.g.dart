// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<IListAllProducts>(), i<IGetCartItems>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$latestProductsAtom = Atom(name: '_HomeControllerBase.latestProducts');

  @override
  List<Product> get latestProducts {
    _$latestProductsAtom.reportRead();
    return super.latestProducts;
  }

  @override
  set latestProducts(List<Product> value) {
    _$latestProductsAtom.reportWrite(value, super.latestProducts, () {
      super.latestProducts = value;
    });
  }

  final _$countCartItemsAtom = Atom(name: '_HomeControllerBase.countCartItems');

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

  final _$getProductsAsyncAction =
      AsyncAction('_HomeControllerBase.getProducts');

  @override
  Future getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  final _$getCountCartItemsAsyncAction =
      AsyncAction('_HomeControllerBase.getCountCartItems');

  @override
  Future getCountCartItems() {
    return _$getCountCartItemsAsyncAction.run(() => super.getCountCartItems());
  }

  @override
  String toString() {
    return '''
latestProducts: ${latestProducts},
countCartItems: ${countCartItems}
    ''';
  }
}
