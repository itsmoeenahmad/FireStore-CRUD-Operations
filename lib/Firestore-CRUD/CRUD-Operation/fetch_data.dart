import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class fetch_data extends StatefulWidget {
  const fetch_data({super.key});

  @override
  State<fetch_data> createState() => _fetch_dataState();
}

class _fetch_dataState extends State<fetch_data> {


  //FireStore reference

  final firestore_ref = FirebaseFirestore.instance.collection('data').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Fetch Data Operation",
          style: GoogleFonts.monda(fontWeight: FontWeight.w500, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: StreamBuilder(stream: firestore_ref, builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          else if(snapshot.hasError)
            {
              return const Center(child:
                Text("Error"),);
            }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
                return   ListTile(
                  title: Text("${snapshot.data!.docs[index]["Title"].toString()}"),
                );
          });
        })
      ),
    );
  }
}
