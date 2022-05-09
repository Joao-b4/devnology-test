
import 'package:devnology/core/domain/entities/cart.dart';
import 'package:devnology/core/domain/repositories/cart_repository_interface.dart';

abstract class IRemoveQuantityCartItem {
  Future call(Cart item, int quantityToRemove);
}

class RemoveQuantityCartItem implements IRemoveQuantityCartItem {
  final ICartRepository repository;
  RemoveQuantityCartItem(this.repository);

  @override
  Future call(Cart item, int quantityToRemove) async {
    if (item.quantity == 1) {
      return await repository.deleteItem(item.product.id);
    }
    Cart newUpdatedCart =
    Cart(quantity: item.quantity - quantityToRemove, product: item.product);
    await repository.updateItem(newUpdatedCart);
  }
}
