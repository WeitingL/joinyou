import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinyou/data/data_team.dart';

abstract class IMyTeamState {}

class LoadingState extends IMyTeamState {}

class MyTeamState extends IMyTeamState {
  List<TeamData> myTeams;

  MyTeamState({required this.myTeams});
}

class MyPlayListState extends IMyTeamState {
  List<TeamData> myPlayList;

  MyPlayListState({required this.myPlayList});
}

class MyTeamCubit extends Cubit<IMyTeamState> {
  MyTeamCubit() : super(LoadingState()) {
    init();
  }

  List<TeamData> myTeams = [];
  List<TeamData> myPlayList = [];

  init() {
    emit(LoadingState());
    getMyTeamAndPlay();
  }

  Future<void> getMyTeamAndPlay() async {
    await Future.delayed(const Duration(seconds: 1));
    myTeams = [TeamData(), TeamData(), TeamData(), TeamData()];
    myPlayList = [TeamData(), TeamData()];
    emit(MyTeamState(myTeams: myTeams));
  }

  void getMyTeam() {
    emit(MyTeamState(myTeams: myTeams));
  }

  void getMyPlayList() {
    emit(MyPlayListState(myPlayList: myPlayList));
  }
}
