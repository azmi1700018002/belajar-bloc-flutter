part of 'x_widgets.dart';

/// createdby Daewu Bintara
/// Sunday, 04/12/22 22:39
/// Enjoy coding ☕

class CalculationResult extends StatelessWidget {
  const CalculationResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Calculation Result",
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 15.0),
        // TODO : refactor this widget and replace this value from result calculation bloc/cubit
        Align(
          alignment: Alignment.centerLeft,
          child: BlocBuilder<CalculationBloc, CalculationState>(
            builder: (context, state) {
              if (state is CalculationInitial) {
                return const Text('Nilai Asuransi :  -');
              } else if (state is CalculationSuccess) {
                return Text('Nilai Asuransi :  ${state.nilaiAsuransi}');
              } else {
                return Container();
              }
            },
          ),
        ),
        //       // TODO : refactor this widget and replace this value from result calculation bloc/cubit
        const SizedBox(height: 15.0),
        Align(
          alignment: Alignment.centerLeft,
          child: BlocBuilder<CalculationBloc, CalculationState>(
            builder: (context, state) {
              if (state is CalculationInitial) {
                return const Text('Total Diskon :  -');
              } else if (state is CalculationSuccess) {
                return Text('Total Diskon :  ${state.totalDiskon}');
              } else {
                return Container();
              }
            },
          ),
        ),
        const SizedBox(height: 15.0),
        // TODO : refactor this widget and replace this value from result calculation bloc/cubit
        Align(
          alignment: Alignment.centerLeft,
          child: BlocBuilder<CalculationBloc, CalculationState>(
            builder: (context, state) {
              if (state is CalculationInitial) {
                return const Text('Total Shipping :  -');
              } else if (state is CalculationSuccess) {
                return Text('Total Shipping :  ${state.totalShiping}');
              } else {
                return Container();
              }
            },
          ),
        ),
        const SizedBox(height: 15.0),
        // TODO : refactor this widget and replace this value from result calculation bloc/cubit
        Align(
          alignment: Alignment.centerLeft,
          child: BlocBuilder<CalculationBloc, CalculationState>(
            builder: (context, state) {
              if (state is CalculationInitial) {
                return const Text('Nilai COD :  -');
              } else if (state is CalculationSuccess) {
                return Text('Nilai COD :  ${state.nilaiCOD}');
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
