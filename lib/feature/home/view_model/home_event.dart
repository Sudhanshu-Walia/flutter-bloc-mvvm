import 'package:equatable/equatable.dart';


sealed class HomeEvent extends Equatable {
  const HomeEvent();
}
final class GetListEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
