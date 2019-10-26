# crawler CI/CD
[![Build Status]()]()

## Проект реализует непрерывную поставку и деплой кода на кластер k8s
- в качестве приложения выбрано решение - Поисковый бот для сбора текстовой информации с веб-страниц и ссылок

## Описание инфраструктуры
- основная платформа k8s в GCP - более подробно [тут](infra/README.md)

## Описание приложения
- Поисковый бот состоит из двух миккросервисов - более подробно [тут](src/README.md)

## Доступы
- основное приложение размещено в - http://crawler.tfm.zone
- rabbitMQ - http://34.76.203.176:32345/#/ (login - user, пароль берется из секретов rmq-user-secret/rmqu-password)

## Authors
  * **Vassiliy Yegorov** - [vasyakrg](https://github.com/vasyakrg)
  * **Anton Nechaev** - [flamerior](https://github.com/flamerior)
