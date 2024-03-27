import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class delete_data_fs extends StatefulWidget {
  const delete_data_fs({super.key});

  @override
  State<delete_data_fs> createState() => _delete_data_fsState();
}

class _delete_data_fsState extends State<delete_data_fs> {


  //FireStore reference from where we fetch our data
  //Basically snapshot represent those area of Database from where data will be fetched

  final firestore_ref = FirebaseFirestore.instance.collection('data').snapshots();

  //Firestore collection reference

  final coll_ref = FirebaseFirestore.instance.collection('data');


  //Update controller

  TextEditingController _update = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Delete Data Operation",
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
                    trailing: InkWell(
                        onTap: (){
                         coll_ref.doc(snapshot.data!.docs[index]["Id"].toString()).delete().then((value) =>
                         {print("Deleted")}).onError((error, stackTrace) => {
                           print("not deleted")
                         });
                        },
                        child: Icon(Icons.delete)),
                  );
                });
          })
      ),
    );
  }
}
