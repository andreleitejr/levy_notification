
import 'package:levy_notification/notification.dart';

abstract class NotificationDataSource {
  Future<List<NotificationModel>> get();
}
