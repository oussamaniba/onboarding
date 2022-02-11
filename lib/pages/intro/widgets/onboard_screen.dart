import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardScreen extends StatelessWidget {
  Map<String, dynamic> screen;

  OnBoardScreen({
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Create an account'.toUpperCase(),
            style: GoogleFonts.fjallaOne(
              color: Colors.blue[900],
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            screen['title'],
            style: GoogleFonts.fjallaOne(
              color: Colors.blue[900],
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  screen['img'],
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              screen['msg'],
              textAlign: TextAlign.center,
              style: GoogleFonts.fjallaOne(
                color: Colors.blue[900],
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
