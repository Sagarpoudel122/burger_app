import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();
  @override
  List<Object> get props => [];
}

class PageLoading extends BottomNavigationState {}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  const CurrentIndexChanged({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];

  @override
  String toString() => 'current index changed { current: ${currentIndex} }';
}

class UnauthorizedError extends BottomNavigationState {}
