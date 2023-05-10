import 'package:flutter/material.dart';
import 'package:tutapp/presentation/resources/color_manager.dart';
import 'package:tutapp/presentation/resources/font_manager.dart';
import 'package:tutapp/presentation/resources/string_manager.dart';
import 'package:tutapp/presentation/resources/styles_manager.dart';
import 'package:tutapp/presentation/resources/value_manager.dart';

enum StateRendererType {
  // !pop up state
  popupLoadingState,
  popupErrorState,

  // !full state
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
  // !general state
  contentState,
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function? retryActionFunction;
  StateRenderer(
      {super.key,
      required this.stateRendererType,
      this.message = AppStrings.loading,
      this.title = "",
      required this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _getStateWidget() {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        // TODO: Handle this case.
        break;
      case StateRendererType.popupErrorState:
        // TODO: Handle this case.
        break;
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          _getAnimatedImage(),
          _getMessage(message),
        ]);

      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgin)
        ]);
      case StateRendererType.fullScreenEmptyState:
        // TODO: Handle this case.
        break;
      case StateRendererType.contentState:
        // TODO: Handle this case.
        break;
    }
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage() {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Container(),
    );
  }

  Widget _getMessage(String message) {
    return Text(
      message,
      style: getRegularTextStyle(
          color: ColorManager.black, fontSize: FontSize.s18),
    );
  }

  Widget _getRetryButton(String buttonTitle) {
    return ElevatedButton(onPressed: () {}, child: Text(buttonTitle));
  }
}
