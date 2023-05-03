import 'package:dartz/dartz.dart';
import 'package:tutapp/data/data_source/remote_data_source.dart';
import 'package:tutapp/data/mappers/mapper.dart';
import 'package:tutapp/data/network/error_handler.dart';
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
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
