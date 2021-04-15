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

class CCTTea{
  static final List<String> cctteaEngName = [
    'Baked Potato Paste with Cheese and Bacon',
    'Springy Baked Spaghetti Bolognese',
    'Stir-fried Spaghetti with Beef and Black Pepper',
    'Club sandwich',
    'Toasted bun served with butter',
    'Cutlet pork chop',
    'Hong Kong style French toast served with chocolate and red beans',
    'Hong Kong Style French Toast served with   ham and cheese',
    'French fries',
    'Deep fried chicken wings',
    'Deep fried chicken thighs',
    'Fish fillets',
    'Pan-fried Pork Chop',
    'Pan-fried Chicken fillets',
    'Baked Spaghetti Carbonara',
    'Stir-fried pork chop with sweet soy sauce and instant ramen',
    'Marinated chicken thighs',
    'Cold udon with sesame sauce',
    'Corn and chopped egg salad',
    'Hong Kong style French toast served with condensed milk and peanut butter',
    'Teriyaki Chicken Wings with Udon',
    'Chicken wings with “Swiss sauce”',
    'Toast served with whipped cream'
  ];

  static final List<String> cctteaCanName = [
    '芝士煙肉焗薯蓉',
    'Q版焗肉醬意粉',
    '黑椒牛肉炒意粉',
    '公司三文治',
    '奶油脆豬',
    '吉列豬扒',
    '朱古力紅豆爆西多',
    '流心芝腿西多士',
    '炸薯條',
    '炸雞翼',
    '炸雞髀',
    '香脆魚柳',
    '香煎豬扒',
    '香煎雞扒',
    '焗卡邦尼意粉',
    '甜豉油豬扒炒一丁',
    '鹵水雞髀',
    '麻醬凍烏冬',
    '粟米碎蛋沙律',
    '煉奶花生醬西多士',
    '照燒汁雞翼炒烏冬',
    '瑞士雞翼',
    '鮮奶油多士'
  ];

  static final List<String> cctteaImages = [
    '/ccttea/1.jpg',
    '/ccttea/2.jpg',
    '/ccttea/3.jpg',
    '/ccttea/4.jfif',
    '/ccttea/5.jpg',
    '/ccttea/6.jpg',
    '/ccttea/7.jfif',
    '/ccttea/8.jpg',
    '/ccttea/9.jpg',
    '/ccttea/10.jpg',
    '/ccttea/11.jpg',
    '/ccttea/12.jpg',
    '/ccttea/13.jpg',
    '/ccttea/14.jfif',
    '/ccttea/15.jpg',
    '/ccttea/16.jpg',
    '/ccttea/17.jpg',
    '/ccttea/18.jpg',
    '/ccttea/19.jpg',
    '/ccttea/20.jpg',
    '/ccttea/21.jpg',
    '/ccttea/22.jpg',
    '/ccttea/23.JPG',

  ];
}

class CCTMainCourse{

  static final List<String> cctmainCanName = [
    '芙蓉蛋飯',
    '星洲炒米',
    '美極生炒牛肉飯',
    '乾炒牛河',
    '楊州炒飯',
    '滑蛋叉燒飯',
    '滑蛋蝦仁飯',
    '照燒汁肥牛滑蛋飯',
    '照燒汁雞扒滑蛋飯',
    '蔥油豬扒三旦飯',
    '蔥油雞扒三旦飯'
  ];

  static final List<String> cctmainEngName = [
    'Chinese style omelette rice',
    'Singapore stir-fried noodles',
    'Beef fried rice with Maggi soy sauce',
    'Stir-fried beef rice noodles',
    'Yangzhou fried rice',
    'Scrambled eggs barbecue pork rice',
    'Scrambled eggs shrimp rice',
    'Beef and scrambled eggs rice with teriyaki sauce',
    'Chicken steak and scrambled eggs rice with teriyaki sauce',
    'Three Dan Rice with Scallion Pork Chop',
    'Chicken steak rice with triple eggs dressed with scallion oil'
  ];
 
  static final List<String> cctmainImages =[
    '/cctmaincourse/1.jpg',
    '/cctmaincourse/2.jpg',
    '/cctmaincourse/3.jpg',
    '/cctmaincourse/4.jpg',
    '/cctmaincourse/5.jpg',
    '/cctmaincourse/6.jpg',
    '/cctmaincourse/7.jpg',
    '/cctmaincourse/8.jpg',
    '/cctmaincourse/9.jpg',
    '/cctmaincourse/10.jpg',
    '/cctmaincourse/11.jpg'
  ];

}
