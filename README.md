# Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные: идентификаторы облака, токен доступа. Благодаря .gitignore этот файл не попадёт в публичный репозиторий. Вы можете выбрать иной способ безопасно передать секретные данные в terraform.
3.Сгенерируйте или используйте свой текущий ssh-ключ. Запишите его открытую часть в переменную vms_ssh_root_key.
4. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
5. Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ. Ответ в документации Yandex Cloud.
В качестве решения приложите:

скриншот ЛК Yandex Cloud с созданной ВМ;
скриншот успешного подключения к консоли ВМ через ssh. К OS ubuntu необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address";
ответы на вопросы.
# Решение
![image](https://github.com/Kul-RB/terraform/assets/53901269/a1544d18-09e5-49d1-be4f-4b426452c795)
![image](https://github.com/Kul-RB/terraform/assets/53901269/0d42641a-de60-4ea1-8908-0094c08bff73)
4. Ошибка была в значение platorm_id, вместо standart-v4, нужно написать standard-v1 или больше до v3. platform_id отвечает за процессор который будет использоваться( в standard-v1 используется "Intel® Xeon® Processor E5-2660 v4")  количество ядер для платформы standard-v1 должно быть кратно 2 
5.  preemptible = true - означает является ли экземпляр прерываемым. Это виртуальные машины, которые могут быть принудительно остановлены в любой момент. Прерываемые виртуальные машины доступны по более низкой цене , чем обычные.
core_fraction=5 - показывает уровень производительности виртуальных ЦП. Этот уровень определяет долю вычислительного времени физических ядер, которую гарантирует vCPU.

# Задание 2
1. Изучите файлы проекта.
2. Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
3. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
4. Проверьте terraform plan. Изменений быть не должно.

# Решение
![image](https://github.com/Kul-RB/terraform/assets/53901269/44befec8-e8eb-4983-8f24-0cd3addaba0a)
![image](https://github.com/Kul-RB/terraform/assets/53901269/5c7780c0-15a3-41a1-8b64-87e943f65c08)
![image](https://github.com/Kul-RB/terraform/assets/53901269/84b1d42f-16e2-4794-b153-94b86bc5d4fb)

# Задание 3
1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf').
3. Примените изменения.

# Решение
![image](https://github.com/Kul-RB/terraform/assets/53901269/ba92d05b-a03c-484c-8faa-8dac4ae3d352)
![image](https://github.com/Kul-RB/terraform/assets/53901269/fd9f1131-eda6-469d-9fef-7695329fb0bc)

# Задание 4
Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
Примените изменения.
В качестве решения приложите вывод значений ip-адресов команды terraform output.

# Решение
![image](https://github.com/Kul-RB/terraform/assets/53901269/008d3d8b-1993-477c-8e68-7beb8a494137)

# Задание 5
В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
Замените переменные с именами ВМ из файла variables.tf на созданные вами local-переменные.
Примените изменения.

# Решение
![image](https://github.com/Kul-RB/terraform/assets/53901269/df8ac684-70eb-4ba7-b352-441c996c4167)
![image](https://github.com/Kul-RB/terraform/assets/53901269/1cea1d91-028b-451c-bcc2-08c445cb27db)
![image](https://github.com/Kul-RB/terraform/assets/53901269/42177a7c-c616-4b39-a7ce-e2e817d12307)
![image](https://github.com/Kul-RB/terraform/assets/53901269/81b77f2d-a843-41c5-8057-75e5b5d27eed)

# Задание 6
Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в переменные типа map с именами "vm_web_resources" и "vm_db_resources". В качестве продвинутой практики попробуйте создать одну map-переменную vms_resources и уже внутри неё конфиги обеих ВМ — вложенный map.
Также поступите с блоком metadata {serial-port-enable, ssh-keys}, эта переменная должна быть общая для всех ваших ВМ.
Найдите и удалите все более не используемые переменные проекта.
Проверьте terraform plan. Изменений быть не должно.

![image](https://github.com/Kul-RB/terraform/assets/53901269/b890fc47-4be2-41f0-bcc1-b42ec432e19f)
![image](https://github.com/Kul-RB/terraform/assets/53901269/7736544a-a875-418e-b4ee-8a8aaf2b59ec)
![image](https://github.com/Kul-RB/terraform/assets/53901269/478cc74b-05ef-4179-b929-a6ca7a9d427e)
![image](https://github.com/Kul-RB/terraform/assets/53901269/531b79da-5274-4ac7-8d83-651005a8ea56)

# Задание 7
Изучите содержимое файла console.tf. Откройте terraform console, выполните следующие задания:

Напишите, какой командой можно отобразить второй элемент списка test_list.
Найдите длину списка test_list с помощью функции length(<имя переменной>).
Напишите, какой командой можно отобразить значение ключа admin из map test_map.
Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

# Решение
![image](https://github.com/Kul-RB/terraform/assets/53901269/4a1ab080-7206-476b-8453-54b098afa3e1)




