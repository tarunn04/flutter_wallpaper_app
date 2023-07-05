import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
        color: Color.fromARGB(255, 232, 229, 229),
       borderRadius: BorderRadius.all(Radius.circular(30)),
      ),

      child: TextField(
        decoration: InputDecoration(
           border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none
          ),
          hintText: "Search Wallpaper...",
          hintStyle: TextStyle(
            fontFamily: GoogleFonts.nunito().fontFamily,
            fontWeight: FontWeight.w500 
          ),
          suffixIcon: const Icon(Icons.search,size: 30,
          color: Color.fromARGB(112, 0, 0, 0),),
          
        ),
      ),
    );
  }
}