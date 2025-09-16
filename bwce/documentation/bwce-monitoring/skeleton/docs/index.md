# TIBCO BWCE Monitoring Setup Guide

This guide provides instructions for setting up TIBCO BusinessWorks Container Edition Monitoring (BWCEMon) application to monitor your BWCE containers in {% if values.deployment_type == 'kubernetes' %}Kubernetes{% else %}Docker{% endif %} environment.

## Overview

BWCEMon is a built-in tool for monitoring TIBCO BWCE containers deployed in Kubernetes, OpenShift, or Docker environments. It provides real-time monitoring, performance metrics, and troubleshooting capabilities for your integration applications.

## Prerequisites

Before deploying BWCEMon, ensure you have:

- **TIBCO BWCEMon Software**: Downloaded from [TIBCO eDelivery portal](https://edelivery.tibco.com)
- **Database Instance**: {% if values.database_type == 'postgres' %}PostgreSQL{% elif values.database_type == 'mysql' %}MySQL{% else %}H2 in-memory{% endif %} database for monitoring data storage
{% if values.deployment_type == 'kubernetes' %}- **Kubernetes Cluster**: Access to deploy services and pods{% else %}- **Docker Environment**: Docker runtime for container deployment{% endif %}
- **Network Connectivity**: Database must be reachable from BWCEMon host

## Setup Steps

### 1. Download BWCEMon Software

1. Login to [TIBCO Software Download](https://edelivery.tibco.com)
2. Navigate to BusinessWorks Container Edition → Version {{ values.bwce_mon_version }}
3. Under Runtime section, select Container
4. Download `bwce-mon-{{ values.bwce_mon_version }}.zip`

### 2. Build BWCEMon Docker Image

Extract the downloaded ZIP file and build the Docker image:

```bash
# Extract BWCEMon package
unzip bwce-mon-{{ values.bwce_mon_version }}.zip
cd bwce_mon

# Build Docker image
docker build -t {{ values.name }}/bwce-monitoring:{{ values.bwce_mon_version }} .

# Optional: Push to registry
docker push {{ values.name }}/bwce-monitoring:{{ values.bwce_mon_version }}
```

{% if values.deployment_type == 'kubernetes' %}
### 3. Deploy to Kubernetes

Deploy BWCEMon using the provided Kubernetes manifests:

```bash
# Apply deployment configuration
kubectl apply -f k8s-deployment.yaml

# Check deployment status
kubectl get pods -l app=bwce-monitoring
kubectl get services -l app=bwce-monitoring
```

**Access BWCEMon:**
{% if values.enable_loadbalancer %}
- External access via LoadBalancer service
- Check external IP: `kubectl get service bwce-monitoring-service`
- Access URL: `http://<EXTERNAL-IP>:80`
{% else %}
- Port-forward for local access: `kubectl port-forward service/bwce-monitoring-service 8080:80`
- Access URL: `http://localhost:8080`
{% endif %}

{% else %}
### 3. Deploy as Standalone Container

Run BWCEMon as a standalone Docker container:

```bash
# Deploy with {{ values.database_type | upper }} database
docker run -d \
  --name {{ values.name }}-monitoring \
  -p 8080:8080 \
  {% if values.database_type != 'h2' %}
  -e PERSISTENCE_TYPE="{{ values.database_type }}" \
  -e DB_URL="{{ values.database_type }}://{{ values.db_username }}:YOUR_PASSWORD@{{ values.db_host }}:{{ values.db_port }}/{{ values.db_name }}" \
  {% else %}
  -e PERSISTENCE_TYPE="h2" \
  -e DB_URL="h2:mem:{{ values.db_name }}" \
  {% endif %}
  {{ values.name }}/bwce-monitoring:{{ values.bwce_mon_version }}

# Check container status
docker ps | grep {{ values.name }}-monitoring
docker logs {{ values.name }}-monitoring
```

**Access BWCEMon:**
- Local access: `http://localhost:8080`
- Container IP access: `http://<CONTAINER-IP>:8080`

{% endif %}


## Integrating BWCE Applications with BWCEMon

### 1. Configure BWCE Applications for Monitoring

To enable monitoring, your BWCE applications need specific configuration:

**Application Properties (`application.properties`):**
```properties
# Enable monitoring
bw.monitoring.enabled=true
bw.monitoring.url={% if values.deployment_type == 'kubernetes' %}http://bwce-monitoring-service:80{% else %}http://{{ values.name }}-monitoring:8080{% endif %}/monitoring/api

# Application identification
bw.app.name={{ values.name }}-app
bw.app.version=1.0.0
bw.app.environment={% if values.deployment_type == 'kubernetes' %}kubernetes{% else %}docker{% endif %}

# Monitoring intervals (milliseconds)
bw.monitoring.heartbeat.interval=30000
bw.monitoring.metrics.interval=60000
```

**Docker Configuration for BWCE Apps:**
```dockerfile
# In your BWCE application Dockerfile
FROM tibco/bwce:latest

# Copy application EAR
COPY target/your-bwce-app.ear /

# Add monitoring configuration
ENV BW_MONITORING_ENABLED=true
ENV BW_MONITORING_URL={% if values.deployment_type == 'kubernetes' %}http://bwce-monitoring-service:80{% else %}http://host.docker.internal:8080{% endif %}/monitoring/api
ENV BW_APP_NAME={{ values.name }}-integration-app

EXPOSE 8080
```

### 2. Deploy BWCE Applications with Monitoring

{% if values.deployment_type == 'kubernetes' %}
**Kubernetes Deployment for BWCE App:**
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: bwce-application
spec:
  replicas: 2
  selector:
    matchLabels:
      app: bwce-application
  template:
    metadata:
      labels:
        app: bwce-application
    spec:
      containers:
      - name: bwce-app
        image: your-registry/bwce-app:latest
        ports:
        - containerPort: 8080
        env:
        - name: BW_MONITORING_ENABLED
          value: "true"
        - name: BW_MONITORING_URL
          value: "http://bwce-monitoring-service:80/monitoring/api"
        - name: BW_APP_NAME
          value: "{{ values.name }}-integration-service"
```
{% else %}
**Docker Network Setup:**
```bash
# Create network for BWCEMon and BWCE apps
docker network create bwce-network

# Run BWCEMon on the network
docker run -d \
  --name {{ values.name }}-monitoring \
  --network bwce-network \
  -p 8080:8080 \
  {{ values.name }}/bwce-monitoring:{{ values.bwce_mon_version }}

# Run BWCE application with monitoring
docker run -d \
  --name your-bwce-app \
  --network bwce-network \
  -p 8081:8080 \
  -e BW_MONITORING_ENABLED=true \
  -e BW_MONITORING_URL=http://{{ values.name }}-monitoring:8080/monitoring/api \
  -e BW_APP_NAME=your-integration-service \
  your-registry/bwce-app:latest
```
{% endif %}

### 3. Using BWCEMon Web Interface

Once BWCEMon is running and BWCE applications are connected:

1. **Access BWCEMon Dashboard**: Open {% if values.deployment_type == 'kubernetes' and values.enable_loadbalancer %}external LoadBalancer IP{% else %}`http://localhost:8080`{% endif %}

2. **Application Discovery**: BWCEMon automatically discovers connected BWCE applications

3. **Monitor Applications**:
   - **Health Status**: Real-time health checks and status
   - **Performance Metrics**: CPU, memory, throughput statistics
   - **Process Monitoring**: Individual process execution details
   - **Error Tracking**: Exception monitoring and alerting
   - **Log Aggregation**: Centralized logging from all BWCE apps

4. **Configure Alerts**: Set up notifications for:
   - Application down/up events
   - Performance threshold violations
   - Process execution failures
   - Custom business metrics

### Key Monitoring Features

- **Real-time Dashboard**: Live performance metrics and health status
- **Application Topology**: Visual representation of BWCE application relationships
- **Performance Analytics**: Historical data and trend analysis
- **Log Management**: Centralized logging with search and filtering
- **Alert Management**: Configurable notifications and escalation
- **Troubleshooting Tools**: Debug information and diagnostic utilities
- **API Integration**: REST APIs for custom monitoring solutions

## Troubleshooting

### Common Issues

{% if values.deployment_type == 'kubernetes' %}
**Pod Not Starting:**
```bash
kubectl describe pod <bwce-monitoring-pod>
kubectl logs <bwce-monitoring-pod>
```

**Service Not Accessible:**
```bash
kubectl get endpoints bwce-monitoring-service
kubectl port-forward service/bwce-monitoring-service 8080:80
```
{% else %}
**Container Not Starting:**
```bash
docker logs {{ values.name }}-monitoring
docker inspect {{ values.name }}-monitoring
```

**Port Conflicts:**
```bash
# Use different port if 8080 is occupied
docker run -p 8081:8080 ... {{ values.name }}/bwce-monitoring:{{ values.bwce_mon_version }}
```
{% endif %}

**Database Connection Issues:**
- Verify database is running and accessible
- Check connection string format and credentials
- Ensure network connectivity between BWCEMon and database
- Review database logs for connection attempts

### Health Checks

Verify BWCEMon is running correctly:

```bash
{% if values.deployment_type == 'kubernetes' %}
# Check pod health
kubectl get pods -l app=bwce-monitoring

# Test service endpoint
curl http://<SERVICE-IP>:80/health
{% else %}
# Check container health  
docker ps | grep {{ values.name }}-monitoring

# Test application endpoint
curl http://localhost:8080/health
{% endif %}
```

## Next Steps

1. **Configure BWCE Applications**: Add your BWCE containers to monitoring
2. **Set Up Dashboards**: Create custom monitoring dashboards
3. **Configure Alerts**: Set up notifications for critical events
4. **Integration**: Connect with existing monitoring tools (Prometheus, Grafana)



---

*Generated from TIBCO Developer Hub template for BWCE Monitoring setup*