import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_android/features/authentication/email_screen.dart';
import 'package:tiktok_clone_android/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone_android/features/authentication/username_screen.dart';
import 'package:tiktok_clone_android/features/users/users_profile_screen.dart';

final router = GoRouter(
  routes: [
    //signUp_Screen
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
      routes: [
        GoRoute(
          name: UsernameScreen.routeName,
          path: UsernameScreen.routeURL,
          builder: (context, state) => const UsernameScreen(),
          routes: [
            GoRoute(
              name: EmailScreen.routeName,
              path: EmailScreen.routeURL,
              builder: (context, state) {
                final args = state.extra as EmailScreenArgs;
                return EmailScreen(usernameStr: args.usernameStr);
              },
            ),
          ],
        ),
      ],
    ),
    //Login_Screen
    /* GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ), */
    //Username_Screen
    /* GoRoute(
      name: "username_screen",
      path: UsernameScreen.routeName,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const UsernameScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        );
      },
    ), */
    //Email_Screen
    /* GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) {
        final args = state.extra as EmailScreenArgs;
        return EmailScreen(usernameStr: args.usernameStr);
      },
    ), */
    //UserProfile_Screen
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final usernameStr = state.params['usernameStr'];
        final tab = state.queryParams["show"];
        return UserProfileScreen(
          usernameStr: usernameStr!,
          tab: tab!,
        );
      },
    ),
  ],
);
