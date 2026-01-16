import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:leafy/core/errors/failures.dart';
import 'package:leafy/domain/file_import/entities/file_temporary_object.dart';
import 'package:leafy/domain/file_import/services/file_picker_service.dart';
import 'package:permission_handler/permission_handler.dart';

@LazySingleton(as: FilePickerService)
class FilePickerServiceImpl implements FilePickerService {
  final List<String> _allowedExtensions = ['epub', 'pdf', 'mp3', 'm4a', 'wav'];

  @override
  Future<Either<Failure, List<FileTemporaryObject>>> pickFiles() async {
    // 1. Check Permissions
    final permissionStatus = await _checkPermission();
    if (permissionStatus == PermissionStatus.denied) {
      // Logic from flow: If denied, show Rationale (UI responsible) -> Request.
      // The Service attempts to request if needed.

      final newStatus = await _requestPermission();
      if (!newStatus.isGranted) {
        if (newStatus.isPermanentlyDenied) {
          return const Left(
            Failure.permission(
              'Quyền truy cập bị từ chối vĩnh viễn. Vui lòng cấp quyền trong Cài đặt.',
            ),
          );
        }
        return const Left(Failure.permission('Quyền truy cập bị từ chối.'));
      }
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      return const Left(
        Failure.permission(
          'Quyền truy cập bị từ chối vĩnh viễn. Vui lòng cấp quyền trong Cài đặt.',
        ),
      );
    }

    // 2. Pick Files
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: _allowedExtensions,
        allowMultiple: true,
      );

      if (result == null || result.files.isEmpty) {
        // User cancelled or no files
        return const Left(Failure.unexpected('User cancelled picker'));
      }

      // 3. Validate & Map
      final List<FileTemporaryObject> validFiles = [];

      for (var file in result.files) {
        final path = file.path;
        if (path == null) continue;

        // Double check extension just in case
        final extension = file.extension?.toLowerCase() ?? '';
        if (_allowedExtensions.contains(extension)) {
          validFiles.add(
            FileTemporaryObject(
              path: path,
              name: file.name,
              size: file.size,
              extension: extension,
            ),
          );
        }
      }

      if (validFiles.isEmpty) {
        return const Left(
          Failure.unexpected('Không tìm thấy file hợp lệ nào.'),
        );
      }

      return Right(validFiles);
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  Future<PermissionStatus> _checkPermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        return PermissionStatus.granted;
      }
      return await Permission.storage.status;
    }
    return PermissionStatus.granted;
  }

  Future<PermissionStatus> _requestPermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        return PermissionStatus.granted;
      }
      return await Permission.storage.request();
    }
    return PermissionStatus.granted;
  }
}
