import 'package:tutapp/data/network/app_api.dart';
import 'package:tutapp/data/network/requests.dart';
import 'package:tutapp/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequests loginRequests);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<AuthenticationResponse> register(RegisterRequests registerRequests);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequests loginRequests) async {
    return await _appServiceClient.login(
        loginRequests.email, loginRequests.password);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequests registerRequests) async {
    return await _appServiceClient.register(
      registerRequests.userName,
      registerRequests.countryMobileCode,
      registerRequests.mobileNumber,
      registerRequests.email,
      registerRequests.password,
      registerRequests.profilePicture,
    );
  }
}
