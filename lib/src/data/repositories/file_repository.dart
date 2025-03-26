import 'package:fpdart/fpdart.dart';
import 'package:nave_fp_uol/src/data/data_sources/cdn_data_source.dart';
import 'package:nave_fp_uol/src/domain_models/failures.dart';

class FileRepository {
  FileRepository(
    this._cdnDataSource,
  );

  final CdnDataSource _cdnDataSource;

  Future<Either<Failure, String>> getVideoUrl({
    required String path,
  }) async {
    return _cdnDataSource.getVideoUrl(
      path: path,
    );
  }
}
