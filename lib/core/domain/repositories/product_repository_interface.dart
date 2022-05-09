import 'package:devnology/core/domain/entities/product.dart';

abstract class IProductRepository{
  Future<List<Product>> getAll();
  Future<Product> get(String id);
}