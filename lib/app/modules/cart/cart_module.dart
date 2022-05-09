import 'package:devnology/app/modules/cart/presenter/pages/cart/cart_controller.dart';
import 'package:devnology/app/modules/cart/presenter/pages/cart/cart_page.dart';
import 'package:devnology/app/modules/cart/presenter/pages/order_placed/order_placed_page.dart';
import 'package:devnology/core/domain/usecases/get_cart_items.dart';
import 'package:devnology/core/domain/usecases/add_quantity_cart_item.dart';
import 'package:devnology/core/domain/usecases/remove_quantity_cart_item.dart';
import 'package:devnology/core/infra/adapters/local_storage_adapter_hive.dart';
import 'package:devnology/core/infra/repositories/cart_repository_hive.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LocalStorageHiveAdapter()),
    Bind((i) => CartRepositoryHive(i.get<LocalStorageHiveAdapter>())),
    Bind<IGetCartItems>((i) => GetCartItems(i.get<CartRepositoryHive>())),
    Bind<IAddQuantityCartItem>((i) => AddQuantityCartItem(i.get<CartRepositoryHive>())),
    Bind<IRemoveQuantityCartItem>((i) =>  RemoveQuantityCartItem(i.get<CartRepositoryHive>())),
    $CartController
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CartPage()),
    ChildRoute('/orderplaced', child: (_, args) => OrderPlacedPage()),
  ];
}