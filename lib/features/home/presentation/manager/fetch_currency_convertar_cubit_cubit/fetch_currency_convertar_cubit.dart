import 'package:bloc/bloc.dart';
import 'package:currency_converter/features/home/data/repo/home_repo_imp.dart';
import 'package:meta/meta.dart';

part 'fetch_currency_convertar_state.dart';

class FetchCurrencyConvertarCubit extends Cubit<FetchCurrencyConvertarState> {
  FetchCurrencyConvertarCubit() : super(FetchCurrencyConvertarInitial());

    Future<void> fetchCurrencyData() async{
      emit(FetchCurrencyConvertarLoading()) ;
  try {
      List<String> response = await HomeRepoImp().fetchCurrencyRate() ;
      emit(FetchCurrencyConvertarSuccess(lst: response)) ;
  } catch (e) {
  emit(FetchCurrencyConvertarFailure(errMessage: e.toString())) ;
}
  }
}
