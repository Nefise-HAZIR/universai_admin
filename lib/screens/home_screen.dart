import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:universai_admin/model/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.snapshot});
  final AsyncSnapshot<QuerySnapshot> snapshot;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<dynamic> customerData;
  //UserModel? _userModel;

  @override
  void initState() {
    super.initState();
    customerData = widget.snapshot.data?.docs
            .map((DocumentSnapshot<dynamic> doc) =>
                doc.data() as Map<String, dynamic>)
            .toList() ??
        [];
    
    //_userModel = UserModel.fromMap(customerData.isNotEmpty?customerData.first:{});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: customerData.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> customer = customerData[index];
          return ListTile(
            title: Text('Name: ${customer['name']}'),  //_userModel kullandığımda sadece ilk baştakini sayıyor
            subtitle: Card(
              child: Column(children: [
                Text('Email: ${customer['email']}'),
                Text('Phone: ${customer['phone']}'),
                customer['selectedProductsMobil'] == null
                    ? Container()
                    : Text(
                        'Selected Products for mobil: ${customer['selectedProductsMobil']['selectedProducts']} \n Price: ${customer['selectedProductsMobil']['price']}'),
                customer['selectedProductsWeb'] == null
                    ? Container()
                    : Text(
                        'Selected Products for web: ${customer['selectedProductsWeb']['selectedProducts']} \n Price: ${customer['selectedProductsWeb']['price']}'),
                customer['selectedProductsCyber'] == null
                    ? Container()
                    : Text(
                        'Selected Products for Cyber: ${customer['selectedProductsCyber']['selectedProducts']} \n Price: ${customer['selectedProductsCyber']['price']}'),
                customer['selectedProductsMachine'] == null
                    ? Container()
                    : Text(
                        'Selected Products for MachineLearning: ${customer['selectedProductsMachine']['selectedProducts']} \n Price: ${customer['selectedProductsMachine']['price']}'),
                customer['selectedProductsData'] == null
                    ? Container()
                    : Text(
                        'Selected Products for BigData: ${customer['selectedProductsData']['selectedProducts']} \n Price: ${customer['selectedProductsData']['price']}'),
                customer['selectedProductsCloud'] == null
                    ? Container()
                    : Text(
                        'Selected Products for Cloud: ${customer['selectedProductsCloud']['selectedProducts']} \n Price: ${customer['selectedProductsCloud']['price']}'),
              ]),
            ),
          );
        },
      ),
    );
  }
}
