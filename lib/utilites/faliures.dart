class Faliure {
  final String errMessage;

  Faliure({required this.errMessage});
}

class ServerFailure extends Faliure {
  ServerFailure({required super.errMessage});
}
