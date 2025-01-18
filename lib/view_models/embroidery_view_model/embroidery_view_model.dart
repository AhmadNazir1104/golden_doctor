// StateNotifier to manage the EmbroideryState
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/view_models/embroidery_view_model/embroidery_state.dart';

class CounterNotifier extends StateNotifier<EmbroideryState> {
  CounterNotifier() : super(EmbroideryState(count: 0, message: 'Initial message'));

  // Method to increment the count
  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  // Method to update the message
  void updateMessage(String newMessage) {
    state = state.copyWith(message: newMessage);
  }
}

// Provider for CounterNotifier
final embroideryProvider =
    StateNotifierProvider<CounterNotifier, EmbroideryState>((ref) {
  return CounterNotifier();
});
