class EmbroideryState {
  final int count;
  final String message;
  final  bool addtext ;

  EmbroideryState({required this.count, required this.message , required this.addtext});

  // Copy method to update state immutably
  EmbroideryState copyWith({int? count, String? message, bool? addtext}) {
    return EmbroideryState(
      count: count ?? this.count,
      message: message ?? this.message,
      addtext: false,
    );
  }
}
