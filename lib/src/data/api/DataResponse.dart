
sealed class DataResponse<T> {
  const DataResponse();
}

class DataSuccess<T> extends DataResponse<T> {
  final T data;
  const DataSuccess({required this.data});
}
class DataError<T> extends DataResponse<T> {
  final String exception;
  const DataError({required this.exception});
}