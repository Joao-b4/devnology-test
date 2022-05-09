import 'package:devnology/core/domain/entities/product.dart';
import 'package:devnology/core/domain/entities/cart.dart';
import 'package:devnology/core/domain/usecases/add_to_cart.dart';
import 'package:devnology/core/domain/usecases/get_cart_items.dart';
import 'package:devnology/core/domain/usecases/get_detail_product.dart';
import 'package:devnology/core/domain/usecases/list_all_products.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'product_detail_controller.g.dart';

@Injectable()
class ProductDetailController = _ProductDetailControllerBase with _$ProductDetailController;

abstract class _ProductDetailControllerBase with Store {
  final IGetDetailProduct _usecaseGetDetailProduct;
  final IGetCartItems _usecaseGetCartItems;
  final IAddToCart _usecaseAddToCart;
  _ProductDetailControllerBase(this._usecaseGetDetailProduct, this._usecaseGetCartItems, this._usecaseAddToCart );

  @observable
  Product? product;

  @observable
  int countCartItems = 0;

  @action
  getProduct(String id) async{
    product = await _usecaseGetDetailProduct(id);
  }

  @action
  getCountCartItems() async{
    List<Cart> cartItems = await _usecaseGetCartItems();
    countCartItems = cartItems.length;
  }

  @action
  addToCart() async{
    await _usecaseAddToCart(product as Product);
    await getCountCartItems();
    Modular.to.pushNamed("/cart");
  }

}
