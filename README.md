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
