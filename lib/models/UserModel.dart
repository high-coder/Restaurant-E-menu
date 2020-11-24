import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String name;
  //String Date
  Timestamp lastLoginTimestamp;
  String phoneNo;
  String uid;

  UserModel({this.name,this.lastLoginTimestamp,this.phoneNo,this.uid});
}