   0 docker pull alpine
   1 docker tag alpine image-registry:443/alpine
   2 docker push image-registry:443/alpine
   3 cp -r /etc/docker/certs.d/image-registry /etc/docker/certs.d/image-registry:443
   4 docker push image-registry:443/alpine
