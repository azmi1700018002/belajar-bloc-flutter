import 'package:kiriminaja_test/interfaces/example_interface.dart';
import 'package:kiriminaja_test/models/x_models.dart';

/// just a example repository<br/>
/// call the API on repository
class ExampleRepository implements ExampleInterface {
  @override
  Future<Example?> getFirstData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Example(status: true, message: "This is example data");
  }
}
