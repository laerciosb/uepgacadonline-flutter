# App Flutter - Universidade Estadual de Ponta Grossa (não oficial).

Aplicativo desenvolvido para complementar o projeto do crawler: [https://github.com/pstwh/uepgacadonline-api](https://github.com/pstwh/uepgacadonline-api).

O objetivo desse projeto é beneficiar a comunidade acadêmica disponibilizando os dados de maneira portátil.
Todos os dados utilizados nesse aplicativo são extraídos de páginas web da universidade, sendo assim dados públicos.

Uma das características desse projeto é que ele é **open source**, ou seja, todos podem estudar a maneira a qual foi feito e contribuir para melhorar cada vez mais a plataforma.

A versão 0.1 estará em breve em ambas lojas.

# Sobre

## Linguagem/Plataforma

O aplicativo foi desenvolvido utilizando a plataforma open source Flutter, do google. A plataforma Flutter por consequência utiliza a linguagem Dart.

Podem ser consultados nos links a seguir:
[https://flutter.dev/](https://flutter.dev/)
[https://dart.dev/](https://dart.dev/)

Todos manuais de instalação e configuração se encontram no site.

## Estrutura/Arquitetura do Projeto

O projeto utiliza a arquitetura BLoC apresentada pelo google no I/O de 2018.
[https://www.youtube.com/watch?v=RS36gBEp8OI](https://www.youtube.com/watch?v=RS36gBEp8OI)

Foi utilizado o pacote flutter_bloc, para auxiliar na implementação.
[https://github.com/felangel/bloc](https://github.com/felangel/bloc).

A estruturação dos arquivos na versão atual (v0.1) está:
- **Database** (provider de acesso ao banco de dados).
- **Enums** (enums do projeto).
- **Helpers** (funções em geral para auxílio, pode ser refatorado para uma alternativa de extensions).
- **Models** (modelos do projeto, foi utilizado o pacote json_annotation para geração de código: [https://flutter.dev/docs/development/data-and-backend/json#serializing-json-using-code-generation-libraries](https://flutter.dev/docs/development/data-and-backend/json#serializing-json-using-code-generation-libraries)
- **Modules** (todos os módulos do projeto, nessa estrutura temos a implementação base da arquitetura BLoC com auxílio do pacote bloc/flutter_bloc).
- **Repositories** (centralizador de dados, pode e deve ser refatorado).
- **Services** (requisições de acesso externo de dados, ou seja, requisições a 'api' - também deve ser refatorado).
- Widgets (alguns widgets utilizados no projeto).

Todo o projeto tem centenas de questões que podem ser refatoradas. Isso ocorre devido ao tempo de implementação e lançamento da primeira versão.

# Imagens

## Android
<div style="float: left;">
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-1.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-2.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-3.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-4.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-5.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-6
.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-7.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-8.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-9.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-10.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-11.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/android/android-12.png" width="200"/>
</div>

## iOS
<div style="float: left;">
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-1.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-2.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-3.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-4.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-5.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-6
.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-7.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-8.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-9.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-10.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-11.png" width="200"/>
<img src="https://raw.githubusercontent.com/pstwh/uepgacadonline-flutter/master/prints/ios/ios-12.png" width="200"/>
</div>


#

