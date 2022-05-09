import 'package:devnology/core/domain/entities/cart.dart';
import 'package:devnology/core/domain/entities/product.dart';
import 'package:devnology/core/domain/repositories/cart_repository_interface.dart';

abstract class IAddToCart{
  Future call(Product product);
}

class AddToCart implements IAddToCart{
  final ICartRepository repository;
  AddToCart(this.repository);

  @override
  Future call(Product product) async{
    Cart? existingCard = await repository.get(product.id);
    if(existingCard != null){
      Cart updatedCart = Cart(quantity: existingCard.quantity+1, product: product);
      return await repository.updateItem(updatedCart);
    }
    Cart newItem = Cart(quantity: 1, product: product);
    return await repository.saveItem(newItem);
  }

}