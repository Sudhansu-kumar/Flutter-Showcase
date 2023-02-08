

  import 'package:app/screens/indivvidual_doctors_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';

  class SurgenPage extends StatefulWidget {
    const SurgenPage({super.key});

    @override
    State<SurgenPage> createState() => _SurgenPageState();
  }

  class _SurgenPageState extends State<SurgenPage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: const Text(
            'Surgen', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ),
          ),

          
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("Surgen").snapshots(includeMetadataChanges: true),
            builder: (context , snapshot) {

              if(snapshot.connectionState == ConnectionState.active)
              {
                if(snapshot.hasData && snapshot.data != null)
                {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context , index){

                      Map<String , dynamic> Surgen = snapshot.data!.docs[index].data() as Map<String , dynamic>;

                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(left: 50, right: 10),
                          tileColor: Colors.purple.shade50,
                          minLeadingWidth: 70,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualPage(name: '')));
                          },
                          leading: CircleAvatar(
                            maxRadius: 30,
                            backgroundImage: NetworkImage(Surgen["pic"],),
                          ),
                          title: Text(Surgen["name"],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          ),
                          subtitle: Text(Surgen["specialization"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.cyan,
                          ),
                          ),
                          trailing: Text("₹ "+Surgen["fees"]),
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