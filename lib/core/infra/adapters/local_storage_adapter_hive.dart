import 'package:devnology/core/infra/adapters/local_storage_adapter_interface.dart';
import 'package:devnology/core/infra/repositories/models/cart_hive_type.dart';
import 'package:devnology/core/infra/repositories/models/product_hive_type.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHiveAdapter extends ILocalStorageAdapter{
  static final LocalStorageHiveAdapter _instance = LocalStorageHiveAdapter.internal();
  factory LocalStorageHiveAdapter() => _instance;
  LocalStorageHiveAdapter.internal();

  @override
  Future<void> connect() async{
    await Hive.initFlutter();
    Hive
    ..registerAdapter(ProductModelAdapter())
        ..registerAdapter(CartModelAdapter());
  }

  Future _getBox(String collectionName) async{
    if(Hive.isBoxOpen(collectionName)){
      return Hive.box(collectionName);
    }else{
      return Hive.openBox(collectionName);
    }
  }

  @override
  get(String collectionName, String key)async{
    Box box = await this._getBox(collectionName);
    return box.get(key);
  }

  @override
  getAll(String collectionName)async{
    Box box = await this._getBox(collectionName);
    return box.values;
  }

  @override
  put(String collectionName, String key, dynamic value) async {
    Box box = await this._getBox(collectionName);
    return box.put(key, value);
  }

  @override
  delete(String collectionName, String key) async{
    Box box = await this._getBox(collectionName);
    return box.delete(key);
  }
}

