import 'package:sort_box/sort_box.dart';
import 'package:test/test.dart';

enum FruitSort {
  alphabetical,
  count,
  price,
}

class Fruit {
  const Fruit(
    this.name,
    this.count, [
    this.price,
  ]);

  final String name;
  final int count;
  final int? price;

  @override
  String toString() => 'Fruit(name: $name, count: $count)';
}

void main() {
  final sortBox = SortBox<FruitSort, Fruit>(
    {
      FruitSort.alphabetical: (fruit) => fruit.name.toLowerCase(),
      FruitSort.count: (fruit) => fruit.count,
      FruitSort.price: (fruit) => fruit.price!,
    },
    {
      FruitSort.alphabetical: {
        (property: FruitSort.count, order: SortBoxOrder.ascending),
      },
      FruitSort.count: {
        (property: FruitSort.alphabetical, order: SortBoxOrder.ascending),
      },
      FruitSort.price: {
        (property: FruitSort.alphabetical, order: SortBoxOrder.descending),
        (property: FruitSort.count, order: SortBoxOrder.ascending),
      },
    },
  );

  group('Primary', () {
    test('Alphabetical', () {
      final fruits = [
        const Fruit('Apple', 1),
        const Fruit('Banana', 2),
        const Fruit('Apple', 3),
        const Fruit('Banana', 4),
        const Fruit('Apple', 5),
      ];
      final sorted = sortBox.sort(fruits, (property: FruitSort.alphabetical, order: SortBoxOrder.ascending));

      for (var i = 0; i < 3; i++) {
        expect(sorted[i].name, 'Apple');
      }
      for (var i = 3; i < 5; i++) {
        expect(sorted[i].name, 'Banana');
      }
    });

    test('Count', () {
      final fruits = [
        const Fruit('Apple', 1),
        const Fruit('Banana', 5),
        const Fruit('Apple', 4),
        const Fruit('Banana', 2),
        const Fruit('Apple', 3),
      ];
      final sorted = sortBox.sort(fruits, (property: FruitSort.count, order: SortBoxOrder.ascending));

      final names = ['Apple', 'Banana', 'Apple', 'Apple', 'Banana'];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].name, names[i]);
      }
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].count, i + 1);
      }
    });
  });

  group('Secondary', () {
    test('Alphabetical', () {
      final fruits = [
        const Fruit('Apple', 1),
        const Fruit('Banana', 2),
        const Fruit('Apple', 2),
        const Fruit('Banana', 1),
        const Fruit('Apple', 2),
      ];
      final sorted = sortBox.sort(fruits, (property: FruitSort.count, order: SortBoxOrder.ascending));

      final names = ['Apple', 'Banana', 'Apple', 'Apple', 'Banana'];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].name, names[i]);
      }

      final counts = [1, 1, 2, 2, 2];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].count, counts[i]);
      }
    });

    test('Count', () {
      final fruits = [
        const Fruit('Apple', 3),
        const Fruit('Banana', 4),
        const Fruit('Apple', 1),
        const Fruit('Banana', 2),
        const Fruit('Apple', 5),
      ];
      final sorted = sortBox.sort(fruits, (property: FruitSort.alphabetical, order: SortBoxOrder.ascending));

      for (var i = 0; i < 3; i++) {
        expect(sorted[i].name, 'Apple');
      }
      for (var i = 3; i < 5; i++) {
        expect(sorted[i].name, 'Banana');
      }
      final counts = [1, 3, 5, 2, 4];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].count, counts[i]);
      }
    });

    test('Primary all equal', () {
      final fruits = [
        const Fruit('Coconut', 1),
        const Fruit('Banana', 1),
        const Fruit('Apple', 1),
        const Fruit('Elderberry', 1),
        const Fruit('Damson', 1),
      ];
      final sorted = sortBox.sort(fruits, (property: FruitSort.count, order: SortBoxOrder.ascending));

      final names = ['Apple', 'Banana', 'Coconut', 'Damson', 'Elderberry'];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].name, names[i]);
      }
    });
  });

  group('Third', () {
    test('Count', () {
      final fruits = [
        const Fruit('Apple', 1, 3),
        const Fruit('Banana', 2, 2),
        const Fruit('Apple', 2, 0),
        const Fruit('Banana', 1, 3),
        const Fruit('Apple', 2, 3),
      ];
      final sorted = sortBox.sort(fruits, (property: FruitSort.price, order: SortBoxOrder.ascending));

      final price = [0, 2, 3, 3, 3];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].price, price[i]);
      }

      final names = ['Apple', 'Banana', 'Banana', 'Apple', 'Apple'];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].name, names[i]);
      }

      final counts = [2, 2, 1, 1, 2];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].count, counts[i]);
      }
    });
  });
}
