// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculation_event.dart';
part 'calculation_state.dart';

//Latian Parse di UI
// class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
//   CalculationBloc() : super(CalculationInitial()) {
//     on<CalculationEvent>((event, emit) {
//       final nilaiAsuransi = event.numberC * 0.02;
//       final totalDiskon = event.numberA ~/ 3;
//       final totalShiping = event.numberA - totalDiskon;
//       final nilaiCOD = totalShiping + event.numberB + nilaiAsuransi;
//       emit(CalculationSuccess(
//           nilaiAsuransi: "$nilaiAsuransi",
//           totalDiskon: "$totalDiskon",
//           totalShiping: "$totalShiping",
//           nilaiCOD: "$nilaiCOD"));
//     });
//   }
// }

//Latian Parse di Bloc
class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
  CalculationBloc() : super(CalculationInitial()) {
    on<CalculationEvent>((event, emit) {
      final nilaiAsuransi = int.parse(event.numberC) * 0.02;
      final totalDiskon = int.parse(event.numberA) ~/ 3;
      final totalShiping = int.parse(event.numberA) - totalDiskon;
      final nilaiCOD = totalShiping + int.parse(event.numberB) + nilaiAsuransi;
      emit(CalculationSuccess(
          nilaiAsuransi: "$nilaiAsuransi",
          totalDiskon: "$totalDiskon",
          totalShiping: "$totalShiping",
          nilaiCOD: "$nilaiCOD"));
    });
  }
}
