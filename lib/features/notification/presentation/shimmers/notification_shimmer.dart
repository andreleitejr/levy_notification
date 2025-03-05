import 'package:flutter/material.dart';
import 'package:levy_notification/notification.dart';
import 'package:levy_core/core.dart';

final class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({
    super.key,
    required this.onPop,
  });

  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeAppBarWidget(
        title: NotificationTranslation.header.title,
        onLeadingPressed: onPop,
        leadingIcon: ThemeIcons.arrowLeft,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ThemeListItemShimmer();
        },
      ),
    );
  }
}
