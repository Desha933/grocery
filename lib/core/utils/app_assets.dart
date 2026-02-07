import 'package:grocery/features/home/domain/entities/categroy_entity.dart';

abstract class AppImagesAssets {
  static const String onBoardingGroceryImage =
      "assets/images/on_boarding_grocery_image.png";
  static const String onBoardingDeliveryImage =
      "assets/images/on_boarding_delivery_image.png";
  static const String registerBackGroundImage =
      "assets/images/register_background_image.png";
  static const String congratulationImage =
      "assets/images/congratulation_image.png";
  static const String loginBackGroundImage =
      "assets/images/login_background_image.png";
  static const String categroyHomeImage =
      "assets/images/category_home_image.png";
  //  static const String itemDetailsImage = "assets/images/item_detail_image.png";
}

abstract class AppSvgAssets {
  static const String svg1 = "assets/svgs/svg_1.svg";
  static const String svg2 = "assets/svgs/svg_2.svg";
  static const String svg3 = "assets/svgs/svg_3.svg";
  static const String svg4 = "assets/svgs/svg_4.svg";

  static const String categorySvg1 = "assets/svgs/category_svg_1.svg";
  static const String categorySvg2 = "assets/svgs/category_svg_2.svg";
  static const String categorySvg3 = "assets/svgs/category_svg_3.svg";
  static const String categorySvg4 = "assets/svgs/category_svg_4.svg";
  static const String categorySvg5 = "assets/svgs/category_svg_5.svg";
  static const String categorySvg6 = "assets/svgs/category_svg_6.svg";
  static const String categorySvg7 = "assets/svgs/category_svg_7.svg";
  static const String categorySvg8 = "assets/svgs/category_svg_8.svg";

  static const List<String> svgList = [svg1, svg2, svg3, svg4];
  static const List<String> svgCategoryList = [
    categorySvg1,
    categorySvg2,
    categorySvg3,
    categorySvg4,
    categorySvg5,
    categorySvg6,
    categorySvg7,
    categorySvg8,
  ];
  static const List<String> categroyNameList = [
    "Fruits",
    "Vegetables",
    "Mushroom",
    "Dairy",
    "Oats",
    "Bread",
    "Rice",
    "Egg",
  ];

  static const List<CategroyEntity> categories = [
    CategroyEntity(categoryName: "Fruits", categoryImage: categorySvg1),
    CategroyEntity(categoryName: "Vegetables", categoryImage: categorySvg2),
    CategroyEntity(categoryName: "Mushroom", categoryImage: categorySvg3),
    CategroyEntity(categoryName: "Dairy", categoryImage: categorySvg4),
    CategroyEntity(categoryName: "Oats", categoryImage: categorySvg5),
    CategroyEntity(categoryName: "Bread", categoryImage: categorySvg6),
    CategroyEntity(categoryName: "Rice", categoryImage: categorySvg7),
    CategroyEntity(categoryName: "Egg", categoryImage: categorySvg8),
  ];
}
