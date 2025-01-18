class EmbroideryState {
  final int count;
  final String message;

  EmbroideryState({required this.count, required this.message});

  // Copy method to update state immutably
  EmbroideryState copyWith({int? count, String? message}) {
    return EmbroideryState(
      count: count ?? this.count,
      message: message ?? this.message,
    );
  }
}
