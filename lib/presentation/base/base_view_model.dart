abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {}

abstract class BaseViewModelInputs {
  void start();
  void disPose();
}

abstract class BaseViewModelOutputs {}
