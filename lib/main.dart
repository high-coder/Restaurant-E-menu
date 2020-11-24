import 'file:///C:/Users/Highcoder/AndroidStudioProjects/final_app/lib/screens/loginScreen/login_Screen.dart';
import 'package:final_wala_final_pka/provider/surveyProvider.dart';
import 'package:final_wala_final_pka/screens/cartScreen/cart.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/home%20type2.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/localWidgets/topAnimationContainer.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/FeatureProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/addToCartProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/drawerOpenCloseProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/mainScreenProvider.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/rebuildAddToCart.dart';
import 'package:final_wala_final_pka/screens/homeScreen/home.dart';
import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/like_animation_buttin.dart';
import 'package:final_wala_final_pka/screens/loginScreen/provider/loginProvider.dart';
import 'package:final_wala_final_pka/utils/outTheme.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

//import 'abhi_files/update_my_file.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp();
  runApp(MyApp());
}
//void main() =>runApp(MyApp());
class MyApp extends StatelessWidget {

  //final GlobalKey<Ma> materailAppGlobalKey = GlobalKey<MaterialApp>();
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainScreenProvider>(
          create: (context) =>MainScreenProvider(),
        ),
        ChangeNotifierProvider<FeatureProvider>(
          create: (context) => FeatureProvider(),
        ),
        ChangeNotifierProvider<AddToCartProvider>(
          create: (context) => AddToCartProvider(),
        ),
        ChangeNotifierProvider<RebuildAddToCart>(
          create: (context) => RebuildAddToCart(),
        ),
        ChangeNotifierProvider<SurverProvider>(
          create: (context) =>SurverProvider(),
        ),
        ChangeNotifierProvider<DrawerOpenCloseProvider>(
          create: (context) => DrawerOpenCloseProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context)=> LoginProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Appetizer",   // name of the app to be shown in recent apps
        theme: OurTheme().buildTheme(),
        home: HomeScreenAttempt2(),
      ),
    );
  }
}
