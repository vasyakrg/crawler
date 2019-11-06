# Мониторинг
## Поднимаем
```
kubectl create namespace monitoring
helm install monitoring/mon --name monitoring --namespace monitoring
```
основан на prometheus и grafana 

собираются метрики кластера и приложения и есть пара предустановленных дашбордов в графане

# Логирование
## Поднимаем
```
kubectl create namespace logging
helm install logging/efk --name efk --namespace logging
```

fluent daemonset собирает логи, отсылает в еластик и в кибане можно их посмотреть
