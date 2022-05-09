import 'package:devnology/app/modules/home/presenter/home_controller.dart';
import 'package:devnology/app/modules/home/presenter/home_page.dart';
import 'package:devnology/core/domain/usecases/get_cart_items.dart';
import 'package:devnology/core/domain/usecases/list_all_products.dart';
import 'package:devnology/core/infra/adapters/local_storage_adapter_hive.dart';
import 'package:devnology/core/infra/repositories/cart_repository_hive.dart';
import 'package:devnology/core/infra/repositories/product_repository_hive.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LocalStorageHiveAdapter()),
    Bind((i) => ProductRepositoryHive(i.get<LocalStorageHiveAdapter>())),
    Bind<IListAllProducts>((i) => ListAllProducts(i.get<ProductRepositoryHive>())),
    Bind((i) => CartRepositoryHive(i.get<LocalStorageHiveAdapter>())),
    Bind<IGetCartItems>((i) => GetCartItems(i.get<CartRepositoryHive>())),
    $HomeController
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}