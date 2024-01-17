import 'package:flutter/cupertino.dart';
import 'package:invoice_app/screen/bills/bills_screen.dart';
import 'package:invoice_app/screen/home/home_screen.dart';
import 'package:invoice_app/screen/resume/resume_screen.dart';
import 'package:invoice_app/screen/splash/login_screen.dart';

import '../screen/splash/splash_screen.dart';

Map<String,WidgetBuilder>app_routs={
  '/':(context) => SplashScreen(),
  'login':(context) => LoginScreen(),
  'home':(context) => Homescreen(),
  'bills':(context) => BillScreen(),
  'resume':(context) => ResumeScreen(),
};