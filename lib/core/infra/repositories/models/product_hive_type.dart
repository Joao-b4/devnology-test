import 'package:devnology/core/domain/entities/product.dart';
import 'package:hive/hive.dart';
part 'product_hive_type.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String url;

  @HiveField(3)
  String description;

  @HiveField(4)
  double price;

  @HiveField(5)
  List<String> images;

  ProductModel({required this.id,required this.name,required this.url,required this.description,required this.price,required this.images});

  static Product fromModelToEntity(ProductModel model) => Product(id: model.id, name: model.name, url: model.url, description: model.description, price: model.price, images: model.images);
  static List<Product> fromModelCollectionToEntities(List<ProductModel> models) => models.map((productModel) => ProductModel.fromModelToEntity(productModel)).toList();

  static ProductModel fromEntityToModel(Product product) => ProductModel(id: product.id, description: product.description, images: product.images,name: product.name, url: product.url, price: product.price);
}