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
          'Surgen\'s', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          ),
        ),

        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Surgen').snapshots(),
          builder: (context , snapshot) {

            if(snapshot.connectionState == ConnectionState.active)
            {
              if(snapshot.hasData && snapshot.data != null)
              {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context , index){

                    Map<dynamic , dynamic> dentists = snapshot.data!.docs[index].data as Map<dynamic , dynamic>;

                    return ListTile(
                     title: Text(dentists["name"]),
                    );
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