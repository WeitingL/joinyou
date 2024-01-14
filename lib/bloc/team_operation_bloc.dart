import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/comment_data.dart';
import '../data/data_team.dart';
import '../data/team_data_type.dart';

abstract class ITeamOptState {}

class InitState extends ITeamOptState {}

class MasterPageState extends ITeamOptState {}

class MemberPageAlreadyJoinState extends ITeamOptState {}

class MemberPageState extends ITeamOptState {}

class TeamOptCubit extends Cubit<ITeamOptState> {
  TeamData teamData;
  List<CommentData> commentList = [];
  InfoType infoType;

  TeamOptCubit({required this.teamData, required this.infoType})
      : super(InitState());

  void init() {
    commentList.add(
        CommentData()
    );
    if (infoType == InfoType.MasterPage) {
      emit(MasterPageState());
    } else if (infoType == InfoType.MemberPage) {
      emit(MemberPageState());
    }
  }

  void applyJoin() {
    emit(MemberPageAlreadyJoinState());
  }

  void cancelJoin() {
    emit(MemberPageState());
  }
}
