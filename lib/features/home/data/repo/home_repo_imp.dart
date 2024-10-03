import 'package:currency_converter/core/utilts/api_services.dart';
import 'package:currency_converter/features/home/data/repo/home_repo.dart';

class HomeRepoImp implements HomeRepo{
  @override
  Future<List<String>> fetchCurrencyRate()async {
    
    try {
  final response = await ApiServices().get(endPoint: "USD") ;
  final rates = response["rates"] as Map<String , dynamic> ;
  return rates.keys.toList();
}  catch (e) {
  throw Exception('Failed to fetch currency rates');
}
  }
 

  
}

