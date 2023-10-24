# Задание 1
Возьмите код:
из ДЗ к лекции 4,
из демо к лекции 4.
Проверьте код с помощью tflint и checkov. Вам не нужно инициализировать этот проект.
Перечислите, какие типы ошибок обнаружены в проекте (без дублей).
# Решение
TFLINT:
![image](https://github.com/Kul-RB/terraform/assets/53901269/d95960d8-28ea-40e5-83cb-eae3088ac965)
CHECKOV:
![image](https://github.com/Kul-RB/terraform/assets/53901269/f8ce9501-d036-4f3a-8080-792667616557)

# Задание 2
Возьмите ваш GitHub-репозиторий с выполненным ДЗ 4 в ветке 'terraform-04' и сделайте из него ветку 'terraform-05'.
Повторите демонстрацию лекции: настройте YDB, S3 bucket, yandex service account, права доступа и мигрируйте state проекта в S3 с блокировками. Предоставьте скриншоты процесса в качестве ответа.
Закоммитьте в ветку 'terraform-05' все изменения.
Откройте в проекте terraform console, а в другом окне из этой же директории попробуйте запустить terraform apply.
Пришлите ответ об ошибке доступа к state.
Принудительно разблокируйте state. Пришлите команду и вывод.

# Решение
![image](https://github.com/Kul-RB/terraform/assets/53901269/4f85c6ad-d29e-4545-bc18-3db833876d4a)


![image](https://github.com/Kul-RB/terraform/assets/53901269/da71f6fb-41b7-49e1-b1df-52e05e332e18)

![image](https://github.com/Kul-RB/terraform/assets/53901269/96dcfe7f-d92e-4c53-8bc4-25720b5e5048)

![image](https://github.com/Kul-RB/terraform/assets/53901269/23cd4ab8-adcf-4756-97b0-fe05f32c08b3)

![image](https://github.com/Kul-RB/terraform/assets/53901269/6dd73ce3-3e34-4964-92df-1abf696d15ab)

![image](https://github.com/Kul-RB/terraform/assets/53901269/ce5e6172-408f-4ee9-80e6-be012718968c)

![image](https://github.com/Kul-RB/terraform/assets/53901269/173311a7-e669-47bc-bd96-8524ab02839e)

![image](https://github.com/Kul-RB/terraform/assets/53901269/efe5c1fe-de96-4290-91e8-d94829e3217d)

![image](https://github.com/Kul-RB/terraform/assets/53901269/dedd046f-3abc-4fb4-8a20-3da7c0fb4a0d)

# Задание 3
Сделайте в GitHub из ветки 'terraform-05' новую ветку 'terraform-hotfix'.
Проверье код с помощью tflint и checkov, исправьте все предупреждения и ошибки в 'terraform-hotfix', сделайте коммит.
Откройте новый pull request 'terraform-hotfix' --> 'terraform-05'.
Вставьте в комментарий PR результат анализа tflint и checkov, план изменений инфраструктуры из вывода команды terraform plan.
Пришлите ссылку на PR для ревью. Вливать код в 'terraform-05' не нужно.

# Решение

https://github.com/Kul-RB/terraform/pull/1

# Задание 4

Напишите переменные с валидацией и протестируйте их, заполнив default верными и неверными значениями. Предоставьте скриншоты проверок из terraform console.
type=string, description="ip-адрес" — проверка, что значение переменной содержит верный IP-адрес с помощью функций cidrhost() или regex(). Тесты: "192.168.0.1" и "1920.1680.0.1";
type=list(string), description="список ip-адресов" — проверка, что все адреса верны. Тесты: ["192.168.0.1", "1.1.1.1", "127.0.0.1"] и ["192.168.0.1", "1.1.1.1", "1270.0.0.1"].

# Решение


