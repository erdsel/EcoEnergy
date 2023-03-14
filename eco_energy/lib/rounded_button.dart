import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.colour, required this.title, required this.onPressed});
  final Color colour;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.lightGreenAccent,
        borderRadius: BorderRadius.circular(30.0),

        child: MaterialButton(
          onPressed: onPressed,
          //Go to login screen.
          minWidth: 300,
          height: 70,
          child: Text(
            title,
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[900]),
          ),
        ),
      ),
    );
  }
}