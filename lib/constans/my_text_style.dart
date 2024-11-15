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

  static final TextStyle categoryName = TextStyle(
      fontFamily: 'nzbold',
      fontSize: 17,
      fontWeight: FontWeight.w900,
      color: MyColors.fallInLoveWithCoffeeColor);

  static final TextStyle textInsideImage = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: 'popb',
    fontSize: 16,
    color: MyColors.textInsideImageColor,
  );

  static final TextStyle textInsideImageInstagram = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'popb',
    fontSize: 13,
    color: MyColors.textInsideImageColor,
  );

  static final TextStyle weekendRights = TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: 'popb',
      fontSize: 13,
      color: MyColors.weekendRightsColor);

  static final TextStyle aradazr = TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: 'popb',
      fontSize: 13,
      color: MyColors.aradazrColor);
      
      static final TextStyle hotDrink = TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: 'mj',
      fontSize: 24,
      color: MyColors.hotDrinkColor);
      
      static final TextStyle productName = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'shb',
      fontSize: 20,
      color: MyColors.productNameColor);
      
      static final TextStyle productPrice = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'shb',
      fontSize: 17,
      color: MyColors.productPriceColor);
      
      static final TextStyle productInfo = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'shm',
      fontSize: 13,
      color: MyColors.productPriceColor);
}
