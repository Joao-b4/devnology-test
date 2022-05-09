import 'package:devnology/core/domain/entities/cart.dart';

abstract class ICartRepository{
  Future<Cart?> get(String id);
  Future<List<Cart>> getAllItems();
  Future<void> saveItem(Cart cart);
  Future<void> updateItem(Cart cart);
  Future<void> deleteItem(String id);
}