import 'package:arsiku/data/model/request/admin/konsultan_request_model.dart';

sealed class KonsultanEvent {}

class FetchKonsultans extends KonsultanEvent {}

class AddKonsultan extends KonsultanEvent {
  final KonsultanRequestModel requestModel;

  AddKonsultan({required this.requestModel});
}

class UpdateKonsultan extends KonsultanEvent {
  final int konsultanId;
  final KonsultanRequestModel requestModel;

  UpdateKonsultan({required this.konsultanId, required this.requestModel});
}

class DeleteKonsultan extends KonsultanEvent {
  final int konsultanId;

  DeleteKonsultan({required this.konsultanId});
}
