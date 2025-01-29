import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
final filterProviderLocal = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});
