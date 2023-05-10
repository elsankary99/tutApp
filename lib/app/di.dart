import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutapp/app/app_prefs.dart';
import 'package:tutapp/data/data_source/remote_data_source.dart';
import 'package:tutapp/data/network/app_api.dart';
import 'package:tutapp/data/network/dio_factory.dart';
import 'package:tutapp/data/network/network_info.dart';
import 'package:tutapp/data/repository/repository_impl.dart';
import 'package:tutapp/domain/repository/repository.dart';
import 'package:tutapp/domain/usecase/login_use_case.dart';
import 'package:tutapp/presentation/login/view_model/login_view_model.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetWorkInfo>(
      () => NetWorkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // repository

  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
