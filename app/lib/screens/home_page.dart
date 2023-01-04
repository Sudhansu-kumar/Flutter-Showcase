
import 'package:app/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => LoginPage(),
      ));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              logOut();
            }, 
            icon: const Icon(Icons.exit_to_app))
        ],
        elevation: 10,
        title: const Text('Doctors Wala'),
        backgroundColor: Colors.blue[2000],
      ),

      body: ListView(
        children:[ Column(
          children: [
      
            //book doctors 
      
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/home/book-appointment');
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0 , top: 20),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage('assets/images/doctorimage.png'),
                    fit: BoxFit.cover,
                     ),
                    // color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(20),
                    
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade600,
                        offset: const Offset(10, 10),
                        blurRadius: 10,
                      ),
                  
                      BoxShadow(
                        color: Colors.blue.shade200,
                        offset: const Offset(-10, -10),
                        blurRadius: 10,
                      )
                    ]
                  ),
                
                  
                  ),
                ),
            ),
                        
                       const SizedBox(height: 5,),
             const Text('Book An Appointment',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 16,
               color: Colors.black54,
             ),
             ),
      
              //book ambulance
      
              const SizedBox(height: 30,),
      
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/home/book-ambulance');
                },
                child: Padding(
                padding: const EdgeInsets.only(left: 0.0 , top: 20),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage('assets/images/ambulance.png'),
                     fit: BoxFit.cover,
                     ),
                    // color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(20),
                    
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade600,
                        offset: const Offset(10, 10),
                        blurRadius: 10,
                      ),
                    
                      BoxShadow(
                        color: Colors.blue.shade200,
                        offset: const Offset(-10, -10),
                        blurRadius: 10,
                      )
                    ]
                  ),
                
                  
                  ),
                ),
              ),
                        
                       const SizedBox(height: 5,),
             const Text('Book Ambulance',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 16,
               color: Colors.black54,
             )
             ),

                            //online consultancy

             const SizedBox(height: 30,),
      
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context , '/home/consult-doctor');
                },
                child: Padding(
                padding: const EdgeInsets.only(left: 0.0 , top: 20),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage('assets/images/onlinedoctor.png'),
                     fit: BoxFit.cover,
                     ),
                    // color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(20),
                    
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade600,
                        offset: const Offset(10, 10),
                        blurRadius: 10,
                      ),
                    
                      BoxShadow(
                        color: Colors.blue.shade200,
                        offset: const Offset(-10, -10),
                        blurRadius: 10,
                      )
                    ]
                  ),
                
                  
                  ),
                ),
              ),
                        
                       const SizedBox(height: 5,),
             const Padding(
               padding:  EdgeInsets.only(bottom:50.0),
               child:  Text('Consult A Doctor',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 16,
                 color: Colors.black54,
               )
               ),
             ),

             //order medicine

            //  const SizedBox(height: 30,),
      
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/home/order-medicine');
                },
                child: Padding(
                padding: const EdgeInsets.only(left: 0.0 , top: 10),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage('assets/images/medicine.png'),
                     fit: BoxFit.cover,
                     ),
                    // color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(20),
                    
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade600,
                        offset: const Offset(10, 10),
                        blurRadius: 10,
                      ),
                    
                      BoxShadow(
                        color: Colors.blue.shade200,
                        offset: const Offset(-10, -10),
                        blurRadius: 10,
                      )
                    ]
                  ),
                
                  
                  ),
                ),
              ),
                        
                        const SizedBox(height: 5,),
             const Padding(
               padding:  EdgeInsets.only(bottom:50.0),
               child:  Text('Order Medicine',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 16,
                 color: Colors.black54,
               )
               ),
             ),
          ],
        ),
        ]
      ),
      );
    // );
  }
}