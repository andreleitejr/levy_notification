import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:levy_notification/notification.dart';

final notificationUseCaseProvider = Provider<GetNotificationUseCase>((ref) {
  return GetNotificationUseCaseImpl(ref.read(notificationRepositoryProvider));
});
