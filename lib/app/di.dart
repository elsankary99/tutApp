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

final instance = GetIt.instance;
Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  //!SharedPreferences

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  //!AppPreferences

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  //!NetWorkInfo

  instance.registerLazySingleton<NetWorkInfo>(
      () => NetWorkInfoImpl(InternetConnectionChecker()));
  //!DioFactory

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  Dio dio = await instance<DioFactory>().getDio();
  //!AppServiceClient

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  //!RemoteDataSource

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));
  //!Repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}
