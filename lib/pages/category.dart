import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Text(
                  "Category",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7
                  ), 
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed("/wallpaperPage");
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      
                    ),
                  );
                },),
  
            )
          ],
        ),
      ),
    );
  }
}