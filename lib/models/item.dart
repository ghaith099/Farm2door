class Item {
  const Item({
    required this.title,
    required this.svgAsset,
    this.imageAsset,
    required this.carb,
    required this.protein,
    required this.fat,
    required this.calories,
    required this.description,
    required this.price,
  });
  final String carb;
  final String protein;
  final String fat;
  final String calories;
  final String title;
  final String svgAsset;
  final String? imageAsset;
  final String description;
  final String price;

  static const List<Item> vegetables = [
    Item(
      price: '1.99',
      description:
          'Tomatoes are a rich source of vitamins, minerals, and antioxidants. They are low in calories and high in water content, making them a great addition to a healthy diet. Tomatoes can be eaten raw in salads, cooked in sauces, or used as a base for soups and stews.',
      carb: '3.9g',
      protein: '0.9g',
      fat: '0.2g',
      calories: '18 kcal',
      title: 'Tomato',
      svgAsset: 'assets/images/tomato.svg',
    ),
    Item(
      price: '0.99',
      description:
          'Carrots are a good source of beta-carotene, which the body converts to vitamin A. They are also a good source of fiber, potassium, and vitamin K. Carrots can be eaten raw, cooked, or juiced.',
      carb: '2.6g',
      protein: '0.7g',
      fat: '0.1g',
      calories: '16 kcal',
      title: 'Carrot',
      svgAsset: 'assets/images/carrot.svg',
      imageAsset: 'assets/images/carrots.png',
    ),
    Item(
      price: '2.49',
      description:
          'Broccoli is a cruciferous vegetable that is rich in vitamins C and K, as well as fiber and antioxidants. It can be eaten raw or cooked.',
      carb: '1.8g',
      protein: '0.9g',
      fat: '0.1g',
      calories: '15 kcal',
      title: 'Broccoli',
      svgAsset: 'assets/images/broccoli.svg',
      imageAsset: 'assets/images/broccoli.png',
    ),
    Item(
      price: '1.29',
      description:
          'Cucumbers are a refreshing source of water and low in calories. They are also a good source of vitamin K and antioxidants. Cucumbers can be eaten raw in salads or used as a base for smoothies.',
      carb: '3.1g',
      protein: '0.6g',
      fat: '0.1g',
      calories: '16 kcal',
      title: 'Cucumber',
      svgAsset: 'assets/images/cucumber.svg',
      imageAsset: 'assets/images/cucumber.png',
    ),
    Item(
      price: '1.49',
      description:
          'Bell peppers are a good source of vitamin C and antioxidants. They are low in calories and can be eaten raw or cooked.',
      carb: '2.9g',
      protein: '0.8g',
      fat: '0.1g',
      calories: '16 kcal',
      title: 'Bell Pepper',
      svgAsset: 'assets/images/bell_pepper.svg',
    ),
    Item(
      price: '1.99',
      description:
          'Eggplants are a good source of antioxidants and dietary fiber. They are low in calories and can be cooked in various ways.',
      carb: '2.2g',
      protein: '0.5g',
      fat: '0.1g',
      calories: '14 kcal',
      title: 'Eggplant',
      svgAsset: 'assets/images/eggplant.svg',
    ),
    Item(
      price: '0.89',
      description:
          'Onions are a good source of vitamin C and antioxidants. They are low in calories and can be eaten raw or cooked.',
      carb: '4.2g',
      protein: '1.1g',
      fat: '0.1g',
      calories: '18 kcal',
      title: 'Onion',
      svgAsset: 'assets/images/onion.svg',
      imageAsset: 'assets/images/onion.png',
    ),
    Item(
      price: '1.79',
      description:
          'Potatoes are a good source of vitamin C and potassium. They are low in fat and can be eaten boiled, baked, or fried.',
      carb: '17.5g',
      protein: '2.0g',
      fat: '0.1g',
      calories: '77 kcal',
      title: 'Potato',
      svgAsset: 'assets/images/potato.svg',
    ),
    Item(price: '1.49',
      description:
          'Corn is a good source of fiber and antioxidants. It is also a good source of vitamin C and folate.',
      carb: '19.0g',
      protein: '3.2g',
      fat: '0.2g',
      calories: '86 kcal',
      title: 'Corn',
      svgAsset: 'assets/images/corn.svg',
      imageAsset: 'assets/images/corn.png',
    ),
    Item(price: '1.29',
      description:
          'Lettuce is a low-calorie vegetable that is a good source of vitamin K and folate. It is also a good source of water and dietary fiber.',
      carb: '2.9g',
      protein: '1.4g',
      fat: '0.2g',
      calories: '15 kcal',
      title: 'Lettuce',
      svgAsset: 'assets/images/lettuce.svg',
    ),
  ];
}
