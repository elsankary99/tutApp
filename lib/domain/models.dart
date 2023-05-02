class SliderObject {
  final String tittle, subTittle, image;

  SliderObject(this.tittle, this.subTittle, this.image);
}

class SliderViewObject {
  List<SliderObject> sliderList;
  int numberOfSliders;
  int currentIndex;
  SliderViewObject(this.sliderList, this.numberOfSliders, this.currentIndex);
}
