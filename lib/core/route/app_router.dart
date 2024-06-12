import 'package:flutter/material.dart';
import 'package:reddist_clone_app/features/auth/screen/login_screen.dart';
import 'package:reddist_clone_app/features/home/screen/home_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutROute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});
final loggedInROute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
});
