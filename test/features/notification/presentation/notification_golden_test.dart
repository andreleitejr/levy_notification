import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:levy_notification/notification.dart';
import 'package:levy_core/core.dart';
import 'package:levy_test_utils/test_utils.dart';
import 'package:mocktail/mocktail.dart';

final class NotificationDataSourceMock extends Mock implements NotificationDataSource {}

final class GetNotificationUseCaseMock extends Mock implements GetNotificationUseCase {}

void main() {
  late NotificationDataSourceMock notificationDataSourceMock;
  late GetNotificationUseCaseMock getNotificationUseCaseMock;

  setUpAll(() {
    notificationDataSourceMock = NotificationDataSourceMock();
    getNotificationUseCaseMock = GetNotificationUseCaseMock();

    GetIt.instance.registerFactory<NotificationDataSource>(() => notificationDataSourceMock);
    GetIt.instance.registerFactory<GetNotificationUseCase>(() => getNotificationUseCaseMock);
  });

  group('Notification Page Golden Test', () {
    testWidgets('Notification Page Error', (tester) async {
      final errorMessage = 'Failed to load notificationes';

      when(() => getNotificationUseCaseMock()).thenThrow(Exception(errorMessage));

      await runGoldenTestForDifferentScreenSizes(
        tester: tester,
        widget: ThemeErrorWidget(
          message: errorMessage,
        ),
        testName: 'NotificationError',
      );
    });

    testWidgets('Notification Page Loading', (tester) async {
      await runGoldenTestForDifferentScreenSizes(
        tester: tester,
        widget: NotificationShimmer(onPop: () {}),
        testName: 'NotificationLoading',
      );
    });

    testWidgets('Notification Page Success', (tester) async {
      final c = Completer<List<NotificationModel>>();

      when(() => notificationDataSourceMock.get()).thenAnswer((_) async {

        return c.future;
      });

      await runGoldenTestForDifferentScreenSizes(
        tester: tester,
        widget: NotificationPage(),
        testName: 'NotificationSuccess',
      );

      c.complete(NotificationMock.response.map<NotificationModel>((notification) {
        return NotificationModel.fromJson(notification);
      }).toList());
    });
  });
}
