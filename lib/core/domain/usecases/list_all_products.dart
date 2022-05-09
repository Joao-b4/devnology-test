import 'package:devnology/core/domain/entities/product.dart';
import 'package:devnology/core/domain/repositories/product_repository_interface.dart';

abstract class IListAllProducts{
  Future<List<Product>> call();
}

class ListAllProducts implements IListAllProducts{
  final IProductRepository repository;
  ListAllProducts(this.repository);

  @override
  Future<List<Product>> call() {
    return repository.getAll();
  }

}