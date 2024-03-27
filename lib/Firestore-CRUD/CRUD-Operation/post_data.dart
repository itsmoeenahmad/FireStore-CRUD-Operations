import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class post_data_op extends StatefulWidget {
  const post_data_op({super.key});

  @override
  State<post_data_op> createState() => _post_data_opState();
}

class _post_data_opState extends State<post_data_op> {


  //controller

  TextEditingController _data =  TextEditingController();


  //Instance of FireStore Flutter

  final _ref = FirebaseFirestore.instance.collection("data");

  message(dynamic data,Color _color)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data.toString(),style: GoogleFonts.monda(),),backgroundColor: _color,));
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post Data Operation",
          style: GoogleFonts.monda(fontWeight: FontWeight.w500, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              maxLines: 5,
              cursorColor: Colors.black,
              controller: _data,
              decoration: InputDecoration(
                  hintText: "Write any thing",
                  hintStyle: GoogleFonts.monda(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.black))
              ),
            ),
            InkWell(
              onTap: (){
                var id = DateTime.now().millisecondsSinceEpoch.toString();
                _ref.doc(id).set({
                  'Title': _data.text.toString(),
                  'Id':id.toString()
                }).then((value) => {
                 message("Success", Colors.green)
                }).onError((error, stackTrace) => {
                 message(error, Colors.red)
                });
              },
              child: Container(
                height: height * 0.055,
                width: width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child:  Center(
                  child: Text(
                      "Post Data",
                      style: GoogleFonts.monda( fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
