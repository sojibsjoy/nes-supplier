import 'package:dogventurehq/states/bindings/auth.dart';
import 'package:dogventurehq/states/bindings/initial.dart';
import 'package:dogventurehq/states/bindings/order.dart';
import 'package:dogventurehq/states/bindings/product.dart';
import 'package:dogventurehq/ui/screens/edit_address/edit_address.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/my_orders/my_orders.dart';
import 'package:dogventurehq/ui/screens/notification/notification.dart';
import 'package:dogventurehq/ui/screens/order_details/order_details.dart';
import 'package:dogventurehq/ui/screens/privacy_policy/privacy_policy.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/screens/profile/profile.dart';
import 'package:dogventurehq/ui/screens/splash/splash.dart';
import 'package:dogventurehq/ui/screens/total_orders/total_orders.dart';
import 'package:get/route_manager.dart';

class AllRoutes {
  static List<GetPage> allroutes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      bindings: [
        InitialBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: ProductsScreen.routeName,
      page: () => const ProductsScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: MyOrdersScreen.routeName,
      page: () => const MyOrdersScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: OrderDetails.routeName,
      page: () => const OrderDetails(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: ProfileScreen.routeName,
      page: () => const ProfileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: NotificationScreen.routeName,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: PrivacyPolicyScreen.routeName,
      page: () => const PrivacyPolicyScreen(),
    ),
    GetPage(
      name: EditAddressScreen.routeName,
      page: () => const EditAddressScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: TotalOrdersScreen.routeName,
      page: () => const TotalOrdersScreen(),
    ),
  ];
}
