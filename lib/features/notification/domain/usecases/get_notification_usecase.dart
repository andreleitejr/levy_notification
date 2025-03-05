import 'package:levy_notification/notification.dart';

abstract class GetNotificationUseCase {
  Future<List<NotificationEntity>> call();
}
