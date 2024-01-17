import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/global.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  String path="";
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 250,
              color: Colors.blue,
              child: Stack(
                alignment: Alignment.center,
                  children: [
                      CircleAvatar(radius: 60,backgroundColor: Colors.black26,
                          backgroundImage: FileImage(File(path))),
                      Align(
                        alignment: Alignment(0.3,0.3),

                          child: IconButton(
                              onPressed: ()async{
                                ImagePicker piker=ImagePicker();
                                XFile? xfile=await piker.pickImage(source: ImageSource.camera);
                                setState(() {
                                  path=xfile!.path;
                                });
                              },
                              icon: Icon(Icons.add_circle_outlined,color: Colors.white,))),
                    ],
              )
            ),
      Column(
       crossAxisAlignment: CrossAxisAlignment.start,

        children: [
        Text("Custmore information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
      Divider(indent: 2,endIndent: 2,thickness: 2,),
      Text("Name:${dataList[0]['name']}",style: const TextStyle(fontSize: 18),),
      const SizedBox(height: 10,),
      Text("mobile:${dataList[0]['mobile']}",style: const TextStyle(fontSize: 18),),
      const SizedBox(height: 10,),
      Text("email:${dataList[0]['email']}",style: const TextStyle(fontSize: 18),),
      const SizedBox(height: 10,),
      Text("address:${dataList[0]['address']}",style: const TextStyle(fontSize: 18),),
        ],
      )
        ]
          ),
    ),

    );
  }
}
