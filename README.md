# crawler CI/CD

## Проект реализует непрерывную поставку и деплой кода на кластер k8s
- в качестве приложения выбрано решение - Поисковый бот для сбора текстовой информации с веб-страниц и ссылок

## Описание инфраструктуры
- основная платформа k8s в GCP - более подробно [тут](infra/README.md)

# Описание мониторинга и логирования
- более подробно [тут](maintenance/README.md)

## Описание приложения
- Поисковый бот состоит из двух миккросервисов - более подробно [тут](src/README.md)

# Логика работы
- проходим весь квест по [инфре](infra/README.md)
- проходим в [гитлаб](https://gitlab.tfm.zone), создаем группу проектов `crawler`, создаем проекты `app`, `ui`, `deploy`
- выгружаем репозитории `src/app` > `app`, `src/ui` > `ui`, `/` > `deploy`
- далее, при работы с репами `app` и `ui` при пуше, будут собираться чарты и происходить авторедеплой на созданный ранее кластер
  - для этого необходимо в репе `deploy` создать Pipeline trigger и прописать созданный токен в файлах gitlab-ci.yml в репах `app` и `ui`
- приложение должно быть доступно по `crawler.<youdomain>`, в нашем случае на нашем кластере оно торчит на `crawler.tfm.zone`


## Authors
  * **Vassiliy Yegorov** - [vasyakrg](https://github.com/vasyakrg)
  * **Anton Nechaev** - [flamerior](https://github.com/flamerior)
