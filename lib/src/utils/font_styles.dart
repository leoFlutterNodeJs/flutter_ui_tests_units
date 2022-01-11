import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FontStyles {
  static final TextTheme = GoogleFonts.nunitoSansTextTheme();

  static final title = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final textButton = GoogleFonts.nunitoSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
