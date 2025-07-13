import 'package:arsiku/presentation/admin/konsultan/konsultan_event.dart';
import 'package:arsiku/presentation/admin/konsultan/konsultan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arsiku/data/repository/konsultan_repository.dart';


class KonsultanBloc extends Bloc<KonsultanEvent, KonsultanState> {
  final KonsultanRepository konsultanRepository;

  KonsultanBloc({required this.konsultanRepository})
    : super(KonsultanInitial()) {
    on<FetchKonsultans>(_onFetchKonsultans);
    on<AddKonsultan>(_onAddKonsultan);
    on<UpdateKonsultan>(_onUpdateKonsultan);
    on<DeleteKonsultan>(_onDeleteKonsultan);
  }

  // Mengambil daftar konsultan
  Future<void> _onFetchKonsultans(
    FetchKonsultans event,
    Emitter<KonsultanState> emit,
  ) async {
    emit(KonsultanLoading());
    final result = await konsultanRepository.getKonsultans();
    result.fold(
      (error) => emit(KonsultanError(message: error)),
      (konsultans) => emit(KonsultanListLoaded(konsultans: konsultans)),
    );
  }

  // Menambahkan konsultan baru
  Future<void> _onAddKonsultan(
    AddKonsultan event,
    Emitter<KonsultanState> emit,
  ) async {
    emit(KonsultanLoading());
    final result = await konsultanRepository.addKonsultan(event.requestModel);
    result.fold((error) async => emit(KonsultanError(message: error)), (
      _,
    ) async {
      final fetchResult = await konsultanRepository.getKonsultans();
      fetchResult.fold(
        (error) => emit(KonsultanError(message: error)),
        (konsultans) => emit(KonsultanListLoaded(konsultans: konsultans)),
      );
    });
  }

  // Memperbarui data konsultan
  Future<void> _onUpdateKonsultan(
    UpdateKonsultan event,
    Emitter<KonsultanState> emit,
  ) async {
    emit(KonsultanLoading());
    final result = await konsultanRepository.updateKonsultan(
      event.konsultanId,
      event.requestModel,
    );
    result.fold(
      (error) async {
        emit(KonsultanError(message: error));
      },
      (_) async {
        emit(KonsultanUpdated());
        final fetchResult = await konsultanRepository.getKonsultans();
        fetchResult.fold(
          (error) => emit(KonsultanError(message: error)),
          (konsultans) => emit(KonsultanListLoaded(konsultans: konsultans)),
        );
      },
    );
  }

  // Menghapus konsultan
  Future<void> _onDeleteKonsultan(
    DeleteKonsultan event,
    Emitter<KonsultanState> emit,
  ) async {
    final result = await konsultanRepository.deleteKonsultan(event.konsultanId);
    result.fold(
      (error) => emit(KonsultanError(message: error)),
      (_) => emit(KonsultanDeleted()),
    );
  }
}
