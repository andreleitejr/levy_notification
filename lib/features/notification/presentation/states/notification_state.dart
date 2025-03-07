import 'package:levy_notification/notification.dart';
import 'package:levy_theme/core/theme/theme.dart';

final class NotificationState implements GenericStateBase {
  final List<NotificationEntity> data;

  @override
  final String errorMessage;

  @override
  final bool isLoading;

  const NotificationState({
    this.data = const [],
    this.errorMessage = '',
    this.isLoading = false,
  });

  const NotificationState.loading() : this(isLoading: true);
  const NotificationState.success(List<NotificationEntity> data) : this(data: data);
  const NotificationState.error(String message) : this(errorMessage: message);
}
