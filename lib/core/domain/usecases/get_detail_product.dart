import 'package:devnology/core/domain/entities/product.dart';
import 'package:devnology/core/domain/repositories/product_repository_interface.dart';

abstract class IGetDetailProduct{
  Future<Product> call(String id);
}

class GetDetailProduct implements IGetDetailProduct{
  final IProductRepository repository;
  GetDetailProduct(this.repository);

  @override
  Future<Product> call(String id) {
    return repository.get(id);
  }

}