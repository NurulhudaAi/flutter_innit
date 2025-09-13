import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignFontApp extends StatefulWidget {
  const DesignFontApp({super.key});

  @override
  State<DesignFontApp> createState() => _DesignFontAppState();
}

class _DesignFontAppState extends State<DesignFontApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max, 
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Wedding Organizer',
                        style: GoogleFonts.sevillana(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Pre-wedding, Photo, Party',
                        style: GoogleFonts.sevillana(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Our services',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '345 Moo 1 Tasud Chiang Rai, Thailand',
                    style: TextStyle(color: Colors.grey[200]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
