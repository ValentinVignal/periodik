import 'package:flutter/material.dart';

enum PointState {
  none,
  activated,
  deactivated,
  possiblyActivated,
  possiblyDeactivated,
}

extension PointStateColor on PointState {
  Color? containerColor(ThemeData theme) => switch (this) {
    PointState.none => null,
    PointState.activated => theme.colorScheme.errorContainer.withValues(
      alpha: 0.8,
    ),
    PointState.deactivated => theme.colorScheme.secondaryContainer.withValues(
      alpha: 0.8,
    ),
    PointState.possiblyActivated => theme.colorScheme.errorContainer.withValues(
      alpha: 0.2,
    ),
    PointState.possiblyDeactivated =>
      theme.colorScheme.secondaryContainer.withValues(alpha: 0.2),
  };

  Color? onContainerColor(ThemeData theme) => switch (this) {
    PointState.none => null,
    PointState.activated => theme.colorScheme.onErrorContainer,
    PointState.deactivated => theme.colorScheme.onSecondaryContainer,
    PointState.possiblyActivated => theme.colorScheme.onErrorContainer,
    PointState.possiblyDeactivated => theme.colorScheme.onSecondaryContainer,
  };
}
