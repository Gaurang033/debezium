
## create service account for pods 
```
kubectl apply -f - <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
name: debezium-sa
EOF
```

## create kubernates cluster 
```
 gcloud beta container clusters create "debezium-poc" --scopes=sql-admin,pubsub --region "us-east1" --service-account=sa-debzium-k8@dataframework.iam.gserviceaccount.com
```

## Deploying code 
```
 kubectl apply -f mysql_config_map.yaml
 kubectl apply -f mysql_statefulset.yaml
 kubectl apply -f mysql_cdc_service.yaml
```

## Checking logs 
```
kubectl get pods
kubectl logs debezium-mysql-0 debezium-server
```

## Creating mysql user 
```sql 
CREATE USER 'replication_user'@'%' IDENTIFIED BY 'secret';
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'replication_user'
```

## give permission to existing user 
```sql 
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'admin'
```

## create postgres user 
```sql 
CREATE USER replication_user WITH REPLICATION
IN ROLE cloudsqlsuperuser LOGIN PASSWORD 'secret';
```