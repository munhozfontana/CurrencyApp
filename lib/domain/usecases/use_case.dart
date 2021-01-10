import 'package:conversor_moedas/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

mixin UseCase<Type, Params> {
  Future<Either<Failure, Object>> call(Params params);
}
