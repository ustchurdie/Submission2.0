import 'package:flutter/material.dart';

class FoodModel {
  final String name; //name of the dish e.g. "Eggtart"
  final String description; // description of the dish
  final double calories; // calories of the dish
  final String unit; //"打,件,條 etc." translations
  final Image photo; //photo to show the brief outlook of the dish
  final List<String>
      ingredients; //what does the dish included (may further elaborate to allergies/religion/seafood/vegan)
  final Map<String, double>
      taste; //Different level of taste; using star/bar chart to present

  FoodModel(this.ingredients, this.name, this.description, this.calories,
      this.unit, this.photo, this.taste);

  static final List<String> title = [
    "Hamburger",
    "Noodle",
    "Pot",
    "Salad",
    "Eggtart"
  ];
  static final List<String> demoImage = [
    "hamburger.jpg",
    "noodle.jpg",
    "pot.jpg",
    "salad.jpg",
    "eggtart/1.jpg"
  ];
}

class CCTBreakfast{

  static final List<String> cctBreakfastCanName =[
    '火腿沙律碎蛋三文治',
    '奶油豬',
    '芝士吞拿魚脆豬',
    '芝士鹹牛肉脆豬',
    '厚多士',
    '香脆魚柳包',
    '香脆豬扒包',
    '營養餐3.6北海道牛乳炒蛋配厚多士'
  ];

  static final List<String> cctBreakfastEngName = [
    'Ham and chopped egg salad sandwich',
    'Toasted bun served with condensed milk',
    'Toasted bun served with cheese and tuna',
    'Toasted bun served with cheese and corned beef',
    'Hong Kong style French toast',
    'Bread_bun (served with) fish filet',
    'Bread_bun (served with) Crispy (omitted) Pork chop',
    '3.6 Hokkaido milk scrambled eggs with Hong Kong style French toast'
  ];
  static final List<String> cctBreakfastImages = [
    '/cctbreakfast/1.jpg',
    '/cctbreakfast/2.jpg',
    '/cctbreakfast/3.jfif',
    '/cctbreakfast/4.jpg',
    '/cctbreakfast/5.jpg',
    '/cctbreakfast/6.jpg',
    '/cctbreakfast/7.jpg',
    '/cctbreakfast/8.jpg',
  ];
}
