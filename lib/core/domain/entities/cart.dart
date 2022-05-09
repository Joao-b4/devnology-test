import 'package:devnology/core/domain/entities/product.dart';

class Cart{
  final int quantity;
  final Product product;

  Cart({required this.product, required this.quantity});
}