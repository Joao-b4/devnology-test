import 'package:devnology/app/modules/splash/presenter/splash_controller.dart';
import 'package:devnology/app/modules/splash/presenter/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    $SplashController
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage(), transition: TransitionType.rightToLeftWithFade),
  ];
}