// Create an instance of GameLoadingBloc to use in the UI
import 'package:flutter_bloc/flutter_bloc.dart';

class GameLoadingBloc extends Cubit<GameLoadingState> {
  GameLoadingBloc() : super(GameLoading(alreadyInQueue: 0));

  int alreadyInQueue = 0;

  Future<void> startLoading() async {
    alreadyInQueue ++;
    await Future.delayed(const Duration(milliseconds: 500));
    emit(GameLoading(alreadyInQueue: alreadyInQueue));
    alreadyInQueue ++;
    await Future.delayed(const Duration(seconds: 500));
    alreadyInQueue ++;
    emit(GameLoading(alreadyInQueue: alreadyInQueue));
    await Future.delayed(const Duration(seconds: 1));
    alreadyInQueue ++;
    emit(GameLoading(alreadyInQueue: alreadyInQueue));
    await Future.delayed(const Duration(seconds: 1));
    emit(GameFinished());
  }
}

abstract class GameLoadingState {}

class GameLoading extends GameLoadingState {
  int alreadyInQueue;

  GameLoading({required this.alreadyInQueue});
}

class GameFinished extends GameLoadingState {}
