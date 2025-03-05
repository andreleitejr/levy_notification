import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:levy_notification/notification.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepositoryImpl(ref.read(notificationDataSourceProvider));
});
