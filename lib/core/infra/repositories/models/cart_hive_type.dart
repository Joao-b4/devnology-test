import 'package:devnology/core/domain/entities/cart.dart';
import 'package:devnology/core/infra/repositories/models/product_hive_type.dart';
import 'package:hive/hive.dart';
part 'cart_hive_type.g.dart';

@HiveType(typeId: 1)
class CartModel extends HiveObject {

  @HiveField(0)
  ProductModel product;

  @HiveField(1)
  int quantity;

  CartModel({required this.product, required  this.quantity});

  static Cart fromModelToEntity(CartModel model) => Cart(product: ProductModel.fromModelToEntity(model.product), quantity: model.quantity );
  static List<Cart> fromModelCollectionToEntities(List<CartModel> models) => models.map((cartModel) => CartModel.fromModelToEntity(cartModel)).toList();

  static CartModel fromEntityToModel(Cart Cart) => CartModel(quantity: Cart.quantity, product: ProductModel.fromEntityToModel(Cart.product));
}