import 'dart:async';
import 'dart:io';

import 'package:tutapp/app/functions.dart';
import 'package:tutapp/domain/usecase/register_use_case.dart';
import 'package:tutapp/presentation/base/base_view_model.dart';
import 'package:tutapp/presentation/common/freezed_data_classes.dart';
import 'package:tutapp/presentation/resources/string_manager.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutput {
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController mobileNumberStreamController =
      StreamController<String>.broadcast();
  StreamController emailStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();
  StreamController profilePictureStreamController =
      StreamController<File>.broadcast();
  StreamController areAllInputsValidStreamController =
      StreamController<String>.broadcast();

  final RegisterUseCase _registerUseCase;
  var registerObject = RegisterObject("", "", "", "", "", "");
  RegisterViewModel(this._registerUseCase);

//? inputs
  @override
  void start() {
    // TODO: implement start
  }
  @override
  void disPose() {
    userNameStreamController.close();
    mobileNumberStreamController.close();
    emailStreamController.close();
    passwordStreamController.close();
    profilePictureStreamController.close();
    areAllInputsValidStreamController.close();

    super.disPose();
  }

  @override
  Sink get inputEmail => emailStreamController.sink;

  @override
  Sink get inputMobileNumber => mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => profilePictureStreamController.sink;

  @override
  Sink get inputUserName => userNameStreamController.sink;
  //*
  @override
  setUserName(String userName) {
    if (_isUserNAmeVAlid(userName)) {
      registerObject = registerObject.copyWith(userName: userName);
    } else {
      registerObject = registerObject.copyWith(userName: "");
    }
  }

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  setCountryCode(String countryCode) {
    if (countryCode.isNotEmpty) {
      registerObject = registerObject.copyWith(countryMobileCode: countryCode);
    } else {
      registerObject = registerObject.copyWith(countryMobileCode: "");
    }
  }

  @override
  setEmail(String email) {
    if (isEmailValid(email)) {
      registerObject = registerObject.copyWith(email: email);
    } else {
      registerObject = registerObject.copyWith(email: "");
    }
  }

  @override
  setMobileNumber(String mobileNumber) {
    if (_isMobileNumberValid(mobileNumber)) {
      registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    } else {
      registerObject = registerObject.copyWith(mobileNumber: "");
    }
  }

  @override
  setPassword(String password) {
    if (_isPasswordValid(password)) {
      registerObject = registerObject.copyWith(password: password);
    } else {
      registerObject = registerObject.copyWith(password: "");
    }
  }

  @override
  setProfilePicture(File profilePicture) {
    if (profilePicture.path.isNotEmpty) {
      registerObject =
          registerObject.copyWith(profilePicture: profilePicture.path);
    } else {
      registerObject = registerObject.copyWith(profilePicture: "");
    }
  }

  //?outputs
  @override
  Stream<bool> get outputIsUserNAmeValid => userNameStreamController.stream.map(
        (userName) => _isUserNAmeVAlid(userName),
      );
  @override
  Stream<String?> get outputErrorUserName => outputIsUserNAmeValid
      .map((isUserName) => isUserName ? null : AppStrings.userNameInValid);
  ////!
  @override
  Stream<bool> get outputIsEmailValid =>
      emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<String?> get outputErrorEmail => outputIsEmailValid
      .map((isEmailValid) => isEmailValid ? null : AppStrings.emailValid);
//!/
  @override
  Stream<bool> get outputIsMobileNumberValid =>
      mobileNumberStreamController.stream
          .map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<String?> get outputErrorMobileNumber => outputIsMobileNumberValid.map(
        (isMobileNumber) =>
            isMobileNumber ? null : AppStrings.mobileNumberValid,
      );
  ////!
  @override
  Stream<bool> get outputIsPasswordValid => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword => outputIsPasswordValid.map(
      (isPasswordValid) => isPasswordValid ? null : AppStrings.passwordValid);
////!

  @override
  // TODO: implement outputIsProfilePictureValid
  Stream<File> get outputIsProfilePictureValid =>
      profilePictureStreamController.stream.map((file) => file);

//!privet function
  bool _isUserNAmeVAlid(String userName) {
    return userName.length >= 8;
  }

  bool _isMobileNumberValid(String mobileNumber) {
    return mobileNumber.length >= 10;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }
}

abstract class RegisterViewModelInput {
  Sink get inputUserName;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputProfilePicture;
  register();
  setUserName(String userName);
  setMobileNumber(String mobileNumber);
  setCountryCode(String countryCode);
  setEmail(String email);
  setPassword(String password);
  setProfilePicture(File profilePicture);
}

abstract class RegisterViewModelOutput {
  Stream<bool> get outputIsUserNAmeValid;
  Stream<String?> get outputErrorUserName;

  Stream<bool> get outputIsMobileNumberValid;
  Stream<String?> get outputErrorMobileNumber;

  Stream<bool> get outputIsEmailValid;
  Stream<String?> get outputErrorEmail;

  Stream<bool> get outputIsPasswordValid;
  Stream<String?> get outputErrorPassword;

  Stream<File> get outputIsProfilePictureValid;
}
