helm repo add elastic https://helm.elastic.co
helm install filebeat elastic/filebeat
helm search repo elastic
helm show values elastic/filebeat >values.yml    #To know the values used by the filebit deployment to override our needed ones
helm install elasticsearch elastic/elasticsearch #to install elastic search through which installs elasitc and secrtes needed for fliebit to push the logs
#elasitc search
kubectl get pods --namespace=default -l app=elasticsearch-master -w
kubectl get secrets --namespace=default elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d

kubectl get secrets elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
kubectl get secrets elasticsearch-master-credentials -ojsonpath='{.data.username}' | base64 -d
helm --namespace=default test elasticsearch

helm show values elastic/elasticsearc

helm install elasticsearch \
    --set replicas=1 \
    --set volumeClaimTemplate.storageClassName=gp2 \
    --set persistence.labels.enabled=true elastic/elasticsearch
-n logging

helm repo add fluent https://fluent.github.io/helm-charts
helm install fluent-bit fluent/fluent-bit -f fluentbit-values.yaml
# NAME: elasticsearch
# LAST DEPLOYED: Wed Oct 30 11:10:52 2024
# NAMESPACE: default
# STATUS: deployed
# REVISION: 1
# NOTES:
# 1. Watch all cluster members come up.
#   $ kubectl get pods --namespace=default -l app=elasticsearch-master -w
# 2. Retrieve elastic user's password.
#   $ kubectl get secrets --namespace=default elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
# 3. Test cluster health using Helm test.
#   $ helm --namespace=default test elasticsearch
