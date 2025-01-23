import 'package:flutter_riverpod/flutter_riverpod.dart';

final addTextBoolProvider = StateProvider<bool>((ref) => false);
final textPositionProvider = StateProvider<String>((ref) => 'Left Chest');
final textColorProvider = StateProvider<String>((ref) => 'BLACK');
final textFontProvider = StateProvider<String>((ref) => 'Block');
final textName1Provider = StateProvider<String>((ref) => '');
final textName2Provider = StateProvider<String>((ref) => '');
