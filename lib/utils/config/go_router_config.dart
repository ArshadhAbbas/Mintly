import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/main.dart';
import 'package:mintly/view/accounts/accounts_view.dart';
import 'package:mintly/view/add_bank_account/add_new_bank_account.dart';
import 'package:mintly/view/add_transaction/add_transaction_view.dart';
import 'package:mintly/view/authenticator/authenticator_view.dart';
import 'package:mintly/view/bottom_nav/view/bottom_nav_view.dart';
import 'package:mintly/view/card_scanner/add_card_view.dart';
import 'package:mintly/view/categories/categories_view.dart';
import 'package:mintly/view/categories/sub_categories/sub_categories_view.dart';
import 'package:mintly/view/onboarding/view/onboarding_view.dart';

class GoRouterConfig {
  static final GoRouter _router = GoRouter(
    initialLocation: prefs?.getBool("didShow") != null && prefs!.getBool("didShow")! ? AuthenticatorView.path : OnBoardingView.path,
    routes: [
      GoRouterRoute(pathRoute: OnBoardingView.path, pathRouteName: OnBoardingView.pathName, builder: (context, state) => OnBoardingView()),
      GoRouterRoute(
        pathRoute: AuthenticatorView.path,
        pathRouteName: AuthenticatorView.pathName,
        builder: (context, state) => AuthenticatorView(),
      ),

      GoRouterRoute(pathRoute: BottomNavView.path, pathRouteName: BottomNavView.pathName, builder: (context, state) => BottomNavView()),
      GoRouterRoute(pathRoute: CategoriesView.path, pathRouteName: CategoriesView.pathName, builder: (context, state) => CategoriesView()),
      GoRouterRoute(
        pathRoute: SubCategoriesView.path,
        pathRouteName: SubCategoriesView.pathName,
        builder: (context, state) {
          final String categoryId = state.pathParameters[SubCategoriesView.categoryIdParam]!;
          return SubCategoriesView(categoryId: categoryId);
        },
      ),
      GoRouterRoute(
        pathRoute: AddCardView.path,
        pathRouteName: AddCardView.pathName,
        builder: (context, state) {
          final cardIdQuery = state.uri.queryParameters[AddCardView.cardIdQuery];
          final int? cardId = cardIdQuery != null ? int.parse(cardIdQuery) : null;
          return AddCardView(cardId: cardId);
        },
      ),
      GoRouterRoute(
        pathRoute: AddNewBankAccount.path,
        pathRouteName: AddNewBankAccount.pathName,
        builder: (context, state) {
          final bankIdQuery = state.uri.queryParameters[AddNewBankAccount.updateBankIdQuery];
          final int? bankId = bankIdQuery != null ? int.parse(bankIdQuery) : null;
          return AddNewBankAccount(bankId: bankId);
        },
      ),
      GoRouterRoute(pathRoute: AccountsView.path, pathRouteName: AccountsView.pathName, builder: (context, state) => AccountsView()),
      GoRouterRoute(
        pathRoute: AddTransactionView.path,
        pathRouteName: AddTransactionView.pathName,
        builder: (context, state) => AddTransactionView(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text(state.error.toString()))),
  );

  static GoRouter get router => _router;
}

class GoRouterRoute extends GoRoute {
  GoRouterRoute({
    String? pathRouteName,
    super.routes,
    super.redirect,
    required String pathRoute,
    required Widget Function(BuildContext context, GoRouterState state) builder,
  }) : super(name: pathRouteName, path: pathRoute, builder: (context, state) => builder(context, state));
}
