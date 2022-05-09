import 'package:devnology/core/domain/entities/product.dart';
import 'package:devnology/core/domain/repositories/product_repository_interface.dart';
import 'package:devnology/core/infra/adapters/local_storage_adapter_interface.dart';
import 'package:devnology/core/infra/repositories/models/product_hive_type.dart';

class ProductRepositoryHive implements IProductRepository{
  final ILocalStorageAdapter localStorage;
  ProductRepositoryHive(this.localStorage);

  final collectionName = "products";

  @override
  Future<List<Product>> getAll() async{
    List<ProductModel> productModels = List<ProductModel>.from((await localStorage.getAll(collectionName)).toList());
    return ProductModel.fromModelCollectionToEntities(productModels);
  }

  @override
  Future<Product> get(String id) async{
    ProductModel productModel = await localStorage.get(collectionName, id);
    return ProductModel.fromModelToEntity(productModel);
  }
}