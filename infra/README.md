# crawler CI/CD
[![Build Status]()]()

## Описание:
- terraform поднимает в GCE кластер с двумя пулами:
  - основной (default) пул для развертывания приложений
  - вторичный (service-pool) пул для размещения сервисных приложений (логирование, мониторинг)

## Для запуска нужно:
- иметь учетную записи (и положительный баланс) на [GCP](https://console.cloud.google.com)
- иметь установленный софт по списку:
  - [terraform](https://www.terraform.io/downloads.html) (версия 11.14)

## Authors
  * **Vassiliy Yegorov** - [vasyakrg](https://github.com/vasyakrg)
  * **Anton Nechaev** - [flamerior](https://github.com/flamerior)
