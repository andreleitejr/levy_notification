import 'package:injectable/injectable.dart';
import 'package:levy_core/core.dart';
import 'package:levy_notification/notification.dart';

@Injectable(as: NotificationDataSource, env: [InjectEnv.impl])
final class NotificationDataSourceImpl implements NotificationDataSource {
  @override
  Future<List<NotificationModel>> get() async {
    return [];
  }
}
