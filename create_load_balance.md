
## create health-check
    $ gcloud compute http-health-checks create my-block-web-staging-health-check \
        --request-path / \
        --port 8080
        --check-interval 30s
        --timeout 15s

    $ gcloud compute http-health-checks create my-block-admin-web-staging-health-check \
        --request-path / \
        --port 8081
        --check-interval 30s
        --timeout 15s

## create named port
    $ gcloud compute instance-groups managed set-named-ports my-block-umbrella-staging-group \
        --named-ports http:8080 \
        --region us-west1
    $ gcloud compute instance-groups managed set-named-ports my-block-umbrella-staging-group \
        --named-ports http:8081 \
        --region us-west1
## create backend service 
    $ gcloud compute backend-services create my-block-web-staging-service \
        --http-health-checks my-block-web-staging-health-check --http-health-checks my-block-admin-web-staging-health-check \
        --global
    $ gcloud compute backend-services create my-block-adminweb-staging-service \
        --http-health-checks my-block-web-staging-health-check --http-health-checks my-block-admin-web-staging-health-check \
        --global

## add backend service to instance group
    $ gcloud compute backend-services add-backend my-block-umbrella-staging-service \
        --instance-group my-block-umbrella-staging-group \
        --global \
        --instance-group-region us-west1
## create url map
    $ gcloud compute url-maps create my-block-umbrella-staging-service-map \
        --default-service my-block-umbrella-staging-service

## create proxy
    $ gcloud compute target-http-proxies create my-block-umbrella-staging-service-proxy \
        --url-map my-block-umbrella-staging-service-map

## create global forwarding rule
    $ gcloud compute forwarding-rules create my-block-web-staging-http-rule \
        --target-http-proxy my-block-umbrella-staging-service-proxy\
        --ports 80 \
        --global
    $ gcloud compute forwarding-rules create my-block-admin-web-staging-http-rule \
        --target-http-proxy q\
        --ports 70 \
        --global
## check on load balancer progress
    $ gcloud compute backend-services get-health my-block-umbrella-staging-service \
        --global

## get the forwarding IP address for the load balancer:
    $ gcloud compute forwarding-rules list --global