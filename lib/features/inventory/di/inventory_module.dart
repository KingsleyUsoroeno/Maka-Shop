import 'package:get_it/get_it.dart';
import 'package:maka_shop/features/inventory/data/remote/inventory_api_service.dart';
import 'package:maka_shop/features/inventory/data/repository/inventory_repository_impl.dart';
import 'package:maka_shop/features/inventory/domain/repository/inventory_repository.dart';
import 'package:maka_shop/features/inventory/presentation/bloc/inventory_bloc.dart';

Future<void> init(GetIt injector) async {
  injector.registerLazySingleton<InventoryApiService>(
    () => InventoryApiService(injector()),
  );

  injector.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(injector()),
  );

  injector.registerFactory<InventoryBloc>(
    () => InventoryBloc(injector()),
  );
}
