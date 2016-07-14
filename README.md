# References

# Commands

build:

    docker build -t fb-elasticsearch --rm=true .

debug:

    docker run -i -t --entrypoint=sh fb-elasticsearch

run:

    docker run -p 9200:9200 -p 9300:9300 -e LOCAL_USER_ID=`id -u $USER` --name fb-es_instance -i -P fb-elasticsearch