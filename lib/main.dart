import 'package:devnology/add_dev_products.dart';
import 'package:devnology/core/infra/adapters/local_storage_adapter_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  LocalStorageHiveAdapter().connect().then((value) {
    addDevProducts();
    runApp(
        ModularApp(
          module: AppModule(),
          child: AppWidget(),
        )
    );
  } );
}


