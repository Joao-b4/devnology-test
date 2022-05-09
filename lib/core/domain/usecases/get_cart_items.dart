import 'package:devnology/core/domain/entities/cart.dart';
import 'package:devnology/core/domain/repositories/cart_repository_interface.dart';

abstract class IGetCartItems{
  Future<List<Cart>> call();
}

class GetCartItems implements IGetCartItems{
  final ICartRepository repository;
  GetCartItems(this.repository);

  @override
  Future<List<Cart>> call() {
    return repository.getAllItems();
  }

}