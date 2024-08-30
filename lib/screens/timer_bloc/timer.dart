import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_login_app/screens/timer_bloc/ticker.dart';

import 'bloc/timer_bloc.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {



  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
    ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Timer With Bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text(
      '$minutesStr:$secondsStr',
      ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<TimerBloc,TimerState>(
              builder: (context,state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...switch (state) {
                    TimerInitialState() => [
                      FloatingActionButton(
                        child: const Icon(Icons.play_arrow),
                        onPressed: () => context
                            .read<TimerBloc>()
                            .add(TimerStarted(duration: state.duration)),
                      ),
                    ],
                    TimerStartedState() => [
                      FloatingActionButton(
                        child: const Icon(Icons.pause),
                        onPressed: () =>
                            context.read<TimerBloc>().add(const TimerPaused()),
                      ),
                      FloatingActionButton(
                        child: const Icon(Icons.replay),
                        onPressed: () =>
                            context.read<TimerBloc>().add(const TimerReset()),
                      ),
                    ],
                    TimerPausedState() => [
                      FloatingActionButton(
                        child: const Icon(Icons.play_arrow),
                        onPressed: () =>
                            context.read<TimerBloc>().add(const TimerResumed()),
                      ),
                      FloatingActionButton(
                        child: const Icon(Icons.replay),
                        onPressed: () =>
                            context.read<TimerBloc>().add(const TimerReset()),
                      ),
                    ],
                    TimerCompletedState() => [
                      FloatingActionButton(
                        child: const Icon(Icons.replay),
                        onPressed: () =>
                            context.read<TimerBloc>().add(const TimerReset()),
                      ),
                    ],
                    TimerResetState() => [
                      FloatingActionButton(
                        child: const Icon(Icons.play_arrow),
                        onPressed: () => context
                            .read<TimerBloc>()
                            .add(TimerStarted(duration: state.duration)),
                      ),
                  ],
                  _=>[
                    const SizedBox()
                  ]
                  }
                ],
              );
            }
          )
        ],
      ),
    ));
  }
}