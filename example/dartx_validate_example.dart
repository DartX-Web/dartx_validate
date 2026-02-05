import 'package:dartx_validate/dartx_validate.dart';

class User {
  @Email()
  final String email;

  @MinLength(2)
  @MaxLength(100)
  @NotEmptyString()
  final String name;

  @Min(0)
  @Max(100)
  final int age;

  @Positive()
  final int id;

  @NotEmptyList()
  @Unique()
  final List<String> roles;

  User(this.name, this.email, this.age, this.id, this.roles);
}

void main() {
  final user = User('John Doe', 'john.doe@example.com', 30, 1, [
    'admin',
    "user",
    "admin",
  ]);

  if (validate(user)) {
    print("OK");
  } else {
    print("Validation failed");
  }
}
