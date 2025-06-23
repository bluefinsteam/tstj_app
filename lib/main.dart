import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'providers/health_data_provider.dart';
import 'providers/medication_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/health_form_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/welcome_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const WellnessApp());
}

/// Root widget with providers and router.
class WellnessApp extends StatelessWidget {
  const WellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (c, s) => const DashboardScreen()),
        GoRoute(path: '/add', builder: (c, s) => const HealthFormScreen()),
        GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),
        GoRoute(path: '/register', builder: (c, s) => const RegisterScreen()),
        GoRoute(path: '/welcome', builder: (c, s) => const WelcomeScreen()),
      ],
      initialLocation: '/welcome',
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HealthDataProvider()),
        ChangeNotifierProvider(create: (_) => MedicationProvider()),
      ],
      child: MaterialApp.router(
        title: 'Wellness App',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        routerConfig: router,
      ),
    );
  }
}
