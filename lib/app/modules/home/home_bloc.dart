import 'package:controle_mensal/app/modules/home/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Disposable {
  final repository = Modular.get<HomeRepository>();

  final BehaviorSubject<List> fetchStream = BehaviorSubject<List>();

  Future getData() async {
    await repository.getData();
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    fetchStream.stream.drain();
  }
}
