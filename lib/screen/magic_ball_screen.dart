import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/bloc/magic_ball_bloc.dart';
import 'package:surf_practice_magic_ball/bloc/magic_ball_event.dart';
import 'package:surf_practice_magic_ball/bloc/magic_ball_state.dart';
import 'package:surf_practice_magic_ball/utils/constants.dart';
import 'package:surf_practice_magic_ball/widgets/magic_ball_image.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  Widget _body(BuildContext context, state) {

    // loading
    if (state is MagicBallLoadingState) {
      return const Stack(
        alignment: AlignmentDirectional.center,
        children: [
          MagicBallImage(
            state: loading,
          ),
        ],
      );
    }

    // Loaded
    if (state is MagicBallLoadedState) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const MagicBallImage(
            state: success,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              state.answer,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    // loading error
    if (state is MagicBallErrorState) {
      return const MagicBallImage(
        state: error,
      );
    }
    return const MagicBallImage(state: initState);
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
                // Ball click actions
                return GestureDetector(
                  child: _body(context, state),
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

          // Text What to do with app
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                whatToDoApp,
                style: TextStyle(color: Colors.white54),
              ),
            ),
          )
        ],
      ),
    );
  }
}
