import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../ticker.dart';
part 'timer_states.dart';
part 'timer_event.dart';


class TimerBloc extends Bloc<TimerEvent,TimerState>{
  static const _duration=10;
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      :_ticker=ticker,
    super(const TimerInitialState(_duration)){
      on<TimerStarted>(_onStarted);
      on<TimerPaused>(_onTimerPaused);
      on<TimerResumed>(_onTimerResumed);
      on<TimerReset>(_onTimerReset);
      on<_TimerTicked>(_onTicked);

  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerStartedState(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(_TimerTicked(duration: duration)));
  }

  void _onTicked(_TimerTicked event,Emitter<TimerState> emit){
    emit(
      event.duration>-0? TimerStartedState(event.duration):TimerCompletedState()
    );
  }

  void _onTimerPaused(TimerPaused event,Emitter<TimerState> emit){
    if(state is TimerStartedState){
      _tickerSubscription?.pause();
      emit(TimerPausedState(state.duration));
    }
  }

  void _onTimerResumed(TimerResumed event,Emitter<TimerState> emit){
    if(state is TimerPausedState){
      _tickerSubscription?.resume();
      emit(TimerStartedState(state.duration));
    }
  }

  void _onTimerReset(TimerReset event,Emitter<TimerState> emit){
    _tickerSubscription?.cancel();
    emit(TimerResetState(_duration));
  }


}