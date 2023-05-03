import 'package:dartz/dartz.dart';
import 'package:tutapp/data/data_source/remote_data_source.dart';
import 'package:tutapp/data/mappers/mapper.dart';
import 'package:tutapp/data/network/failure.dart';
import 'package:tutapp/data/network/network_info.dart';
import 'package:tutapp/data/network/requests.dart';
import 'package:tutapp/domain/model/models.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetWorkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequests loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(409, response.message ?? "business error message"));
      }
    } else {
      return Left(Failure(501, "please check your internet connection"));
    }
  }
}
