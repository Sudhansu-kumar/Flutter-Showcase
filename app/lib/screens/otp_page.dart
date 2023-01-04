import 'dart:developer';

import 'package:app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTP extends StatefulWidget {
  final String verificationId;
  const OTP({super.key, required this.verificationId});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController otpController = TextEditingController();

  void verifyOTP() async{
    String otp = otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId, smsCode: otp);

    try{
       UserCredential userCredential  =  await FirebaseAuth.instance.signInWithCredential(credential);
       if(userCredential.user != null)
       {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomePage(),
          ));
       }
    }on FirebaseAuthException catch(ex) {
      log(ex.code.toString());
    }
      
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('OTP Verification'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                 Padding(
              padding: const EdgeInsets.only(left: 05, top: 50),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/otp.png'),
              ),
            ),
            const SizedBox(height: 20,),
                  
                 Padding(
             padding: const EdgeInsets.only(left: 30, right: 30),
             // ignore: avoid_unnecessary_containers
             child: Container(
              child:  TextField(
                maxLength: 6,
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '6-digit OTP',
                  counterText: "",
                ),
              )
             ),
                 ),
                  
                 const SizedBox(height: 30,),
                  
            //Verification button

            ElevatedButton(
              onPressed: (){
                verifyOTP();
              }, 
              child: const Text('Verify Phone'),
              
              )
                  
            // Container(
            //   padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   color: Colors.blue..shade300,
            // ),  
            //   child: const Text('Verify Phone Number',
            //   style: TextStyle(
            //     fontSize: 16,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   ),
            // )
                 
              ],
            ),
          ),
        )

      


    );
  }
}