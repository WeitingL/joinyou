import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/data_team.dart';

enum FilterType { location, time, level, rating }

class FindTeamViewState {
  List<TeamData> teamList = [];

  FindTeamViewState(this.teamList);
}

class TeamListCubit extends Cubit<FindTeamViewState> {
  TeamListCubit() : super(FindTeamViewState([])) {
    getTeamList();
  }

  List<TeamData> teamList = [];

  Future<void> getTeamList() async {
    await Future.delayed(const Duration(seconds: 1));
    teamList = [TeamData(), TeamData(), TeamData(), TeamData()];
    emit(FindTeamViewState(teamList));
  }

}
