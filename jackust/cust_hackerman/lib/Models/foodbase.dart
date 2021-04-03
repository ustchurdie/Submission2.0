import 'package:flutter/material.dart';

class FoodModel {
    final String name; //name of the dish e.g. "Eggtart"
    final String description; // description of the dish
    final double calories; // calories of the dish
    final String unit; //"打,件,條 etc." translations
    final Image photo; //photo to show the brief outlook of the dish
    final List<String> ingredients; //what does the dish included (may further elaborate to allergies/religion/seafood/vegan)
    final Map<String, double> taste; //Different level of taste; using star/bar chart to present

  FoodModel(this.ingredients, this.name, this.description, this.calories, this.unit, this.photo, this.taste);

  static final  List<String> title = ["Hamburger", "Noodle", "Pot", "Salad"];
  final List<String> demoImage = [
    "hamburger.jpg",
    "noodle.jpg",
    "pot.jpg",
    "salad.jpg"
  ];
}  