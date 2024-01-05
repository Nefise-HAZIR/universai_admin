class UserModel {
  final String? email;
  final String? name;
  final String? phone;

  final Map? selectedProductsMobil;
  final Map? selectedProductsWeb;
  final Map? selectedProductsCyber;
  final Map? selectedProductsMachine;
  final Map? selectedProductsData;
  final Map? selectedProductsCloud;

  UserModel(
      {
      required this.email,
      required this.name,
      required this.phone,
       this.selectedProductsMobil,
       this.selectedProductsWeb,
       this.selectedProductsCyber,
       this.selectedProductsMachine,
       this.selectedProductsData,
       this.selectedProductsCloud});
  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      selectedProductsMobil: map['selectedProductsMobil'],
      selectedProductsWeb: map['selectedProductsWeb'],
      selectedProductsCyber: map['selectedProductsCyber'],
      selectedProductsMachine: map['selectedProductsMachine'],
      selectedProductsData: map['selectedProductsData'],
      selectedProductsCloud: map['selectedProductsCloud'],
    );
  }

}
