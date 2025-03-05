import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:levy_notification/notification.dart';

final notificationDataSourceProvider = Provider<NotificationDataSource>((ref) {
  return NotificationDataSourceMock();
});
