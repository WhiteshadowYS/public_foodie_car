import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static const tag = '[FirebaseService]';

  FirebaseService._privateConstructor();

  static final FirebaseService _instance = FirebaseService._privateConstructor();

  static FirebaseService get instance => _instance;

  final databaseReference = FirebaseDatabase.instance.reference();
 /// Работает, слушает только по указанному ключу
  /// Нужно привести в нормальный вид
  void init() async {
    final String key = '1234';
    FirebaseDatabase.instance.reference().onChildChanged.where((event) => event.snapshot.key == key).listen(
      (event) {
        print('$tag ------------- ${event.snapshot.key}: ${event.snapshot.value} ');
      },
    );
  }

}
