import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:son_hali/login_screen.dart';



class faturaGirisiYapp extends StatefulWidget {
  const faturaGirisiYapp({Key? key}) : super(key: key);

  @override
  State<faturaGirisiYapp> createState() => _faturaGirisiYappState();
}

class _faturaGirisiYappState extends State<faturaGirisiYapp> {

  var faturaTest= FirebaseDatabase.instance.ref().child("fatura_tablo");

  void initState(){
    super.initState();
    var bilgi= HashMap <String,dynamic>();
    bilgi["mesaj"]="merhaba";
    faturaTest.push().set(bilgi);

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

