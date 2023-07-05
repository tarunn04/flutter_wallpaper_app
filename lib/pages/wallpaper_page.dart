import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WallpaperPage extends StatelessWidget {
  const WallpaperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 60,),
            Container(
              height: MediaQuery.of(context).size.height*0.75,
              width:  MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width*0.42,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(130, 233, 229, 229),
                  ),
                  child: Center(
                    child: Text("Set Wallpaper",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width*0.42,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(130, 233, 229, 229),
                  ),
                  child: Center(child: Text("Download",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}