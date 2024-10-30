helm repo add elastic https://helm.elastic.co
helm install kibana elastic/kibana
helm install kibana --set service.type=LoadBalancer elastic/kibana
NAME: kibana
LAST DEPLOYED: Wed Oct 30 12:04:16 2024
NAMESPACE: kube-system
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
1. Watch all containers come up.
  $ kubectl get pods --namespace=kube-system -l release=kibana -w
2. Retrieve the elastic user's password.
  $ kubectl get secrets --namespace=kube-system elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
3. Retrieve the kibana service account token.

#   $ kubectl get secrets --namespace=kube-system kibana-kibana-es-token -ojsonpath='{.data.token}' | base64 -d


helm install fluent-bit fluent/fluent-bit -f fluentbit-values.yaml -n logging


----------- Fluent bit-------------------

NAME: fluent-bit
LAST DEPLOYED: Wed Oct 30 12:23:48 2024
NAMESPACE: kube-system
STATUS: deployed
REVISION: 1
NOTES:
Get Fluent Bit build information by running these commands:

export POD_NAME=$(kubectl get pods --namespace kube-system -l "app.kubernetes.io/name=fluent-bit,app.kubernetes.io/instance=fluent-bit" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace kube-system port-forward $POD_NAME 2020:2020
curl http://127.0.0.1:2020