import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [

    ];

  @override
  List<ModularRouter> get routers => [
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}