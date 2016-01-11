# u12pytpls

Shippable CI image for Python on Ubuntu 12.04. Available python versions:

1. 2.6
2. 2.7 
3. 3.2
4. 3.3
5. 3.4
6. 3.5

Available Services :

1. Elasticsearch 1.5
2. Memcached 1.4
3. Mongodb 3.0
4. MySQL 5.6
5. Postgres 9.4
6. RabbitMQ 3.5
7. Redis 3.0
8. Selenium 2.45
9. Sqllite 3

## How to use
You can use this image to run python builds on Shippable. Just update your
`shippable.yml` file and add the `build_image` directive. You should also
activate the appropriate virtual envrionment so your build runs against the
correct version of python. The python versions you specify in the `python`
directive in the YML will be available in the `$PYTHON_VERSION` environment
variable. Here's a sample YML file to get you going:

````
language: python
python:
  - 2.6
  - 2.7
  - 3.2
  - 3.3
  - 3.4
  - 3.5
  
services:
  - elasticsearch
  - memcached
  - mongodb
  - mysql
  - postgres
  - rabbitmq
  - redis
  - selenium
  - sqllite
  
build_image: drydock/u12pytpls:prod

before_install:
  # We're going to set up a virtualenv and activate the python version we want to use
  - mkdir -p $HOME/bldve/
  - virtualenv -p /usr/bin/python$PYTHON_VERSION $HOME/bldve/
  - source $HOME/bldve/bin/activate

install:
  - pip install -r requirements.txt

script:
  - python test.py
