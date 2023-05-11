import 'dart:async';

import 'package:tutapp/presentation/common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  final StreamController _inputStreamController = StreamController<FlowState>();
  @override
  Sink get inputState => _inputStreamController.sink;
  @override
  Stream<FlowState> get outputState =>
      _inputStreamController.stream.map((flowState) => flowState);
  @override
  void disPose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start();
  void disPose();
  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
