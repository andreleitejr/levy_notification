//@GeneratedMicroModule;LevyNotificationPackageModule;package:levy_notification/core/inject/inject.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:levy_notification/features/notification/data/datasources/notification_datasource_impl.dart'
    as _i834;
import 'package:levy_notification/features/notification/data/datasources/notification_datasource_mock.dart'
    as _i616;
import 'package:levy_notification/features/notification/data/repositories/notification_repository_impl.dart'
    as _i526;
import 'package:levy_notification/features/notification/domain/usecases/get_notification_usecase_impl.dart'
    as _i995;
import 'package:levy_notification/notification.dart' as _i785;

const String _impl = 'impl';
const String _mock = 'mock';

class LevyNotificationPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i785.NotificationDataSource>(
      () => _i834.NotificationDataSourceImpl(),
      registerFor: {_impl},
    );
    gh.factory<_i785.NotificationDataSource>(
      () => _i616.NotificationDataSourceMock(),
      registerFor: {_mock},
    );
    gh.factory<_i785.NotificationRepository>(() =>
        _i526.NotificationRepositoryImpl(gh<_i785.NotificationDataSource>()));
    gh.factory<_i785.GetNotificationUseCase>(() =>
        _i995.GetNotificationUseCaseImpl(gh<_i785.NotificationRepository>()));
  }
}
