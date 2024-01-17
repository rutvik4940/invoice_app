import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/global.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body:  Container(
          margin: const EdgeInsets.only(left: 10,top: 10),
          child: Column(
              children: List.generate(productList.length, (index) => InkWell(
                onTap: (){
                  Map m1=productList[index];
                  Navigator.pushNamed(context, 'bills',arguments: m1);

                },
                child: Container(
                  height: 120,
                  width: 400,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 5,
                          color: Colors.black12,
                        )
                      ]
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                          "${productList[index]['logo']}",
                          fit: BoxFit.contain,
                          height: 80,
                          width: 80
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${productList[index]['Brand Name']}",
                            style:  const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            "${productList[index]['Model Name']}",
                            style:  const TextStyle(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            "${productList[index]['price']}",
                            style:  const TextStyle(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                        ],
                      )
                  ),
              ),
                ),
              ),
              ),
       floatingActionButton:  FloatingActionButton(onPressed: () {
         Navigator.pushNamed(context, 'resume');
       },
         child: Icon(Icons.receipt_long_outlined)
       ),

          );
  }
}
