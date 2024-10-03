part of 'fetch_currency_convertar_cubit.dart';

@immutable
sealed class FetchCurrencyConvertarState {}

final class FetchCurrencyConvertarInitial extends FetchCurrencyConvertarState {}
final class FetchCurrencyConvertarLoading extends FetchCurrencyConvertarState {}
final class FetchCurrencyConvertarSuccess extends FetchCurrencyConvertarState {
  final List<String> lst ;

  FetchCurrencyConvertarSuccess({required this.lst});
}
final class FetchCurrencyConvertarFailure extends FetchCurrencyConvertarState {
  final String errMessage ;
  
  FetchCurrencyConvertarFailure({required this.errMessage});
}
