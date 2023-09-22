import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalLoadPicturesUseCase implements ILocalLoadPicturesUseCase {
  final ILocalStorage localStorage;

  LocalLoadPicturesUseCase({required this.localStorage});

  String itemKey = 'apod_objects';

  @override
  Future<Either<DomainException, List<PictureEntity>>>
      loadLastTenDaysData() async {
    try {
      final dataResult = await localStorage.fetch(itemKey);
      return dataResult.fold(
        /// Left
        (infraException) {
          return Left(
              DomainException(infraException.errorType.dataError.domainError));
        },

        /// Right
        (localData) {
          if (localData.isEmpty != false) {
            return Left(DomainException(DomainErrorType.unexpected));
          }
          return PictureMapper().fromMapListToEntityList(localData);
        },
      );
    } catch (_) {
      return Left(DomainException(DomainErrorType.unexpected));
    }
  }

  @override
  Future<Either<DomainException, void>> validateLastTenDaysData() async {
    final fetchResult = await localStorage.fetch(itemKey);
    return await fetchResult.fold(
      /// Left
      (infraException) async {
        final deleteResult = await localStorage.delete(itemKey);
        return deleteResult.fold(
          /// Left
          (infraException) {
            return Left(DomainException(
                infraException.errorType.dataError.domainError));
          },

          /// Right
          (_) {
            return const Right(null);
          },
        );
      },

      /// Right
      (data) {
        return const Right(null);
      },
    );
  }

  @override
  Future<Either<DomainException, void>> saveLastTenDaysData(
      List<PictureEntity> pictureEntityList) async {
    final result = PictureMapper().fromEntityListToMapList(pictureEntityList);
    return await result.fold(
      /// Left
      (infraException) {
        return Left(
            DomainException(infraException.errorType.dataError.domainError));
      },

      /// Right
      (mapList) async {
        final saveResult =
            await localStorage.save(key: itemKey, value: mapList);
        return saveResult.fold(
          /// Left
          (infraException) {
            return Left(DomainException(
                infraException.errorType.dataError.domainError));
          },
          (_) {
            /// Right
            return const Right(null);
          },
        );
      },
    );
  }
}
