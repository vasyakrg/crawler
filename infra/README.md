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
- заполнить `variables.tf` своими данными
- подготовить заранее удаленный `backet` для хранения всех стейтов:
  - закоментить в файле `backend.tf` код

```
  backend "gcs" {
    bucket = "otus-crawler"
    prefix = "backend"
  }
```

- пройтись один раз `terraform init && terraform apply` - что бы баккет создался автоматом
- далее раскоментировать код в `backend.tf`, что бы и стейт от самого бакета хранился в нем же и еще раз пройтись `terraform init && terraform apply`
- на вопрос `Do you want to copy existing state to the new backend?` ответить положительно


# Создаем кластаре k8s
- переходим в ./infra/cluster-1
- заполняем `variables.tf`
- запускаем `terraform init && terraform apply`
кластер поднимается минут 20

# Получаем доступ
- `gcloud container clusters get-credentials cluster-1 --zone europe-west1-b --project vasya-k8s` - будет создан файл конфига в ~/.kube/config
- проверить можно командой `kubectl config get-contexts`

# Устанавливаем Tiller
- создаем учетную запись в кластере - `./infra/tiller-init.sh `
- инициируем tiller - `helm init`
- проверяем, что под с helm поднят - `kubectl get pods --all-namespaces` -  в списке будет поднят `tiller-deploy-xxxxxx`
- проверяем - `helm list ` - должно показать `ничего` и без ошибок

# Создаем ДНС-записи
- идем `cd dns-init/`

## Authors
  * **Vassiliy Yegorov** - [vasyakrg](https://github.com/vasyakrg)
  * **Anton Nechaev** - [flamerior](https://github.com/flamerior)
