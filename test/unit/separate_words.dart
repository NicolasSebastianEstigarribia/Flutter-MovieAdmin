import 'package:flutter_test/flutter_test.dart';
import 'package:movie_admin/utils/functions.dart';

void separateWordsUnitTest() {
  test('Separate words from comma-separated string', () {
    // Arrange
    String inputString = 'apple, banana, orange';

    // Act
    List<String> result = separateWords(inputString);

    // Assert
    expect(result, equals(['apple', 'banana', 'orange']));
  });

  test('Empty string should return an empty list', () {
    // Arrange
    String inputString = '';

    // Act
    List<String> result = separateWords(inputString);

    // Assert
    expect(result, isEmpty);
  });

  test('String with no commas should return a single-item list', () {
    // Arrange
    String inputString = 'hello';

    // Act
    List<String> result = separateWords(inputString);

    // Assert
    expect(result, equals(['hello']));
  });

  test('String with leading/trailing spaces should trim the words', () {
    // Arrange
    String inputString = ' apple ,  banana ,orange  ';

    // Act
    List<String> result = separateWords(inputString);

    // Assert
    expect(result, equals(['apple', 'banana', 'orange']));
  });

}
