abstract class UserCase<Type> {
  Future<Type> invoke();
}
