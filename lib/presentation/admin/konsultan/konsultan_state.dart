
import 'package:arsiku/data/model/respone/konsultan_response.dart';

sealed class KonsultanState {}

class KonsultanInitial extends KonsultanState {}

class KonsultanLoading extends KonsultanState {}

class KonsultanListLoaded extends KonsultanState {
  final AddKonsultanResponseModel konsultans;

  KonsultanListLoaded({required this.konsultans});
}

class KonsultanAdded extends KonsultanState {
  final Konsultan konsultan;

  KonsultanAdded({required this.konsultan});
}

class KonsultanUpdated extends KonsultanState {}

class KonsultanDeleted extends KonsultanState {}

class KonsultanError extends KonsultanState {
  final String message;

  KonsultanError({required this.message});
}
