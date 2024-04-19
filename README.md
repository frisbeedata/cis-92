# My CIS-92 Project 

This repository has the starter code for CIS-92. 

By: Richard Gross

# The variables from config.yaml

| Variable Name | Default Value | Description |
| --- | --- | --- | 
|  PORT | 8000 | Port used | 
| STUDENT_NAME | Richard Gross | Username | 
| SITE_NAME | www.ultimatefrisbee.com | Sitename | 
| DATA_DIR | /data | Data directory | 
| Debug | "1" | Debug is true | 

# The variables from secret.yaml

| Variable Name | Default Value | Description |
| --- | --- | --- |  
| metadata | mysite-secret | The metadata from secret.yaml |  
| SECRET_KEY | "TOCREATEANEWSECRET_KEYREADBELOW" | The secret key |

# To create a new SECRET_KEY
echo -n 'How much wood could a wood chuck chuck if a wood chuck could chuck wood?' | base64 <br>
Put that in your SECRET_KEY variable in secret.yaml
before next command below.

# Begin of how to install django in kubernetes.  Install helm chart
helm install postgres oci://registry-1.docker.io/bitnamicharts/postgresql --values values-postgres.yaml

# Start up command
kubectl apply -f deployment/

# Initilize Database
kubectl exec --stdin --tty pod/mysite-pod -- /bin/bash

python manage.py migrate

python manage.py createsuperuser

# Get LoadBalancer EXTERNAL-IP and open a browser window to verify working
kubectl get svc/mysite-svc

# Delete the Kubernetes pod
kubectl delete -f deployment/

# Delete postgres helm chart
helm uninstall postgres 

# Documenting the settings in values-postgres.yaml
### Four variables must be set
| Variable Name | Default Value |
| --- | --- |
| POSTGRES_DB | "mysite" |
| POSTGRES_USER | "mysiteuser" |
| POSTGRES_PASSWORD | "this-is-a-bad-password" |
| POSTGRES_HOSTNAME | "localhost" |

# Our resource request settings
| Variable Name | Default Value |
| --- | --- |
| memory | "512Mi" |
| cpu | "500m" |
| ephemeral-storage | "100Mi" |

# Our resource limits settings
| Variable Name | Default Value |
| --- | --- |
| memory | "512Mi" |
| cpu | "500m" |
| ephemeral-storage | "100Mi" |

# 