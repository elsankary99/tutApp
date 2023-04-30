import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutapp/presentation/resources/assets_manager.dart';
import 'package:tutapp/presentation/resources/color_manager.dart';
import 'package:tutapp/presentation/resources/string_manager.dart';
import 'package:tutapp/presentation/resources/value_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  PageController _pageController = PageController();
  int _currentIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(
              sliderObject: _list[_currentIndex],
            );
          },
        ));
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.sliderObject});
  final SliderObject sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.tittle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTittle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
      ],
    );
  }
}

class SliderObject {
  final String tittle, subTittle, image;

  SliderObject(this.tittle, this.subTittle, this.image);
}
