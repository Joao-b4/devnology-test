import 'package:devnology/app/modules/cart/cart_module.dart';
import 'package:devnology/app/modules/home/home_module.dart';
import 'package:devnology/app/modules/products/products_module.dart';
import 'package:devnology/app/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/splash', module: SplashModule()),
    // ModuleRoute('/orders', module: LoginModule()),
    ModuleRoute('/products', module: ProductsModule()),
    ModuleRoute('/cart', module: CartModule()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}