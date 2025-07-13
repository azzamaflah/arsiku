import 'dart:convert';

import 'package:arsiku/data/model/respone/konsultan_response.dart';
import 'package:dartz/dartz.dart';
import 'package:arsiku/data/model/request/admin/konsultan_request_model.dart';
import 'package:arsiku/service/service_http_client.dart';

class KonsultanRepository {
  final ServiceHttpClient _serviceHttpClient;

  KonsultanRepository(this._serviceHttpClient);

  // Mendapatkan daftar konsultan
  Future<Either<String, AddKonsultanResponseModel>> getKonsultans() async {
    try {
      final response = await _serviceHttpClient.get('konsultans');
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final AddKonsultanResponseModel allKonsultansResponse =
            AddKonsultanResponseModel.fromJson(jsonResponse);
        return Right(allKonsultansResponse);
      } else {
        final jsonResponse = json.decode(response.body);
        return Left(
          jsonResponse['message'] ?? 'Gagal memuat daftar konsultan.',
        );
      }
    } catch (e) {
      return Left('Terjadi kesalahan saat memuat konsultan: ${e.toString()}');
    }
  }

  // Mendapatkan detail konsultan berdasarkan ID
  Future<Either<String, Konsultan>> getKonsultanById(String konsultanId) async {
    try {
      final response = await _serviceHttpClient.get('konsultans/$konsultanId');
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final Konsultan konsultanResponse = Konsultan.fromJson(jsonResponse);
        return Right(konsultanResponse);
      } else {
        final jsonResponse = json.decode(response.body);
        return Left(
          jsonResponse['message'] ?? 'Gagal memuat detail konsultan.',
        );
      }
    } catch (e) {
      return Left(
        'Terjadi kesalahan saat memuat detail konsultan: ${e.toString()}',
      );
    }
  }

  // Menambahkan konsultan baru
  Future<Either<String, AddKonsultanResponseModel>> addKonsultan(
    KonsultanRequestModel request,
  ) async {
    try {
      final response = await _serviceHttpClient.post(
        'admin/konsultans',
        request.toMap(),
      );
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 201) {
        final AddKonsultanResponseModel addKonsultanModel =
            AddKonsultanResponseModel.fromJson(jsonResponse);
        return Right(addKonsultanModel);
      } else {
        final jsonResponse = json.decode(response.body);
        return Left(jsonResponse['message'] ?? 'Gagal menambahkan konsultan.');
      }
    } catch (e) {
      return Left(
        'Terjadi kesalahan saat menambahkan konsultan: ${e.toString()}',
      );
    }
  }

  // Memperbarui data konsultan
  Future<Either<String, UpdateKonsultanResponseModel>> updateKonsultan(
    int konsultanId,
    KonsultanRequestModel request,
  ) async {
    try {
      final response = await _serviceHttpClient.put(
        'admin/konsultans/$konsultanId',
        request.toMap(),
      );
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        final UpdateKonsultanResponseModel updateKonsultanModel =
            UpdateKonsultanResponseModel.fromJson(jsonResponse);
        return Right(updateKonsultanModel);
      } else {
        final jsonResponse = json.decode(response.body);
        return Left(jsonResponse['message'] ?? 'Gagal memperbarui konsultan.');
      }
    } catch (e) {
      return Left(
        'Terjadi kesalahan saat memperbarui konsultan: ${e.toString()}',
      );
    }
  }

  // Menghapus konsultan
  Future<Either<String, DeleteKonsultanResponseModel>> deleteKonsultan(
    int konsultanId,
  ) async {
    try {
      final response = await _serviceHttpClient.delete(
        'admin/konsultans/$konsultanId',
      );
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        final DeleteKonsultanResponseModel deleteKonsultanModel =
            DeleteKonsultanResponseModel.fromJson(jsonResponse);
        return Right(deleteKonsultanModel);
      } else {
        final jsonResponse = json.decode(response.body);
        return Left(jsonResponse['message'] ?? 'Gagal menghapus konsultan.');
      }
    } catch (e) {
      return Left(
        'Terjadi kesalahan saat menghapus konsultan: ${e.toString()}',
      );
    }
  }
}
