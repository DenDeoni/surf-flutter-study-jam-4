import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/bloc/magic_ball_bloc.dart';
import 'package:surf_practice_magic_ball/bloc/magic_ball_event.dart';
import 'package:surf_practice_magic_ball/bloc/magic_ball_state.dart';
import 'package:surf_practice_magic_ball/utils/constants.dart';
import 'package:surf_practice_magic_ball/widgets/magic_ball_image.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  Widget body(BuildContext context, state) {
    if (state is MagicBallErrorState) {
      return const MagicBallImage(
        state: error,
      );
    }
    if (state is MagicBallLoadingState) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const MagicBallImage(
            state: success,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: const Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }
    if (state is MagicBallLoadedState) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const MagicBallImage(
            state: success,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: Text(
              state.answer,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }
    return const MagicBallImage(
      state: notActive,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider(
            create: (_) => MagicBallBloc(),
            child: BlocBuilder<MagicBallBloc, MagicBallState>(
              builder: (context, state) {
                final magicBallBloc = BlocProvider.of<MagicBallBloc>(context);
                return GestureDetector(
                  child: body(context, state),
                  onTap: () {
                    if (state is MagicBallInitialState) {
                      magicBallBloc.add(MagicBallLoadingEvent());
                      magicBallBloc.add(MagicBallLoadEvent());
                    }
                    if (state is MagicBallLoadingState) {
                      magicBallBloc.add(MagicBallLoadEvent());
                    }
                    if (state is MagicBallErrorState) {
                      magicBallBloc.add(MagicBallLoadEvent());
                    }
                    if (state is MagicBallLoadedState) {
                      magicBallBloc.add(MagicBallLoadingEvent());
                      magicBallBloc.add(MagicBallLoadEvent());
                    }
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/5,
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text(whatToDoApp,
              style: TextStyle(color: Colors.white54),),
            ),
          )
        ],
      ),
    );
  }
}
