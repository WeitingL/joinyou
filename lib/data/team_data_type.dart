import 'package:flutter_bloc/flutter_bloc.dart';

// Create the enum class to build the info type
enum InfoType { MasterPage, MemberPage }

abstract class ITeamOperationState {}

class TeamOptLoadingState extends ITeamOperationState {}

class TeamOptMasterState extends ITeamOperationState {}

class TeamOptMemberState extends ITeamOperationState {}

class TeamOptMemberJoinedState extends ITeamOperationState {}

// Create the team operation cubit class
class TeamOperationCubit extends Cubit<ITeamOperationState> {
  TeamOperationCubit() : super(TeamOptLoadingState());


  void getTeamData() {
    emit(TeamOptLoadingState());
  }


}