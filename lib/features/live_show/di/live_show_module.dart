import 'package:get_it/get_it.dart';
import 'package:maka_shop/features/live_show/data/remote/live_show_api_service.dart';
import 'package:maka_shop/features/live_show/data/repository/live_show_repository_impl.dart';
import 'package:maka_shop/features/live_show/domain/repository/live_show_repository.dart';
import 'package:maka_shop/features/live_show/presentation/bloc/live_show_bloc.dart';

Future<void> init(GetIt injector) async {
  injector.registerLazySingleton<LiveShowApiService>(
    () => LiveShowApiService(injector()),
  );

  injector.registerLazySingleton<LiveShowRepository>(
    () => LiveShowRepositoryImpl(injector()),
  );

  injector.registerFactory<LiveShowBloc>(
    () => LiveShowBloc(injector()),
  );
}
