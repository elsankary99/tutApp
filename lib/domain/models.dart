class SliderObject {
  final String tittle, subTittle, image;

  SliderObject(this.tittle, this.subTittle, this.image);
}

class SliderViewObject {
  List<SliderObject> sliderObject;
  int numberOfSliders;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numberOfSliders, this.currentIndex);
}
