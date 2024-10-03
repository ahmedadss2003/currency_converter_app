import 'package:currency_converter/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kHomeView = "/homeView" ;
  static const kSplashView = "/bookDetailes" ;
 static final router = GoRouter(
  
  routes: [
    GoRoute(
      path: '/', //Tell The App This is the starting Point Of App
      builder: (context, state) =>const HomeView(),
    ),
    
  ],
);
}