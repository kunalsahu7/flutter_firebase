
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase/screens/Home/view/Home_Screen.dart';
import 'package:flutter_firebase/screens/InsertScreen/view/Insertscreen.dart';
import 'package:flutter_firebase/screens/Login_Screen/view/signinscreen.dart';
import 'package:flutter_firebase/screens/SplessScreen/Spless.dart';
import 'package:get/get.dart';

import 'screens/Login_Screen/view/signupscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => SplessScreen(),
        ),
        GetPage(
          name: '/SignIn',
          page: () => SignInScreen(),
        ),
        GetPage(
          name: '/SingUp',
          page: () => SingUp_Screen(),
        ),
        GetPage(
          name: '/Home',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/Insert',
          page: () => InsertScreen(),
        ),
      ],
    ),
  );
}