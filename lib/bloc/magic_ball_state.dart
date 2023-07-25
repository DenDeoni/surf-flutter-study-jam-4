abstract class MagicBallState {}
class MagicBallInitialState extends MagicBallState{}
class MagicBallLoadingState extends MagicBallState{}
class MagicBallLoadedState extends MagicBallState{
  late String answer;
  MagicBallLoadedState({required this.answer});
}
class MagicBallErrorState extends MagicBallState{
  late String error;
  MagicBallErrorState({required this.error});
}