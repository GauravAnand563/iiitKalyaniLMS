import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms/models/books.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionHistory {
  late String issued;
  late List<FirebaseBooks> books;
  late String returned;
}

class CurrentlyIssued {
  late String dueDate;
  late List<FirebaseBooks> issuedBooks;
  late bool isApproved;
}

class LMSUser extends ChangeNotifier {
  late String name;
  late String phone;
  late String rollNo;
  late String email = FirebaseAuth.instance.currentUser!.email ?? '';
  late String address;
  late String docId = '';
  late String lastIssued = 'No Data';
  late bool isEligible = true;
  late double dueFine = 0.0;
  late double totalFinePaid = 0.0;
  late List<TransactionHistory> transactionHistory = [];
  late List<FirebaseBooks> wishlist = [];

  void updateUser(
      {required String name,
      required String phone,
      required String rollNo,
      required String address}) {
    this.name = name;
    this.phone = phone;
    this.address = address;
    this.rollNo = rollNo;
    notifyListeners();
  }

  void getUserFromFirebase(BuildContext context) {
    var lmsUser = Provider.of<LMSUser>(context, listen: false);
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');
    collectionReference
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) {
      var data = value.docs.first.data();
      'name': lmsUser.name,
      'phone': lmsUser.phone,
      'rollNo': lmsUser.rollNo,
      'email': lmsUser.email,
      'address': lmsUser.address,
      'lastIssued': lmsUser.lastIssued,
      'isEligible': lmsUser.isEligible,
      'dueFine': lmsUser.dueFine,
      'totalFinePaid': lmsUser.totalFinePaid,
      'transactionHistory': lmsUser.transactionHistory,
      'wishlist': lmsUser.wishlist
    });
  }

  static Future<bool> setUserToFirebase(
      BuildContext context, LMSUser lmsUser) async {
    bool returnvalue = false;
    Map<String, dynamic> map = {
      'name': lmsUser.name,
      'phone': lmsUser.phone,
      'rollNo': lmsUser.rollNo,
      'email': lmsUser.email,
      'address': lmsUser.address,
      'lastIssued': lmsUser.lastIssued,
      'isEligible': lmsUser.isEligible,
      'dueFine': lmsUser.dueFine,
      'totalFinePaid': lmsUser.totalFinePaid,
      'transactionHistory': lmsUser.transactionHistory,
      'wishlist': lmsUser.wishlist
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');
    var providedUser = Provider.of<LMSUser>(context, listen: false);
    if (providedUser.docId != '') {
      var docSnapshot = await collectionReference.doc(providedUser.docId).get();
      if (docSnapshot.exists) {
        docSnapshot.reference.update(map);
        return true;
      } else {
        docSnapshot.reference.set(map);
        return true;
      }
    } else {
      await collectionReference.add({}).then((DocumentReference reference) {
        providedUser.docId = reference.id;
        print('done uploading');
        returnvalue = true;
      }).catchError((err) {
        returnvalue = false;
      });
    }
    return returnvalue;
  }
}

// class Cart {
//   List<FirebaseBooks>
// }
