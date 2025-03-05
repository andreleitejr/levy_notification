import 'package:flutter_test/flutter_test.dart';
import 'package:levy_notification/notification.dart';
import 'package:mocktail/mocktail.dart';

final class NotificationDataSourceMock extends Mock implements NotificationDataSource {}

void main() {
  late NotificationDataSourceMock mockDataSource;
  late NotificationRepositoryImpl repository;

  setUp(() {
    mockDataSource = NotificationDataSourceMock();
    repository = NotificationRepositoryImpl(mockDataSource);
  });

  group('NotificationRepositoryImpl - get', () {
    test('should return List<NotificationEntity> when the call is successful',
        () async {
      final expectedNotifications = [
        const NotificationModel(),
      ];

      when(() => mockDataSource.get())
          .thenAnswer((_) async => expectedNotifications);

      final result = await repository.get();

      expect(result, isA<List<NotificationEntity>>());
      expect(result, expectedNotifications);

      verify(() => mockDataSource.get()).called(1);
    });

    test('should throw an exception when the call fails', () async {
      when(() => mockDataSource.get()).thenThrow(Exception('Generic Error'));

      final call = repository.get();

      expect(call, throwsA(isA<Exception>()));

      verify(() => mockDataSource.get()).called(1);
    });
  });
}
