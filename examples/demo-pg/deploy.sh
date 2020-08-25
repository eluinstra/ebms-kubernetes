#!/bin/sh

export BASE_DIR=`dirname $(realpath $0)`

kubectl create -f $BASE_DIR/../namespace.yaml

kubectl create -f $BASE_DIR/../digipoort/replicationcontroller.yaml
kubectl create -f $BASE_DIR/../digipoort/service.yaml
# minikube service digipoort -n ebms-adapter-demo

kubectl create -f $BASE_DIR/postgres/replicationcontroller.yaml
kubectl create -f $BASE_DIR/postgres/service.yaml

kubectl create -f $BASE_DIR/overheid/replicationcontroller.yaml
kubectl create -f $BASE_DIR/overheid/service.yaml
# minikube service overheid -n ebms-adapter-demo
