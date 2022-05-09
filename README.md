> # devnology

Flutter app for devnology test

> ## Usage
#### Installation
```bash
$ fvm flutter pub get
```
#### Run tests
```bash
$ fvm flutter test
```
#### Run app in device
```bash
$ fvm flutter run
```
### Development
#### Build stores
```bash
$ fvm flutter packages pub run build_runner watch --delete-conflicting-outputs
```

> ## Features
* LocalStorage with Hive
* Reactive programming with Mobx
* Modular Design Pattern in Presenters with Flutter Modular
* Tests with Flutter Tests


> ## Principles
* Single Responsibility Principle (SRP)
* Open Closed Principle (OCP)
* Liskov Substitution Principle (LSP)
* Interface Segregation Principle (ISP)
* Dependency Inversion Principle (DIP)
* Separation of Concerns (SOC)

> ## Design Patterns
* Factory
* Adapter
* Dependency Injection
* Singleton
* Functional reactive programming (FRP) 

> ## Methodologies and Designs
* TDD
* Clean Architecture
* Modular Design 
* Usecases

> ## Tests Features
* Testes Unitários
* Mocks
* Stubs

> ## Libs
* Mobx
* Flutter Modular
* Hive
* Caroulsel Slider
* Share plus
> ### Global libs
* Slidy
* Fvm

## Estrutura de arquivos
```shell
  $ tree
  .
  ├── src/
  │   └── core/                             # camada nucleo da aplicacao contem camadas de infra e dominio
  │   └── app/                              # camada da aplicavao visual (presenter)
  │       └── modules/                      # pasta que contem modulos
  │       └── shared/                       # pasta que compartilha arquivos entre os modulos
  │   └── main.dart                         # arquivo que inicia o app
  │   └── add_dev_products.dart             # arquivo que adiciona produtos de teste de dev
  ├── README.md                             # este arquivo com a descricao do projeto
  └── test/                                 # pasta com arquivos de teste
```
