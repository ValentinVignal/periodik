import 'package:flutter/material.dart';

enum PointState {
  none,
  activated,
  deactivated,
  possiblyActivated,
  possiblyDeactivated,
}

extension PointStateColor on PointState {
  Color? containerColor(ThemeData theme) {
    switch (this) {
      case PointState.none:
        return null;
      case PointState.activated:
        return theme.colorScheme.errorContainer.withOpacity(0.8);
      case PointState.deactivated:
        return theme.colorScheme.secondaryContainer.withOpacity(0.8);
      case PointState.possiblyActivated:
        return theme.colorScheme.errorContainer.withOpacity(0.2);
      case PointState.possiblyDeactivated:
        return theme.colorScheme.secondaryContainer.withOpacity(0.2);
    }
  }
}
