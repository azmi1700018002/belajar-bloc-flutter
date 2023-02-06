part of 'x_widgets.dart';

/// createdby Daewu Bintara
/// Sunday, 04/12/22 22:08
/// Enjoy coding ☕

class CalculationForm extends StatefulWidget {
  const CalculationForm({Key? key}) : super(key: key);
  // static final TextEditingController _controllerNumberA =
  //     TextEditingController();
  // static final TextEditingController _controllerNumberB =
  //     TextEditingController();
  // static final TextEditingController _controllerNumberC =
  //     TextEditingController();

  @override
  State<CalculationForm> createState() => _CalculationFormState();
}

class _CalculationFormState extends State<CalculationForm> {
  final TextEditingController _controllerNumberA = TextEditingController();
  final TextEditingController _controllerNumberB = TextEditingController();
  final TextEditingController _controllerNumberC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Calculation Form", style: Theme.of(context).textTheme.titleLarge),

        // TODO : refactor this widget style and use this field for input shipping price e.g: 1000 in rupiah
        TextFormField(
          controller: _controllerNumberA,
          decoration: const InputDecoration(labelText: 'Nilai Shipping'),
          keyboardType: TextInputType.number,
        ),

        // TODO : refactor this widget style and use this field for input discount amount e.g: 1000 in rupiah
        TextFormField(
          controller: _controllerNumberB,
          decoration: const InputDecoration(labelText: 'Nilai Diskon'),
          keyboardType: TextInputType.number,
        ),

        // TODO : refactor this widget style and use this field for input discount amount e.g: 1000 in rupiah
        TextFormField(
          controller: _controllerNumberC,
          decoration: const InputDecoration(labelText: 'Harga Barang'),
          keyboardType: TextInputType.number,
        ),

        const SizedBox(height: 10.0),

        // TODO : refactor this widget and set action onPressed to calculate value from above fields
        ElevatedButton(
          child: const Text('Hitung'),
          onPressed: () {
            //Parse UI
            // int numberA =
            //     int.parse(CalculationForm._controllerNumberA.text.toString());
            // int numberB =
            //     int.parse(CalculationForm._controllerNumberB.text.toString());
            // int numberC =
            //     int.parse(CalculationForm._controllerNumberC.text.toString());

            // context
            //     .read<CalculationBloc>()
            //     .add(CalculationEvent(numberA, numberB, numberC));

            context.read<CalculationBloc>().add(CalculationEvent(
                  numberA: _controllerNumberA.text.toString(),
                  numberB: _controllerNumberA.text.toString(),
                  numberC: _controllerNumberA.text.toString(),
                ));
          },
        ),
      ],
    );
  }
}
