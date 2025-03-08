import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_figma/main.dart'; // Importe o arquivo principal

void main() {
  testWidgets('Teste de renderização da CalculadoraApp', (WidgetTester tester) async {
    // Executa o widget CalculadoraApp
    await tester.pumpWidget(CalculadoraApp());

    // Verifica se o texto "Calculadora" está presente na AppBar
    expect(find.text('Calculadora'), findsOneWidget);

    // Verifica se o display inicial "0" está presente
    expect(find.text('0'), findsOneWidget);

    // Verifica se os botões numéricos estão presentes
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Verifica se os botões de operação estão presentes
    expect(find.text('+'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text('÷'), findsOneWidget);
    expect(find.text('='), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.text('%'), findsOneWidget);
    expect(find.text('+/-'), findsOneWidget);
  });
}