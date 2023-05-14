import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tutapp/presentation/resources/assets_manager.dart';
import 'package:tutapp/presentation/resources/color_manager.dart';
import 'package:tutapp/presentation/resources/font_manager.dart';
import 'package:tutapp/presentation/resources/string_manager.dart';
import 'package:tutapp/presentation/resources/styles_manager.dart';
import 'package:tutapp/presentation/resources/value_manager.dart';

enum StateRendererType {
  // !pop up state
  popupLoadingState,
  popupErrorState,
  popupSuccess,

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
  Function retryActionFunction;
  StateRenderer(
      {super.key,
      required this.stateRendererType,
      this.message = AppStrings.loading,
      this.title = "",
      required this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAsset.loading),
        ]);
      case StateRendererType.popupErrorState:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAsset.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok, context)
        ]);

      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAsset.loading),
          _getMessage(message),
        ]);

      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAsset.error),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgin, context)
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn([
          _getAnimatedImage(JsonAsset.empty),
          _getMessage(message),
        ]);
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopupDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
        height: AppSize.s100,
        width: AppSize.s100,
        child: Lottie.asset(animationName));
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularTextStyle(
              color: ColorManager.black, fontSize: FontSize.s18),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (stateRendererType == StateRendererType.fullScreenErrorState) {
                //*retry on full screen err
                retryActionFunction.call();
              } else {
                //* pop up err  (OK)

                Navigator.of(context).pop();
              }
            },
            child: Text(buttonTitle),
          ),
        ),
      ),
    );
  }
}
