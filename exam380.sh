#!/bin/bash

scp -r root@utility:/home/lab/ocp4/auth/kube* .
x=$(cat /home/student/kubeadmin-password)
y=$(cat /home/student/kubeconfig | grep server | awk -F" " '{print $2}'|uniq) 
oc login -u kubeadmin -p $x $y

oc new-project exam-ex280-7
oc adm taint node worker01 key1=value1:NoSchedule
oc adm taint node worker02 key1=value1:NoSchedule
oc adm taint node worker03 key1=value1:NoSchedule
oc adm taint node worker04 key1=value1:NoSchedule
oc adm taint node worker05 key1=value1:NoSchedule
oc adm taint node worker06 key1=value1:NoSchedule
oc new-app --name app1 httpd:2.4 
sleep 5
oc expose service app1 



oc new-project exam-ex280-8
oc new-app --name test01 httpd:2.4 
sleep 5
oc expose service test01 



oc new-project exam-ex280-9
oc new-app --name paypal httpd:2.4
sleep 5
oc expose service paypal



oc new-project exam-ex280-10
oc new-app --name paypal httpd:2.4



oc new-project exam-ex280-11
oc new-app --name mysql --docker-image registry.access.redhat.com/rhscl/mysql-57-rhel7:5.7-47 
sleep 4 
oc expose service mysql



oc new-project exam-ex280-13
oc new-app --name git --docker-image quay.io/cprakash2118/java-unzip-httpd-image
sleep 4
oc expose service git 


oc new-project exam-ex280-15
oc new-app --name app1 --docker-image httpd:2.4
oc label node worker01 start=trick
oc label node worker02 start=trick
oc label node worker03 start=trick
oc label node worker04 start=trick
oc label node worker05 start=trick
oc label node worker06 start=trick
sleep 4 
oc expose service app1 


oc new-project exam-ex280-16
oc new-app --name app2 --docker-image httpd:2.4
oc set resources deployment app2 --requests=memory=80Gi

oc expose service app2
