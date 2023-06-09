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

class Customer {
  String id;
  String name;
  int numberOfNotification;

  Customer(this.id, this.name, this.numberOfNotification);
}

class Contacts {
  String phone;
  String email;
  String link;
  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}
