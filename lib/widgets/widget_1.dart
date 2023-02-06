part of 'x_widgets.dart';

/// createdby Daewu Bintara
/// Sunday, 04/12/22 16:13
/// Enjoy coding ☕

class Widget1 extends StatelessWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade100,
      alignment: Alignment.center,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        children: [
          Text("Widget 1",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const SizedBox(height: 10.0),
          Text("Count of dismissed photos screen",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center),
          const SizedBox(height: 10.0),

          // TODO : please refactor value of this widget from bloc/cubit
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text('Total : $state',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center);
            },
          ),

          const SizedBox(height: 10.0),
          ElevatedButton(
            child: const Text("Open photos screen"),
            onPressed: () {
              // TODO : add action to increment `Total` after disposed [PhotosScreen]
              Navigator.of(context).pushNamed(PhotosScreen.routeName);
              context.read<CounterCubit>().increment();
            },
          ),
          const SizedBox(height: 15.0),
          const Divider(color: Colors.black),
          const SizedBox(height: 15.0),
          Text("Increment value on Widget 2",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center),

          // TODO : add action on [onPressed] method of this widget to increment value on [Widget2] with implemented bloc/cubit
          ElevatedButton(
            child: const Text("Increment widget 2"),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),

          const SizedBox(height: 15.0),
          const Divider(color: Colors.black),
          const SizedBox(height: 15.0),

          // TODO : add action on [onPressed] method of this widget to open new screen. new screen must be created to handle calculation
          ElevatedButton(
            child: const Text("Open calculation screen"),
            onPressed: () =>
                Navigator.of(context).pushNamed(CalculationScreen.routeName),
          ),
        ],
      ),
    );
  }
}
