import 'package:flutter_bloc/flutter_bloc.dart';

import 'comment_data.dart';
import 'data_team.dart';

// Create the enum class to build the info type
enum InfoType { MasterPage, MemberPage }

abstract class ITeamOperationState {}

class TeamOptLoadingState extends ITeamOperationState {}

class TeamOptMasterState extends ITeamOperationState {}

class TeamOptMemberState extends ITeamOperationState {}

class TeamOptMemberJoinedState extends ITeamOperationState {}

// Create the team operation cubit class
class TeamOperationCubit extends Cubit<ITeamOperationState> {
  TeamData teamData;
  List<CommentData> commentList = [];
  InfoType infoType;

  TeamOperationCubit({
    required this.teamData,
    required this.infoType,
  }) : super(TeamOptLoadingState()){
    init();
  }

  void init() {
    switch (infoType) {
      case InfoType.MasterPage:
        commentList.add(CommentData());
        commentList.add(CommentData());
        emit(TeamOptMasterState());
        break;
      case InfoType.MemberPage:
        commentList.add(CommentData());
        emit(TeamOptMemberState());
        break;
      default:
        emit(TeamOptLoadingState());
    }
  }

  void joinTeam() {
    emit(TeamOptMemberJoinedState());
  }

  void leaveTeam() {
    emit(TeamOptMemberState());
  }
}
