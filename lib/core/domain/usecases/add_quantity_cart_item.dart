import 'package:devnology/core/domain/entities/cart.dart';
import 'package:devnology/core/domain/repositories/cart_repository_interface.dart';

abstract class IAddQuantityCartItem{
  Future call(Cart item, int quantityToAdd);
}

class AddQuantityCartItem implements IAddQuantityCartItem{
  final ICartRepository repository;
  AddQuantityCartItem(this.repository);

  @override
  Future call(Cart item, int quantityToAdd) async{
    Cart newUpdatedCart = Cart(quantity: item.quantity+quantityToAdd, product: item.product);
    return await repository.updateItem(newUpdatedCart);
  }

}


