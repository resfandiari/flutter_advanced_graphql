import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension BuildContextExtension on BuildContext {

  void showError(String error) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      var theme = Theme.of(this);
      ScaffoldMessenger.of(this).showMaterialBanner(
        MaterialBanner(
          backgroundColor: theme.colorScheme.primary,
          contentTextStyle:
              theme.textTheme.headline5!.copyWith(color: Colors.white),
          content: Text(error),
          actions: [
            InkWell(
              onTap: () => ScaffoldMessenger.of(this).clearMaterialBanners(),
              child: const Icon(Icons.close, color: Colors.white),
            )
          ],
        ),
      );
    });
  }
}
