import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:reddist_clone_app/core/faliure.dart';

typedef FutureEither<T> = Future<Either<Faliure, T>>;
typedef FutureVoid = FutureEither<void>;
