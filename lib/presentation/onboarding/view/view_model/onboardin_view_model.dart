import 'dart:async';

import 'package:tutapp/domain/models.dart';
import 'package:tutapp/presentation/base/base_view_model.dart';
import 'package:tutapp/presentation/resources/assets_manager.dart';
import 'package:tutapp/presentation/resources/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  int _currentIndex = 0;
  late final List<SliderObject> _list;

  //! onBoarding View model inPuts
  @override
  void disPose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataTOview();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;

    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;

    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataTOview();
  }

  @override
  // TODO: implement inPutSLiderViewObject
  Sink get inPutSLiderViewObject => _streamController.sink;
  //! onBoarding View model outPuts
  @override
  // TODO: implement outPutSLiderViewObject
  Stream<SliderViewObject> get outPutSLiderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

//* on boarding Privet function
  void _postDataTOview() {
    inPutSLiderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onBoardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onBoardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onBoardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onBoardingLogo4,
        ),
      ];
}

abstract class OnboardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);
  Sink get inPutSLiderViewObject;
}

abstract class OnboardingViewModelOutputs {
  Stream<SliderViewObject> get outPutSLiderViewObject;
}
