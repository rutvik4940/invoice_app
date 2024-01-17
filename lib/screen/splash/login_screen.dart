import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  GlobalKey<FormState>key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: key,
      child: Scaffold(
                  body: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Sign in",style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),
                                      SizedBox(height: 20,),
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
                                        controller: txtName,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "NeilArm30gmail.com",
                                          )
                                      ),
                                      SizedBox(height: 10,),
                                      TextFormField(
                                          validator: (value) {
                                            if(value!.isEmpty)
                                            {
                                              return "password No is required";
                                            }
                                            else if (value!.length!=10)
                                            {
                                              return "Enter the valid password";
                                            }
                                            return null;
                                          },
                                        controller: txtEmail,
                                          decoration: const InputDecoration(
                                            fillColor: CupertinoColors.activeBlue,
                                            border: OutlineInputBorder(),
                                            hintText: "Password",
                                          )
                                      ),
                                      SizedBox(height: 10,),
                                      Text("Forgot Password?",style: TextStyle(color: Colors.blue),),
                                      SizedBox(height: 30,),
                                        Center(
                                            child: ElevatedButton(onPressed: () {
                                              FocusScope.of(context).unfocus();
                                              if(key.currentState!.validate())
                                              {
                                                String name = txtName.text;
                                                String email = txtEmail.text;

                                                dataList.add(name);
                                                dataList.add(email);
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data is saved")));
                                            setState(() {
                                              Navigator.pushNamed(context, 'home');
                                            });
                                              }
                                              txtName.clear();
                                              txtEmail.clear();

                                            }, child: Text("Submit")
                                            ),
                                          ),

                                    ]
                            ),
                      ),
                    ),
                  ),
                         ),
    );
  }
}
