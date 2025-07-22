import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:periodik/utils/collections.dart';

import '../models/settings.dart';

final settingsProvider = StreamProvider<Settings>((ref) {
  return Collections.settings.snapshots().map(
    (settings) => Settings.fromJson(settings.data() ?? const {}),
  );
});
