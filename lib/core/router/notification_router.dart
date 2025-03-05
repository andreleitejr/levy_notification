import 'package:auto_route/auto_route.dart';
import 'package:levy_notification/core/router/notification_router.gr.dart';

@AutoRouterConfig()
final class NotificationRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: NotificationRoute.page),
  ];
}