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
