import 'package:go_router/go_router.dart';

import ' routes_strings.dart';
import '../core/presentation/screens/dashboard_screen.dart';

final router = GoRouter(
  initialLocation: RoutesStrings.dashboard,
  routes: [
    GoRoute(
      name: RoutesStrings.dashboard,
      path: RoutesStrings.dashboard,
      builder: (_, __) => const DashboardScreen(),
      // routes: [],
    ),
  ],
);
