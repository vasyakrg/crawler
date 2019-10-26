# crawler CI/CD
[![Build Status]()]()

## Описание:
- terraform поднимает в GCE кластер с двумя пулами:
  - основной (default) пул для развертывания приложений
  - вторичный (service-pool) пул для размещения сервисных приложений (логирование, мониторинг)

## Для запуска нужно:
- иметь учетную записи (и положительный баланс) на [GCP](https://console.cloud.google.com)
- иметь установленный софт по списку:
  - [terraform](https://www.terraform.io/downloads.html) (версия 12.8)
- заполнить `variables` своими данными
- подготовить заранее удаленный `backet` для хранения всех стейтов:
  - закоментить в файле `backend.tf` код
```
  backend "gcs" {
    bucket = "otus-crawler"
    prefix = "backend"
  }
```
пройтись один раз `terraform init && terraform apply` - что бы баккет создался автоматом
далее раскоментировать код в `backend.tf`, что бы и стейт от самого бакета хранился в нем же

# Запускаем
- переходим в ./infra/cluster-1
- заполняем `variables.tf`
- запускаем `terraform init && terraform apply`
кластер поднимается минут 20

## Authors
  * **Vassiliy Yegorov** - [vasyakrg](https://github.com/vasyakrg)
  * **Anton Nechaev** - [flamerior](https://github.com/flamerior)
