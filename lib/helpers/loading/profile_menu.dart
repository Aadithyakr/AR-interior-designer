import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProfileMenu extends StatelessWidget {
  IconData icon;

  ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    this.press,
  });

  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 55,
      borderRadius: 20,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color.fromARGB(255, 10, 12, 132).withOpacity(0.5),
          const Color.fromARGB(255, 81, 9, 101).withOpacity(0.4),
        ],
        stops: const [
          0.1,
          1,
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color.fromARGB(255, 58, 56, 189).withOpacity(0.5),
          const Color.fromARGB(255, 131, 47, 187).withOpacity(0.5),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.lightBlueAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: press,
        child: Row(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.anton(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  shadows: [
                    const BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      offset: Offset(0, 5),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
