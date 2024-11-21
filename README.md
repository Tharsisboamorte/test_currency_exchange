### **Aplicativo de Taxa de Câmbio BRL**

Um aplicativo Flutter projetado para converter Reais (BRL) para qualquer moeda inserida pelo usuário, garantindo taxas de câmbio precisas e exibição de dados históricos. O aplicativo segue os princípios de **Clean Architecture**, proporcionando um código escalável e de fácil manutenção.

---

## **Funcionalidades**
- Converter BRL para qualquer moeda válida inserida pelo usuário.
- Validar códigos de moedas dinamicamente usando a biblioteca `sealed_currencies`.
- Exibir taxas de câmbio atuais em tempo real.
- Mostrar taxas de câmbio históricas dos últimos 30 dias em um widget expansível.
- UI intuitiva e responsiva com animações dinâmicas.
- Tratamento de erros para entradas inválidas e problemas de rede.

---

## **Tecnologias Utilizadas**
- **flutter_bloc**: para gerenciamento de estado (arquitetura Cubit/Bloc).
- **sealed_currencies**: para validação de moedas.
- **Dio**: para requisições HTTP e obtenção de taxas de câmbio.
- **intl**: para formatação de datas e números.
- **Clean Architecture**: para garantir modularidade e escalabilidade.


[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
