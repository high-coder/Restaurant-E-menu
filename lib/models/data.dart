import 'categoriesModels.dart';
import 'foodCategory.dart';

final List<Categories> categoriesWidgets = [
  Categories(
    name:"Pizza",
    imageLocation: "assets/images/menu-subheads/pizza.png",
    categoryType: CategoryType.pizza,
  ),
  Categories(
    name:"Burger",
    imageLocation: "assets/images/menu-subheads/burger.png",
    categoryType: CategoryType.burger,
  ),
  Categories(
    name:"Desert",
    imageLocation: "assets/images/menu-subheads/desert.png",
    categoryType: CategoryType.desert,
  ),
  Categories(
    name:"Noodle",
    imageLocation: "assets/images/menu-subheads/noodle.png",
    categoryType: CategoryType.noodles,
  ),
  Categories(
    name:"Pasta",
    imageLocation: "assets/images/menu-subheads/pasta.png",
    categoryType: CategoryType.pasta,
  ),
  Categories(
    name:"Drink",
    imageLocation: "assets/images/menu-subheads/drink.png",
    categoryType: CategoryType.drink,
  ),
];




final List<CustomCategory> foodCategoryType = [
  CustomCategory(
    name:"5 Pepper",
    imageLocationC: "assets/images/pizza/1.png",
    rating: "4.8",
    price: "Rs 199",
    originalPrice: "Rs 249",
    wishlist: true,
    categoryEnum: Category_type.pizza,
  ),
  CustomCategory(
    name:"Cheesy fountain",
    imageLocationC: "assets/images/pizza/2.png",
    rating: "4.5",
    price: "Rs 189",
    originalPrice: "Rs 220",
    wishlist: true,
    categoryEnum: Category_type.pizza,
  ),
  CustomCategory(
    name:"Chocolatey fountain",
    imageLocationC: "assets/images/pizza/3.png",
    rating: "4.2",
    price: "Rs 119",
    originalPrice: "Rs 199",
    wishlist: false,
    categoryEnum: Category_type.pizza,
  ),
  CustomCategory(
    name:"Mozarella",
    imageLocationC: "assets/images/pizza/4.png",
    rating: "4.4",
    price: "Rs 99",
    originalPrice: "Rs 149",
    wishlist: false,
    categoryEnum: Category_type.pizza,
  ),
  CustomCategory(
    name:"Onion Pizza",
    imageLocationC: "assets/images/pizza/5.png",
    rating: "4.1",
    price: "Rs 89",
    originalPrice: "Rs 249",
    wishlist: false,
    categoryEnum: Category_type.pizza,
  ),
  CustomCategory(
    name:"5 Pepper",
    imageLocationC: "assets/images/pizza/6.png",
    rating: "4.3",
    price: "Rs 79",
    originalPrice: "Rs 209",
    wishlist: true,
    categoryEnum: Category_type.pizza,
  ),
  CustomCategory(
    name:"Tomato",
    imageLocationC: "assets/images/pizza/7.png",
    rating: "3.8",
    price: "Rs 69",
    originalPrice: "Rs 99",
    wishlist: false,
    categoryEnum: Category_type.pizza,
  ),
];