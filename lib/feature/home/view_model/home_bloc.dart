import 'dart:async';
import 'package:bloc_mvvm_sudhanshu/feature/home/model/participant_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/helper.dart';
import '../../../core/helpers/all_getter.dart';
import '../../common_widgets/custom_toast.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetListEvent>(_onGetHomeList);
    add(GetListEvent());
  }

  List<ParticipantModel> participantsList = [];
  FutureOr<void> _onGetHomeList(
      GetListEvent event, Emitter<HomeState> emit) async {
    try {
      if (!(await Getters.networkInfo.isConnected)) {
        return;
      }
      emit(GetListLoading());
      if (await Getters.networkInfo.isSlow) {
        toast(msg: "Your Internet connection is slow", isError: true);
      }

      final result = await Getters.homeRepository.getChatList();
      final state = result.fold((error) {
        return GetListFailed(error: error.message);
      }, (result) {
        participantsList = result;
        return const GetListSuccess(message: '');
      });
      emit(state);
    } catch (e) {
      blocLog(
        msg: e.toString(),
        bloc: "HomeBloc",
      );
      emit(GetListFailed(error: e.toString()));
    }
  }
}
