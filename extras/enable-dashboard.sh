#!/bin/bash
for x in *.yml; do kubectl apply -f $x -n kube-system; done
echo "http://localhost:8001/api/v1/namespaces/kube-system/services/kubernetes-dashboard/proxy"

