#!/bin/bash

CLUSTERNAME="dev"

eksctl utils associate-iam-oidc-provider --cluster=attractive-gopher --approve
kubectl apply -f kubernetes/rbac-role.yaml
aws iam create-policy \
    --policy-name ALBIngressControllerIAMPolicy \
    --policy-document file://kubernetes/iam-policy.json

eksctl create iamserviceaccount \
       --cluster=$CLUSTERNAME \
       --namespace=kube-system \
       --name=alb-ingress-controller \
       --attach-policy-arn=$PolicyARN \
       --override-existing-serviceaccounts \
       --approve

sed -i -e "s/# - --cluster-name=CusterName/- --cluster-name=$CLUSTERNAME/g" kubernetes/alb-ingress-controller.yaml
kubectl apply -f kubernetes/alb-ingress-controller.yaml

kubectl apply -f application/2048-namespace.yaml
kubectl apply -f application/2048-deployment.yaml
kubectl apply -f application/2048-service.yaml

kubectl apply -f application/2048-ingress.yaml

