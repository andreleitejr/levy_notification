import 'package:levy_notification/notification.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> get();
}
