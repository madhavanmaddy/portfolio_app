import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethods {
  getdata() async{
    return await Firestore.instance.collection('projects').getDocuments();
  }
  
}