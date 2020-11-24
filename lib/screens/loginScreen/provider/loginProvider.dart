import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_wala_final_pka/models/UserModel.dart';
import 'package:final_wala_final_pka/screens/DrawerScreen/drawerScreen.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/home%20type2.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/homeScreen.dart';
import 'package:final_wala_final_pka/screens/loginScreen/localWidgets/otpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class LoginProvider extends ChangeNotifier {

  UserModel _user = UserModel();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String phoneNo, smsSent, _verificationId;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Color customColor = Color(0xFFF2BC57);
  bool disableButton = true;
  String _inputText;
  //globalKey;
  //GlobalKey<MyAppState> globalKey = GlobalKey<MyAppState>();
  validator(String input) {
    _inputText = "+91" + input;
    print(_inputText);
    if (input.length < 10) {
      if (customColor == Colors.red) {
        print("Do nothing");
      }
      else {
        print("notifying the listeneers");
        customColor = Colors.red;
        notifyListeners();
      }
      //return "Invalid Phone number";
    }
    else {
      disableButton = false;
      customColor = Color(0xFFF2BC57);
      notifyListeners();
    }
  }

  Future<void> login(FormState formState, context) async {
    disableButton = true;
    print("this function is being called");

    // PhoneVerificationCompleted verificationCompleted = (
    //     PhoneAuthCredential phoneAuthCredential) async {
    //   print("Step 1");
    //   //await _auth.signInWithCredential(phoneAuthCredential);
    // };
    final PhoneVerificationCompleted verifiedSuccess = (
        PhoneAuthCredential phoneAuthCredential) {
      print("the verification is successfull");
      //Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false)

    };


    PhoneVerificationFailed verificationFailed = (
        FirebaseAuthException authException) {
        disableButton = false;
        print(authException);
    };

    PhoneCodeSent codeSent = (String verificationId,
        [int forceCodeResent]) async {
      print("the code has been sent to your mobile");
      _verificationId = verificationId;

      // Here we have to navigate the user to the otp entering page
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OtpScreen(),
      ));
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (
        String verificationId) {
      _verificationId = verificationId;
    };

    try {
      print("Inside the try ");
      print(_inputText);
      await _auth.verifyPhoneNumber(
        phoneNumber: _inputText,
        timeout: const Duration(seconds: 120),
        verificationCompleted: verifiedSuccess,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      print(e);
    }
  }

  verifyOtp(String input, context) async{
    print(input);
    final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: input);
    try{
      await _auth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) =>HomeScreenAttempt2(),
      ), (route)=> false);
    } catch(e){
      print(e);
      print("Something went wrong");
      //prin
    }
  }
  
  Future<String> createUser() async{
    String retVal = "error";
    
    try{
      await _firestore.collection("user").doc(_user.uid).set({
        'firstname' : _user.name,
        'lastLogin' : Timestamp.now(),
        'wishlist' : [],
        'phoneNumber' : _user.phoneNo,
      });
    } catch(e) {
      print(e);
    }
  }

}