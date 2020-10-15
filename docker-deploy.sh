#!/usr/bin/env bash
#docker-compose down -v    
#fusermount -u ./bucket_volume && rm -R ./bucket_volume 
docker-compose up -d
docker cp ./bucket_volume/. stencil:/templates
docker exec -d stencil java $STENCIL_JAVA_OPTIONS -jar /myapp/myapp.jar
###Test###
sleep 10
time curl -XPOST localhost:8080/test-control-loop.docx --header "Content-Type: application/json" --data '{"elems":[{"value": "first"}]}' > uploaded_file_1.docx