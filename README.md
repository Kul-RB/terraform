# Задание 1
1. Возьмите из демонстрации к лекции готовый код для создания ВМ с помощью remote-модуля.
2. Создайте одну ВМ, используя этот модуль. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} . Воспользуйтесь примером. Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды sudo nginx -t.

# Решение
2. В файле [cloud-init.yml](https://github.com/Kul-RB/terraform/blob/12880230569e64b04fec8e4d98fac5c629d551ba/cloud-init.yml)https://github.com/Kul-RB/terraform/blob/12880230569e64b04fec8e4d98fac5c629d551ba/cloud-init.yml изменили
   - строку с хардкод ключом поменяли на переменную ssh_authorized_keys:- ${ssh_public_key}. Переменную создали в файле  https://github.com/Kul-RB/terraform/blob/12880230569e64b04fec8e4d98fac5c629d551ba/locals.tf.
   - добавили установку nginx runcmd: - apt install nginx -y

В файле https://github.com/Kul-RB/terraform/blob/12880230569e64b04fec8e4d98fac5c629d551ba/main.tf поменяли:
   - строку "instance_count" = 2 => "instance_count" = 1
   - добавили строку vars = { ssh_public_key = local.public_key } в data.template_file

![image](https://github.com/Kul-RB/terraform/assets/53901269/efd071a8-213a-4788-82cc-07ae6ef5da2c)

# Задание 2
1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: одну сеть и одну подсеть в зоне, объявленной при вызове модуля, например: ru-central1-a.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev
4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.vpc_dev.
6. Сгенерируйте документацию к модулю с помощью terraform-docs.

# Решение
![image](https://github.com/Kul-RB/terraform/assets/53901269/b7775a1e-c07a-4b03-b7c9-ef10ce03d679)
Сформированная документация https://github.com/Kul-RB/terraform/blob/bc52f289a15b8559fc2d88b57fe056d032e26293/docs.md

# Задание 3
1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Изменений быть не должно. Приложите список выполненных команд и скриншоты процессы.

# Решение
1. ![image](https://github.com/Kul-RB/terraform/assets/53901269/59566d7b-edcf-4fe9-ab8f-4f8e650da17f)

2,3. ![image](https://github.com/Kul-RB/terraform/assets/53901269/aa7b0a2a-363c-4e88-a88c-39a3f86a3168)

4. ![image](https://github.com/Kul-RB/terraform/assets/53901269/c2403656-75d5-4325-b93b-8fb77d2a4196)

![image](https://github.com/Kul-RB/terraform/assets/53901269/1763f13d-ef6a-40d8-a2ae-54bec06b76e2)

![image](https://github.com/Kul-RB/terraform/assets/53901269/3adc590c-fdaf-48e3-a62f-be4a5f17cd4d)

![image](https://github.com/Kul-RB/terraform/assets/53901269/aba0b403-ff56-449b-b386-942e720e9620)

terraform plan все равное выдает изменение 
![image](https://github.com/Kul-RB/terraform/assets/53901269/2337292a-5d94-4278-ad6f-4977e38b2ec6)

# Задание 4
Измените модуль vpc так, чтобы он мог создать подсети во всех зонах доступности, переданных в переменной типа list(object) при вызове модуля.

# Решение
![image](https://github.com/Kul-RB/terraform/assets/53901269/6ebb4e34-ec91-462a-ad31-f501f3497633)

# Задание 5
1. Напишите модуль для создания кластера managed БД Mysql в Yandex Cloud с одним или тремя хостами в зависимости от переменной HA=true или HA=false. Используйте ресурс yandex_mdb_mysql_cluster: передайте имя кластера и id сети.
2. Напишите модуль для создания базы данных и пользователя в уже существующем кластере managed БД Mysql. Используйте ресурсы yandex_mdb_mysql_database и yandex_mdb_mysql_user: передайте имя базы данных, имя пользователя и id кластера при вызове модуля.
3. Используя оба модуля, создайте кластер example из одного хоста, а затем добавьте в него БД test и пользователя app. Затем измените переменную и превратите сингл хост в кластер из 2-х серверов.
4. Предоставьте план выполнения и по возможности результат. Сразу же удаляйте созданные ресурсы, так как кластер может стоить очень дорого. Используйте минимальную конфигурацию.
# Решение
