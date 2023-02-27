Установка и запуск
------------------

* Скопировать и установить

    ```
    $ git clone https://github.com/PolyakovEvg/food_delivery
    $ cd food_delivery
    $ bundle install
    ```

* Создать конфиг для своих настроек бд (`config/database.yml`)
		
* Создать базу данных и загрузить схему базы данных

	```
	rails db:setup
	```
* Заполнить базу

    ```
    $ rails db:seed (из файла 'menu.yml')
    ```

* Запустить сервер и открыть в браузере

* JSON запрос url: 'localhost:3000/orders.json'