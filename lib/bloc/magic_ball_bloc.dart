import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_magic_ball/data/data_repository.dart';
import 'package:surf_practice_magic_ball/models/index.dart';
import 'package:surf_practice_magic_ball/utils/constants.dart';
import 'magic_ball_event.dart';
import 'magic_ball_state.dart';

class MagicBallBloc extends Bloc<MagicBallEvent, MagicBallState> {
  MagicBallBloc() : super(MagicBallInitialState()) {
    late final DataRepository dataRepository = DataRepository();
    on<MagicBallLoadEvent>(
          (event, emit) async {
        LoadedAnswerModel loadedAnswer = await dataRepository.fetchAnswer();
        String answer = loadedAnswer.reading;
        if (loadedAnswer.isSuccess) {
          emit(MagicBallLoadedState(
            answer: answer,
          ));
          print('SUCCESS');
        } else {
          emit(MagicBallErrorState(error: failedRequest));
          print('FAIL');
        }
      },
    );
    on<MagicBallLoadingEvent>(
          (event, emit) async {
          emit(MagicBallLoadingState(
          ));
      },
    );
  }
}
