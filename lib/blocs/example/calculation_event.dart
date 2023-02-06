part of 'calculation_bloc.dart';

// Latian Parse di UI
// class CalculationEvent extends Equatable {
//   const CalculationEvent(this.numberA, this.numberB, this.numberC);
//   final int numberA;
//   final int numberB;
//   final int numberC;
//   @override
//   List<Object> get props => [numberA, numberB, numberC];
// }

//Latian Parse di Bloc
class CalculationEvent extends Equatable {
  const CalculationEvent(
      {required this.numberA, required this.numberB, required this.numberC});
  final String numberA;
  final String numberB;
  final String numberC;
  @override
  List<Object> get props => [numberA, numberB, numberC];
}
