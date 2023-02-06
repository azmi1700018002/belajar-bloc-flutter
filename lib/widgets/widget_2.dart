part of 'x_widgets.dart';

/// createdby Daewu Bintara
/// Sunday, 04/12/22 16:13
/// Enjoy coding ☕

class Widget2 extends StatelessWidget {
  const Widget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        children: [
          Text("Widget 2",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: 10.0),

          // TODO : please refactor value of this widget from bloc/cubit
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text('Increment Total :  $state',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center);
            },
          ),

          const SizedBox(height: 10.0),

          // TODO : add action to increment value of Increment Total with implemented bloc/cubit
          ElevatedButton(
            child: const Text("Increment"),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
        ],
      ),
    );
  }
}
