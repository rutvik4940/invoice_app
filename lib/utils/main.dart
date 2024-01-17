import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/screen/home/home_screen.dart';

import 'package:invoice_app/screen/splash/login_screen.dart';
import 'package:invoice_app/screen/splash/splash_screen.dart';
import 'package:invoice_app/utils/routes.dart';

void main()
{
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:app_routs,
    ),
  );
}