import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethods {
  getdata() async{
    return await Firestore.instance.collection('projects').getDocuments();
  }
  getdatad() async {
    return await Firestore.instance.collection('designprojects').getDocuments();
  }
  getdatau() async {
    return await Firestore.instance.collection('uiuxprojects').getDocuments();
  }
  getdatadevs() async {
    return await Firestore.instance.collection('devs').getDocuments();
  }
  getprodevs() async {
    return await Firestore.instance.collection('prodevs').getDocuments();
  }
}