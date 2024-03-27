import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Firebase-CRUD/CRUD-Operation/post_data.dart';
import '../Firebase-CRUD/CRUD-Operation/update_data..dart';
import 'CRUD-Operation/delete_data.dart';
import 'CRUD-Operation/fetch_data.dart';
import 'CRUD-Operation/post_data.dart';
import 'CRUD-Operation/update_data.dart';

class firestore_home_screen extends StatefulWidget {
  const firestore_home_screen({super.key});

  @override
  State<firestore_home_screen> createState() => _firestore_home_screenState();
}

class _firestore_home_screenState extends State<firestore_home_screen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FireStore Home Screen",
          style: GoogleFonts.monda(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Insert/Post data
            InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> post_data_op() ));
              },
              child: Container(
                height: height * 0.055,
                width: width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child:  Center(
                  child: Text(
                      "Post Data - Screen",
                      style: GoogleFonts.monda( fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal)
                  ),
                ),
              ),
            ),

            //Fetching using stream builder

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> fetch_data() ));
              },
              child: Container(
                height: height * 0.055,
                width: width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child:  Center(
                  child: Text(
                      "Fetching Using Stream Builder - Screen",
                      style: GoogleFonts.monda( fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal)
                  ),
                ),
              ),
            ),


            //Update

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> update_data_fs() ));
              },
              child: Container(
                height: height * 0.055,
                width: width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child:  Center(
                  child: Text(
                      "Update Data - Screen",
                      style: GoogleFonts.monda( fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal)
                  ),
                ),
              ),
            ),

            //Update

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> delete_data_fs() ));
              },
              child: Container(
                height: height * 0.055,
                width: width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                child:  Center(
                  child: Text(
                      "Delete Data - Screen",
                      style: GoogleFonts.monda( fontSize: 12,
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
