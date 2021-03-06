import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  _SplashControllerBase();

  @action
  void load() {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Modular.to.navigate('/'),
    );
  }
}
