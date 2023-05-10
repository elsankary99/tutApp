import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tutapp/presentation/resources/string_manager.dart';

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
    return const Placeholder();
  }
}
