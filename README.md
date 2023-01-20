# django_prometheus_example
[django-prometheus](https://github.com/korfuri/django-prometheus) sample.

## How to run a sample
```shell
$ export PROJECT_ID="<your project id>"
$ export CLUSTERS_ZONE="<your zone>"
$ gcloud config set project ${PROJECT_ID}
$ gcloud components install gke-gcloud-auth-plugin
$ gcloud container clusters create django-prometheus-example \
  --scopes "https://www.googleapis.com/auth/userinfo.email","cloud-platform" \
  --num-nodes 1 --zone ${CLUSTERS_ZONE}
$ gcloud container clusters get-credentials django-prometheus-example --zone ${CLUSTERS_ZONE}
$ docker build -t gcr.io/${PROJECT_ID}/django-prometheus-example:latest .
$ gcloud auth configure-docker
$ docker push gcr.io/${PROJECT_ID}/django-prometheus-example:latest
$ kubectl create -f django-prometheus-example.yaml
```

## Clean up
```shell
$ gcloud container clusters delete django-prometheus-example
$ gcloud container images delete gcr.io/${PROJECT_ID}/django-prometheus-example
```
