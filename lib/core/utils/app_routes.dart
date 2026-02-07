import 'package:go_router/go_router.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/auth/presentation/screens/login_screen.dart';
import 'package:grocery/features/auth/presentation/screens/register_screen.dart';
import 'package:grocery/features/home/domain/entities/categroy_entity.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/presentation/screens/add_product_screen.dart';
import 'package:grocery/features/home/presentation/screens/categories_screen.dart';
import 'package:grocery/features/home/presentation/screens/category_products_screen.dart';
import 'package:grocery/features/home/presentation/screens/home_screen.dart';
import 'package:grocery/features/home/presentation/screens/product_detail_screen.dart';
import 'package:grocery/features/on_boarding/presentation/screens/on_boarding_delivery_screen.dart';
import 'package:grocery/features/on_boarding/presentation/screens/on_boarding_first_screen.dart';
import 'package:grocery/features/on_boarding/presentation/screens/on_boarding_second_screen.dart';

class AppRoutes {
  static const String onBoardingFirstScreen = '/';
  static const String onBoardingSecondScreen = '/on_boarding_second_screen';
  static const String onBoardingDeliveryScreen = '/on_boarding_Delivery_screen';
  static const String loginScreen = '/login_screen';
  static const String registerScreen = '/register_screen';
  static const String homeScreen = '/home_screen';
  static const String addProductScreen = '/add_product_screen';
  static const String categoryScreen = '/category_screen';
  static const String categoryProductsScreen = '/category_products_screen';
  static const String productDetailsScreen = '/product_details_screen';

  static final GoRouter router = GoRouter(
    initialLocation: onBoardingFirstScreen,
    routes: [
      // onboarding routes
      GoRoute(
        path: onBoardingFirstScreen,
        builder: (context, state) => const OnBoardingFirstScreen(),
      ),
      GoRoute(
        path: onBoardingSecondScreen,
        builder: (context, state) => const OnBoardingSecondScreen(),
      ),
      GoRoute(
        path: onBoardingDeliveryScreen,
        builder: (context, state) => const OnBoardingDeliveryScreen(),
      ),
      // auth routes
      GoRoute(
        path: loginScreen,
        builder: (context, state) => LoginScreen(email: state.extra as String?),
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),

      // home routes
      GoRoute(
        path: homeScreen,
        builder: (context, state) {
          final user = state.extra as UserEntity;
          return HomeScreen(user: user);
        },
      ),
      // category routes
      GoRoute(
        path: categoryScreen,
        builder: (context, state) =>
            CategoriesScreen(products: state.extra as List<ProductEntity>),
      ),
      GoRoute(
        path: categoryProductsScreen,
        builder: (context, state) {
          final extra = state.extra as (CategroyEntity, List<ProductEntity>);
          return CategoryProductsScreen(category: extra.$1, products: extra.$2);
        },
      ),
      // product routes
      GoRoute(
        path: productDetailsScreen,
        builder: (context, state) =>
            ProductDetailScreen(product: state.extra as ProductEntity),
      ),
      GoRoute(
        path: addProductScreen,
        builder: (context, state) => const AddProductScreen(),
      ),
    ],
  );
}
