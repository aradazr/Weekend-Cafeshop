import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weekend_cafeshop/constans/my_color.dart';

class MyTextStyle {
  static const TextStyle title = TextStyle(
      fontFamily: 'lilj',
      color: MyColors.titleColor,
      fontSize: 30,
      fontWeight: FontWeight.w600);
  static const TextStyle title2 = TextStyle(
      fontFamily: 'lilj',
      color: MyColors.titleColor,
      fontSize: 20,
      fontWeight: FontWeight.w600);

  static final TextStyle cafeAndRestaurant = GoogleFonts.akatab(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: MyColors.cafeAndRestaurantColor);

  static final TextStyle fallInLoveWithCoffe = GoogleFonts.sora(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: MyColors.fallInLoveWithCoffeeColor);

  static final TextStyle categoryName = GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      
      color: MyColors.fallInLoveWithCoffeeColor);
      
      static final TextStyle textInsideImage = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      
      color: MyColors.textInsideImageColor);
      
      static final TextStyle textInsideImageInstagram = GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      
      color: MyColors.textInsideImageColor);
      
      static final TextStyle weekendRights = GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      
      
      color: MyColors.weekendRightsColor);
}
