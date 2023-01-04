import 'package:app/screens/book_ambulance_page.dart';
import 'package:app/screens/consult_doctor_page.dart';
import 'package:app/screens/doctor_appointment.dart';
import 'package:app/screens/order_medicine_page.dart';
// import 'package:app/screens/otp_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/home_page.dart';

import './screens/login_page.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        '/home':(context) =>const HomePage(),
        '/home/book-appointment':(context) =>const DoctorAppointment(),
        '/home/book-ambulance':(context) => const BookAmbulance(),
        '/home/consult-doctor':(context) =>  ConsultDoctor(),
        '/home/order-medicine':(context) => const OrderMedicine(),
        // '/login_page/otp_page':(context) =>   OTP(),
      },
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null) ? const HomePage() : const LoginPage(),
    );
  }
}