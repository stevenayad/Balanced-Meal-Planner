import 'package:orderapp/Features/OrderMeal/data/Models/Inputordermodel.dart';
import 'package:orderapp/Services/ApiServices.dart';

class OrderServices {
  final Apiservice apiservice = Apiservice();

  Future<bool> makeOrder(Inputordermodel inputordermodel) async {
    try {
      final response = await apiservice.post(body: inputordermodel.toJson());


      final result = response.data['result'] == true;
      print('Order result: $result');
      return result;
    } catch (e) {
      print('Failed to make order: $e');
      return false;
    }
  }
}
