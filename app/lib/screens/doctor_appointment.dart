import 'package:app/screens/physician_page.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/surgen_page.dart';

class DoctorAppointment extends StatelessWidget {
  const DoctorAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        title: const Text('Book An Appointment'),
      ),
      body:

      //----------------------Search Bar-----------------------------------------------------------
      Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10 , right: 10),
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.shade600,
                    offset: const Offset(20, 20),
                    blurRadius: 20
                  ),
                  BoxShadow(
                    color: Colors.purple.shade100,
                    offset: const Offset(-5, -5),
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue[100],
              ),
              child: const TextField(
                
                decoration: InputDecoration(
                icon: Icon(Icons.search,
                color: Colors.purpleAccent,
                ),  
                  border: InputBorder.none,
                  hintText: 'Search your specialist here!',
                ),
              ),
            ),
          ),

          const SizedBox(height: 50,),

          //specialist card

          //Surgen card

           MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SurgenPage(), 
                ));
            },
             child: Container(
                height: 150,
                width: 150,
               decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage('assets/images/surgen.jpg'),
                fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.shade600,
                    offset: const Offset(20 , 20),
                    blurRadius: 20,
                  ),
           
                  BoxShadow(
                    color: Colors.purple.shade200,
                    offset: const Offset(-5, -5),
                    blurRadius: 20,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[100],
               ),
                     ),
           ),

          const SizedBox(height: 20,),

          const Text('Surgen',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
           
           //physician card

           const  SizedBox(height: 25,),

             MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => const PhysicianPage(), 
                ));
            },
             child: Container(
                height: 150,
                width: 150,
               decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage('assets/images/physician.jpg'),
                fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.shade600,
                    offset: const Offset(20 , 20),
                    blurRadius: 20,
                  ),
           
                  BoxShadow(
                    color: Colors.purple.shade200,
                    offset: const Offset(-5, -5),
                    blurRadius: 20,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[100],
               ),
                     ),
           ),

          const SizedBox(height: 20,),

          const Text('Physician (medicine)',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),

        ], //childern
      ),
    );
  }
}