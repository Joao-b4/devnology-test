import 'package:devnology/app/modules/products/presenter/product_detail_controller.dart';
import 'package:devnology/app/modules/products/presenter/product_detail_page.dart';
import 'package:devnology/core/domain/usecases/add_to_cart.dart';
import 'package:devnology/core/domain/usecases/get_cart_items.dart';
import 'package:devnology/core/domain/usecases/get_detail_product.dart';
import 'package:devnology/core/infra/adapters/local_storage_adapter_hive.dart';
import 'package:devnology/core/infra/repositories/cart_repository_hive.dart';
import 'package:devnology/core/infra/repositories/product_repository_hive.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LocalStorageHiveAdapter()),
    Bind((i) => ProductRepositoryHive(i.get<LocalStorageHiveAdapter>())),
    Bind<IGetDetailProduct>((i) => GetDetailProduct(i.get<ProductRepositoryHive>())),
    Bind((i) => CartRepositoryHive(i.get<LocalStorageHiveAdapter>())),
    Bind<IGetCartItems>((i) => GetCartItems(i.get<CartRepositoryHive>())),
    Bind<IAddToCart>((i) => AddToCart(i.get<CartRepositoryHive>())),
    $ProductDetailController
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:id', child: (_, args) => ProductDetailPage(id: args.data,)),
  ];
}