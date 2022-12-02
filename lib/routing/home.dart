import 'package:go_router/go_router.dart';
import 'package:untitled/common_widgets/splash_screen.dart';

final homeRoutes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplachScreen,
    ),
  ],
);
