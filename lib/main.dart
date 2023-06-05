import 'package:billy/pages/bills/edit_bill.dart';
import 'package:billy/pages/bills/view_bills.dart';
// import 'package:billy/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BillyApp());
}

class BillyApp extends StatelessWidget {
  const BillyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Billy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: "/my-bills",
  routes: [
        GoRoute(
          path: "/my-bills",
          builder: (context, state) => const MyBills(),
        ),
        GoRoute(
          name: "/edit-bill",
          path: "/edit-bill/:id",
          builder: (context, state) => EditBill(id: state.pathParameters['id']!),
        )
  ],
);
