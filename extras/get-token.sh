#!/bin/bash
for x in *.yml; do kubectl apply -f $x -n kube-system; done
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
echo "http://localhost:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy"
