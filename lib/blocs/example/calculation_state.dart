part of 'calculation_bloc.dart';

abstract class CalculationState extends Equatable {
  // const CalculationState(this.plusResult, this.minusResult, this.multipleResult, this.divideResult);
  // final int plusResult;
  // final int minusResult;
  // final int multipleResult;
  // final int divideResult;
  @override
  List<Object> get props => [];
  //   plusResult,minusResult,multipleResult,divideResult
  // ];
}

class CalculationInitial extends CalculationState {}

class CalculationSuccess extends CalculationState {
  final String nilaiAsuransi;
  final String totalDiskon;
  final String totalShiping;
  final String nilaiCOD;

  CalculationSuccess(
      {required this.nilaiAsuransi,
      required this.totalDiskon,
      required this.totalShiping,
      required this.nilaiCOD});
  @override
  List<Object> get props =>
      [nilaiAsuransi, totalDiskon, totalShiping, nilaiCOD];
}
