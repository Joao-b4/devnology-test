import 'package:devnology/core/domain/entities/cart.dart';
import 'package:devnology/core/domain/repositories/cart_repository_interface.dart';
import 'package:devnology/core/infra/adapters/local_storage_adapter_interface.dart';
import 'package:devnology/core/infra/repositories/models/cart_hive_type.dart';

class CartRepositoryHive implements ICartRepository{
  final ILocalStorageAdapter localStorage;
  CartRepositoryHive(this.localStorage);

  final _collectionName = "cart";

  @override
  Future<Cart?> get(String id) async{
    CartModel? cartModel = await localStorage.get(_collectionName, id);
    if(cartModel != null){
      return CartModel.fromModelToEntity(cartModel);
    }
  }

  @override
  Future<List<Cart>> getAllItems() async{
    List<CartModel> cartModels = List<CartModel>.from((await localStorage.getAll(_collectionName)).toList());
    return CartModel.fromModelCollectionToEntities(cartModels);
  }

  @override
  Future<void> saveItem(Cart cart) async{
    CartModel cartModel = CartModel.fromEntityToModel(cart);
    await localStorage.put(_collectionName, cart.product.id, cartModel);
  }

  @override
  Future<void> updateItem(Cart cart) async{
    CartModel cartModel = CartModel.fromEntityToModel(cart);
    await localStorage.put(_collectionName, cart.product.id, cartModel);
  }

  @override
  Future<void> deleteItem(String id) async{
    await localStorage.delete(_collectionName, id);
  }
}