import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class PhysicianPage extends StatefulWidget {
  const PhysicianPage({super.key});

  @override
  State<PhysicianPage> createState() => _PhysicianPageState();
}

class _PhysicianPageState extends State<PhysicianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text(
          'Physician', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          ),
        ),

         
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Physician").snapshots(),
          builder: (context , snapshot) {

            if(snapshot.connectionState == ConnectionState.active)
            {
              if(snapshot.hasData && snapshot.data != null)
              {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context , index){

                    Map<String , dynamic> Physician = snapshot.data!.docs[index].data() as Map<String , dynamic>;

                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 50, right: 10),
                        tileColor: Colors.purple.shade50,
                        minLeadingWidth: 70,
                        onTap: (){},
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundImage: NetworkImage(Physician["pic"],),
                        ),
                        title: Text(Physician["name"],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        ),
                        subtitle: Text(Physician["specialization"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.cyan,
                        ),
                        ),
                        trailing: Text("₹ "+Physician["fees"]),
                      ),
                    );
                    Divider(height: 20,);
                  },
                );
              }else{
                return const Center(
                  child: Text('No Data Found',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
                );
              }

            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
    );
  }
}