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

  static const TextStyle categoryName = TextStyle(
      fontFamily: 'nzbold',
      fontSize: 17,
      fontWeight: FontWeight.w900,
      color: MyColors.fallInLoveWithCoffeeColor);

  static const TextStyle textInsideImage = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: 'popb',
    fontSize: 16,
    color: MyColors.textInsideImageColor,
  );

  static const TextStyle textInsideImageInstagram = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'popb',
    fontSize: 13,
    color: MyColors.textInsideImageColor,
  );

  static const TextStyle weekendRights = TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: 'popb',
      fontSize: 13,
      color: MyColors.weekendRightsColor);

  static const TextStyle aradazr = TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: 'popb',
      fontSize: 13,
      color: MyColors.aradazrColor);
      
      static const TextStyle hotDrink = TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: 'mj',
      fontSize: 24,
      color: MyColors.hotDrinkColor);
      
      static const TextStyle productName = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'shb',
      fontSize: 20,
      color: MyColors.productNameColor);
      
      static const TextStyle productNotAvailableName = TextStyle(
         
        overflow: TextOverflow.clip,
      fontWeight: FontWeight.bold,
      fontFamily: 'shb',
      fontSize: 15,
      color: MyColors.productNotAvailableColor);
      
      static const TextStyle productPrice = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'shb',
      fontSize: 17,
      color: MyColors.productPriceColor);
      
      static const TextStyle productInfo = TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'shm',
      fontSize: 13,
      color: MyColors.productPriceColor);
}
