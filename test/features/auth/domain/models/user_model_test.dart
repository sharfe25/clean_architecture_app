import 'package:clean_architecture_app/features/auth/domain/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    test('should convert to JSON correctly', () {
      const user = UserModel(
        email: 'test@example.com',
        password: '123456',
        name: 'John Doe',
      );

      final json = user.toJson();

      expect(json, {
        'username': 'test@example.com',
        'password': '123456',
        'firstName': 'John Doe',
      });
    });

    test('should create UserModel from JSON', () {
      final json = {
        'email': 'test@example.com',
        'password': '123456',
        'token': 'abc123',
        'name': 'John Doe'
      };

      final user = UserModel.fromJson(json);

      expect(user.email, 'test@example.com');
      expect(user.password, '123456');
      expect(user.token, 'abc123');
      expect(user.name, 'John Doe');
    });

    test('should copyWith return a new instance with updated values', () {
      const user = UserModel(
        email: 'test@example.com',
        password: '123456',
        token: 'abc123',
        name: 'John Doe',
      );

      final updatedUser = user.copyWith(
        email: 'new@example.com',
        token: 'newToken',
      );

      expect(updatedUser.email, 'new@example.com');
      expect(updatedUser.password, '123456'); // Debe mantenerse igual
      expect(updatedUser.token, 'newToken');
      expect(updatedUser.name, 'John Doe'); // Debe mantenerse igual
    });
  });
}
