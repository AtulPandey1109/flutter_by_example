part of 'timer_bloc.dart';

sealed class TimerState extends Equatable{
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

class TimerInitialState extends TimerState{
  const TimerInitialState(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';

}

class TimerStartedState extends TimerState{
  const TimerStartedState(super.duration);
  @override
  String toString() => 'TimerInitial { duration: $duration }';

}

class TimerPausedState extends TimerState{
  const TimerPausedState(super.duration);
  @override
  String toString() => 'TimerInitial { duration: $duration }';

}

class TimerResetState extends TimerState {
  const TimerResetState(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';

}

class TimerCompletedState extends TimerState{
  const TimerCompletedState():super(0);
  @override
  String toString() => 'TimerInitial { duration: $duration }';

}

