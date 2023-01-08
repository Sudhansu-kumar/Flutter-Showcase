import 'dart:html';

import 'package:app/screens/surgen_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IndiDoctor extends StatefulWidget {
  const IndiDoctor({super.key});

  @override
  State<IndiDoctor> createState() => _IndiDoctorState();
}

class _IndiDoctorState extends State<IndiDoctor> {
  @override
  
  final data = FirebaseFirestore.instance.collection("Physician").snapshots();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      ),
          
    );
  }
}