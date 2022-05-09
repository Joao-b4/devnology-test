import 'package:devnology/core/domain/entities/product.dart';
import 'package:devnology/core/domain/entities/cart.dart';
import 'package:devnology/core/domain/usecases/get_cart_items.dart';
import 'package:devnology/core/domain/usecases/list_all_products.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IListAllProducts _usecaseListAllProducts;
  final IGetCartItems _usecaseGetCartItems;
  _HomeControllerBase(this._usecaseListAllProducts, this._usecaseGetCartItems);

  @observable
  List<Product> latestProducts = [];

  @observable
  int countCartItems = 0;

  @action
  getProducts() async{
    latestProducts = await _usecaseListAllProducts();
  }

  @action
  getCountCartItems() async{
    List<Cart> cartItems = await _usecaseGetCartItems();
    countCartItems = cartItems.length;
  }
}
