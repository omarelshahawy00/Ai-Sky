abstract class AIPredictionState {}

class AIPredictionInitial extends AIPredictionState {}

class AIPredictionLoading extends AIPredictionState {}

class AIPredictionSuccess extends AIPredictionState {
  final String prediction;
  AIPredictionSuccess(this.prediction);
}

class AIPredictionFailure extends AIPredictionState {
  final String error;
  AIPredictionFailure(this.error);
}
