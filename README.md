# **Furia Fan Verse - Flutter App**

Este é um aplicativo Flutter desenvolvido para fãs da equipe FURIA, com funcionalidades interativas como enquetes, integração com a API da OpenAI e compartilhamento de imagens nos Stories do Instagram.

---

## 🚀 Pré-requisitos

- Flutter SDK (>= 3.6.0)  
- Dart SDK (>= 3.6.0)  
- Git  
- Android Studio **ou** Xcode (para build iOS)

---

## 📦 Clonando o Projeto

```bash
git clone https://github.com/seu_usuario/furia_fan_verse.git
cd furia_fan_verse
```

---

## ⚙️ Configuração Inicial

### 1. Instale as dependências

```bash
flutter pub get
```

### 2. Configure a API da OpenAI

Crie um arquivo `.env` na raiz do projeto com sua chave de API:

```env
OPENAI_API_KEY=sua_chave_da_openai
```

### 3. Verifique os assets no `pubspec.yaml`

Certifique-se de que os assets e o arquivo `.env` estão declarados corretamente:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/
    - .env
```

---

## ▶️ Executando o App

Com tudo configurado, inicie o projeto:

```bash
flutter run
```

> **Nota:** Para testar a funcionalidade de compartilhamento nos Stories, é necessário rodar em um dispositivo físico com o Instagram instalado.

---

## 📁 Estrutura do Projeto

```
lib/
├── main.dart
├── core/
├── features/
├── shared/
└── packages/
```

---

## 🛠️ Tecnologias Utilizadas

- [Provider](https://pub.dev/packages/provider)  
- [Intl](https://pub.dev/packages/intl)  
- [HTTP](https://pub.dev/packages/http)  
- [Flutter Polls](https://pub.dev/packages/flutter_polls)  
- [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv)  
- [Shared Preferences](https://pub.dev/packages/shared_preferences)  
- [Share Plus](https://pub.dev/packages/share_plus)  
- [Path Provider](https://pub.dev/packages/path_provider)  
- [Image](https://pub.dev/packages/image)  
- [Social Share (custom plugin)](/packages/social_share)

---
