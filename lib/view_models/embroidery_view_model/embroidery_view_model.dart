// StateNotifier to manage the EmbroideryState
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/utils/app_textfield_controllers.dart';
import 'package:golden_doctor/view_models/embroidery_view_model/embroidery_state.dart';

class CounterNotifier extends StateNotifier<EmbroideryState> {
  CounterNotifier()
      : super(EmbroideryState(
          count: 0,
          message: 'Initial message',
          addtext: false,
        ));

  // Method to increment the count
  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  // Method to update the message
  void updateMessage(String newMessage) {
    state = state.copyWith(message: newMessage);
  }

  // Method to update the addText
  void updateaddText(bool addtext) {
    state = state.copyWith(addtext: !addtext);
    log('state = ${state.addtext}');
  }
}

// Provider for CounterNotifier
final embroideryProvider =
    StateNotifierProvider<CounterNotifier, EmbroideryState>((ref) {
  return CounterNotifier();
});

final addTextBoolProvider = StateProvider<bool>((ref) => false);
final textPositionProvider = StateProvider<String>((ref) => 'Left Chest');
final textColorProvider = StateProvider<String>((ref) => 'BLACK');
final textFontProvider = StateProvider<String>((ref) => 'Block');

final textName2Provider = StateProvider<String>((ref) {
  return '';
});

final textName1Provider = StateProvider<String>((ref) {
  return '';
});
