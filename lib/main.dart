import 'package:billy/pages/balance/assets.dart';
import 'package:billy/pages/balance/income_statement.dart';
import 'package:billy/pages/balance/liabilities.dart';
import 'package:billy/pages/bills/edit_bill.dart';
import 'package:billy/pages/bills/view_bills.dart';
import 'package:billy/pages/purchases/edit_purchase.dart';
import 'package:billy/pages/purchases/view_purchases.dart';
import 'package:billy/pages/valueAddedTax/valueAddedTax.dart';
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
  initialLocation: '/value-added-tax',
  routes: [
        GoRoute(
          path: "/my-bills",
          builder: (context, state) => const MyBills(),
        ),
        GoRoute(
          name: "/edit-bill",
          path: "/edit-bill/:id",
          builder: (context, state) => EditBill(id: state.pathParameters['id']!),
        ),
        GoRoute(
          path: "/my-purchases",
          builder: (context, state) => const MyPurchases(),
        ),
        GoRoute(
          name: "/edit-purchase",
          path: "/edit-purchase/:id",
          builder: (context, state) => EditPurchase(id: state.pathParameters['id']!),
        ),        
        GoRoute(
          path: "/value-added-tax",
          builder: (context, state) => const ValueAddedTaxPage(),
        ),        
        GoRoute(
          path: "/assets",
          builder: (context, state) => const AssetsPage(),
        ),
        GoRoute(
          path: "/incomeStatement",
          builder: (context, state) => const IncomeStatementPage(),
        ),
        GoRoute(
          path: "/liabilities",
          builder: (context, state) => const LiabilitiesPage(),
        ),
  ],
);
