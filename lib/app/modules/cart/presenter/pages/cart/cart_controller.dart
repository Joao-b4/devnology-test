import 'package:devnology/core/domain/entities/cart.dart';
import 'package:devnology/core/domain/usecases/add_quantity_cart_item.dart';
import 'package:devnology/core/domain/usecases/get_cart_items.dart';
import 'package:devnology/core/domain/usecases/remove_quantity_cart_item.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'cart_controller.g.dart';

@Injectable()
class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final IGetCartItems _usecaseGetCartItems;
  final IAddQuantityCartItem _usecaseAddQuantityCartItem;
  final IRemoveQuantityCartItem _usecaseRemoveQuantityCartItem;
  _CartControllerBase(this._usecaseGetCartItems, this._usecaseAddQuantityCartItem, this._usecaseRemoveQuantityCartItem);

  @observable
  List<Cart> cartItems = [];

  @observable
  int countCartItems = 0;

  @observable
  double totalPrice = 0;

  @action
  getCartItems() async{
    cartItems = await _usecaseGetCartItems();
    countCartItems = cartItems.length;
    totalPrice = cartItems.fold(0, (previousValue, element) => previousValue + element.product.price);
  }

  @action
  addQuantityProduct(Cart cart) async{
    await _usecaseAddQuantityCartItem(cart, 1);
    getCartItems();
  }


  @action
  removeQuantityProduct(Cart cart) async{
    await _usecaseRemoveQuantityCartItem(cart, 1);
    getCartItems();
  }

}
