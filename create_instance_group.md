
## Create an instance template:
    $ gcloud compute instance-templates create my-block-umbrella-staging-template-4 \
        --image-family debian-9 \
        --image-project debian-cloud \
        --machine-type f1-micro \
        --scopes "userinfo-email,cloud-platform" \
        --metadata-from-file startup-script=my-block-umbrella-staging-instance-startup.sh \
        --metadata release-url=gs://my-block-cerebrum/my-block-umbrella-latest-release \
        --tags http-server \
        --preemptible

## Now create an instance group using that template:
    $ gcloud compute instance-groups managed create my-block-umbrella-staging-group \
        --base-instance-name my-block-umbrella-group \
        --size 1 \
        --template my-block-umbrella-staging-template \
        --region us-west1

## Firewall rule for allowing traffic to instance port 8080
    $ gcloud compute firewall-rules create default-allow-http-8080 \
        --allow tcp:8080 \
        --source-ranges 0.0.0.0/0 \
        --target-tags http-server \
        --description "Allow port 8080 access to http-server"

    $ gcloud compute firewall-rules create default-allow-http-8081 \
        --allow tcp:8081 \
        --source-ranges 0.0.0.0/0 \
        --target-tags http-server \
        --description "Allow port 8081 access to http-server"

## List all instance
    $ gcloud compute instances list
