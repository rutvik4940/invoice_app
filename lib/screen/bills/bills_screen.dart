import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Map m1 = {};
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  GlobalKey<FormState>key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    m1 = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
        child: Form(
          key: key,
          child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Bills"),
      ),
            body:  SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only( top: 20),
                  width: MediaQuery.sizeOf(context).width*.80,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 1,
                          color: Colors.black26,
                        )
                      ]
                  ),
                  child:   Column(
                    mainAxisSize:MainAxisSize.min,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Name is required";
                          }
                          return null;
                        },
                        controller: txtName,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          label: Text("Customer Name"),
                          prefixIcon: Icon(Icons.account_circle_outlined),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Email is required ";
                          }
                          else if(!RegExp("^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$").hasMatch(value))
                          {
                            return "enter the valid email";
                          }
                          return null;
                        },
                        controller: txtEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            label: Text("Email"),
                            prefixIcon: Icon(Icons.email_outlined)
                        ),
                      ),

                      const SizedBox(height: 20,),
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Mobile No is required";
                          }
                          else if (value!.length!=10)
                          {
                            return "Enter the valid number";
                          }
                          return null;
                        },
                        controller: txtMobile,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            label: Text("Mobile"),
                            prefixIcon: Icon(Icons.phone_android_outlined)
                        ),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Address is required";
                          }
                          return null;
                        },
                        controller: txtAddress,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                          label: Text("Address"),
                          prefixIcon: Icon(Icons.location_on_outlined),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Column(
                        children: [
                          Text("Brand Name: ${m1['Brand Name']}",style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Text("Model Name: ${m1['Model Name']}",style: TextStyle(fontSize: 15)),
                          SizedBox(height: 10,),
                          Text("price: ${m1['price']}",style: TextStyle(fontSize: 15)),
                          SizedBox(height: 10,),
                          Text("Gst: ${m1['Gst']}",style: TextStyle(fontSize: 15)),
                          SizedBox(height: 10,),
                          Text("Total: ${m1['Total']}",style: TextStyle(fontSize: 15)),
                          SizedBox(height: 10,),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(onPressed: () {
                        FocusScope.of(context).unfocus();
                        if(key.currentState!.validate())
                        {
                          String name = txtName.text;
                          String email = txtEmail.text;
                          String mobile = txtMobile.text;
                          String address = txtAddress.text;

                          dataList[0]['name']=name;
                          dataList[0]['email']=email;
                          dataList[0]['mobile']=mobile;
                          dataList[0]['address']=address;

                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data is saved")));
                        }
                        txtName.clear();
                        txtEmail.clear();
                        txtMobile.clear();
                        txtAddress.clear();

                      }, child: const Text("Submit")
                      )
                    ],
                  ),

                  ),
                ),
            ),
            ),
        ),
    );
  }
}
