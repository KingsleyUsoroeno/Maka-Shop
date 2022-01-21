import 'package:get_it/get_it.dart';
import 'package:maka_shop/core/util/api_helper.dart';
import 'package:maka_shop/features/inventory/di/inventory_module.dart'
    as inventory_module;
import 'package:maka_shop/features/live_show/di/live_show_module.dart'
    as live_show_module;

final injector = GetIt.instance;

Future<void> init() async {
  inventory_module.init(injector);
  live_show_module.init(injector);
  injector.registerLazySingleton(() => ApiBaseHelper());
}
