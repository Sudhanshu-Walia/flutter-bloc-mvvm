import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class GetListLoading extends HomeState {
  @override
  List<Object> get props => [];
}
final class GetListSuccess extends HomeState {
  final String message;
  const GetListSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class GetListFailed extends HomeState {
  final String error;
  const GetListFailed({required this.error});
  @override
  List<Object> get props => [error];
}
