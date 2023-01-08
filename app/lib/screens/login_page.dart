import 'dart:developer';
import 'dart:ffi';

import 'package:app/screens/otp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool _isElevated = true;
  TextEditingController phoneController = TextEditingController();

  //otp sending function
  void sendOTP() async{
    String phone= "+91${phoneController.text.trim()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, forceResendingToken) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) =>  OTP(verificationId: verificationId,),
          ));
      },
      verificationCompleted: (credential) {},
      verificationFailed: (ex) {
        log(ex.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: const Duration(seconds: 60),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
          
              //logo making
          
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(150),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade600,
                          offset: const Offset(10, 10),
                          blurRadius: 15,
                        ),
            
                        BoxShadow(
                          color: Colors.blue.shade100,
                          offset: const Offset(-10, -10),
                          blurRadius: 20,
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Image.asset('assets/images/ddlogo.png',
                    color: Colors.grey[800],
                      
                      ),
                    ),
                  ),
                ),
              ),
          
              //phone number textfield
          
              const SizedBox(height: 80,),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(20),
          
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade600,
                        offset: const Offset(5, 5),
                        blurRadius: 10,
                      ),
          
                      BoxShadow(
                        color: Colors.blue.shade100,
                        offset: const Offset(-5, -5),
                        blurRadius: 10,
                      )
                    ]
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child:  TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                         labelText: 'Phone number', 
                        
                        
                      ),
                    ),
                  ),
                ),
              ),
          
              const SizedBox(height: 100,),
          
              //login button
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MaterialButton(
                  onPressed: (){
                    sendOTP();
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => OTP()
                    // ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50 , vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: _isElevated ? [ 
                        BoxShadow(
                          color: Colors.blue.shade600,
                          offset: const Offset(10,10),
                          blurRadius: 10,
                        ),
                
                        BoxShadow(
                          color:Colors.blue.shade600,
                          offset: const Offset(-10,-10),
                          blurRadius: 10, 
                        ),
                      ]:null
                    ),
                    child: const Text('Login with Code',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                    ),
                    ),
                          
                  ),
                ),
              ),
          
               
            ],
          ),
        ),
      ),
    
     
    );
  }
}