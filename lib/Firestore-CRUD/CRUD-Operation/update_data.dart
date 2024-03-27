import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class update_data_fs extends StatefulWidget {
  const update_data_fs({super.key});

  @override
  State<update_data_fs> createState() => _update_data_fsState();
}

class _update_data_fsState extends State<update_data_fs> {


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
          "Update Data Operation",
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
                          showDialog(context: context, builder: (context){
                            return Dialog(
                              child: Container(
                                height: height*0.3,
                                width: width*0.7,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(14)
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Update Data",style: GoogleFonts.monda(
                                          color: Colors.white,
                                          fontSize: 20
                                      ),),
                                      TextFormField(
                                        controller: _update,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                            hintText: "Enter data",
                                            hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(color: Colors.white,)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                borderSide: BorderSide(color: Colors.white,)
                                            )
                                        ),
                                      ),
                                      Container(
                                        height: height*0.044,
                                        width: width*0.5,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Center(child: InkWell(
                                          onTap: (){
                                            //connect with FIRESTORE

                                            coll_ref.doc(snapshot.data!.docs[index]["Id"].toString()).update(
                                                {
                                                  "Title": _update.text.toString()
                                                }).then((value) => {
                                                  print("Success"),
                                              _update.clear()
                                            }).onError((error, stackTrace) =>
                                            {print("un-success")
                                            });
                                          },
                                          child: Text("Update Data",style: GoogleFonts.monda(
                                              color: Colors.black,
                                              fontSize: 15
                                          ),),
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                        child: Icon(Icons.edit)),
                  );
                });
          })
      ),
    );
  }
}
