class ProductModel {
  String? img;
  bool addtocart;
  ProductModel({required this.img,required this.addtocart});
  static List<ProductModel> imagelist() {
    return [
      ProductModel(img: "assets/Group 5318.png",addtocart: true),
      ProductModel(img: "assets/dracaena.jpeg",addtocart: true),
      ProductModel(img: "assets/zamia green.jpeg",addtocart: false)
    ];
  }
}
