
import 'package:balancedmeal/core/utils/router/router.dart';
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/selected_item_state.dart';
import 'package:balancedmeal/feature/home/presentation/views/confirm_order.dart';
import 'package:balancedmeal/feature/onboarding/presentation/views/details_view.dart';
import 'package:balancedmeal/feature/home/presentation/views/home_view.dart';
import 'package:balancedmeal/feature/welcome_page/presentation/views/welcome_view.dart';
import 'package:go_router/go_router.dart';

class AppPages {

static  final  GoRouter goRouter=GoRouter(routes: [
GoRoute(path: AppRouters.welcomeScreen,builder: (context, state) => const WelcomeView(),),
GoRoute(path:AppRouters .detailsScreen,builder: (context, state) => const DetailsView(),),
GoRoute(path:AppRouters .homePage,builder: (context, state) => const HomePage(),),
GoRoute(
  path: AppRouters.confirmOrder,
  builder: (context, state) {
    final selectedItems = state.extra as Map<String, SelectedItem>?; // أو نوع الداتا اللي هتبعتيها
    return ConfirmOrder(selectedItems: selectedItems ?? {});
  },
),


]
);

}