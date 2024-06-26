import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studyingfirebase/Screens/Authentication/login_screen.dart';
import 'package:studyingfirebase/Screens/Firebase-CRUD/firebase_home.dart';
import 'package:studyingfirebase/Screens/Firestore-CRUD/firestore_home_screen.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}



class _home_screenState extends State<home_screen> {

  //For logout firebase authentication package import
  FirebaseAuth authentication = FirebaseAuth.instance;

  //For showing error message to user

  message(data)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data),backgroundColor: Colors.red,));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        actions:   [
          InkWell(
              onTap: (){
                authentication.signOut().then((value) =>
                {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => login_screen()), (
                          route) => false)
                }).onError((error, stackTrace) => {
                  message(error)
                });

              },
              child: const Icon(Icons.logout,size: 30,color: Colors.white,)),
        ],
        title:  Text("Home Screen",style: GoogleFonts.monda(color: Colors.white,fontSize: 25),),
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const firebase_home()));
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
                      "Firebase Home - Screen",
                      style: GoogleFonts.monda( fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal)
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const firestore_home_screen()));
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
                      "Firestore Home - Screen",
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
