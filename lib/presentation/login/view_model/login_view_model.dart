import 'dart:async';

import 'package:tutapp/presentation/base/base_view_model.dart';
import 'package:tutapp/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllinputsValidStreamController =
      StreamController<void>.broadcast();
  var loginObject = LoginObject("", "");
  // final LoginUseCase _loginUseCase;

  // LoginViewModel(this._loginUseCase);
  LoginViewModel();

  // inputs
  @override
  void disPose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllinputsValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;
  @override
  Sink get inputAreOutputsValid => _areAllinputsValidStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreOutputsValid.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputAreOutputsValid.add(null);
  }

  @override
  login() async {
    // (await _loginUseCase.execute(
    //         LoginUseCaseInput(loginObject.userName, loginObject.password)))
    //     .fold(
    //         (failure) => {
    //               // left -> failure
    //               print(failure.message)
    //             },
    //         (data) => {
    //               // right -> data (success)
    //               print(data.customer?.name)
    //             });
  }

  // outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));
  @override
  Stream<bool> get outAreOutputsValid =>
      _areAllinputsValidStreamController.stream.map((_) => _areAlliputsValid());

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _areAlliputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }
}

abstract class LoginViewModelInputs {
  setUserName(String userName);

  setPassword(String password);

  login();

  Sink get inputUserName;

  Sink get inputPassword;
  Sink get inputAreOutputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;

  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreOutputsValid;
}
