# Docker Deployment Commands

## Build BWCEMon Docker Image

```bash
# Extract and build BWCEMon Docker image
unzip bwce-mon-{{ values.bwce_mon_version }}.zip
cd bwce_mon
docker build -t {{ values.name }}/bwce-monitoring:{{ values.bwce_mon_version }} .
```

## Deploy BWCEMon Container

### {% if values.database_type == 'postgres' %}PostgreSQL Configuration{% elif values.database_type == 'mysql' %}MySQL Configuration{% else %}H2 In-Memory Configuration{% endif %}

```bash
# Run BWCEMon container with {{ values.database_type | upper }} database
docker run -d \
  --name {{ values.name }}-bwce-monitoring \
  -p 8080:8080 \
  {% if values.database_type != 'h2' %}
  -e PERSISTENCE_TYPE="{{ values.database_type }}" \
  -e DB_URL="{{ values.database_type }}://{{ values.db_username }}:YOUR_PASSWORD@{{ values.db_host }}:{{ values.db_port }}/{{ values.db_name }}" \
  {% else %}
  -e PERSISTENCE_TYPE="h2" \
  -e DB_URL="h2:mem:{{ values.db_name }}" \
  {% endif %}
  -e JAVA_OPTS="-Xmx512m -Xms256m" \
  --restart unless-stopped \
  {{ values.name }}/bwce-monitoring:{{ values.bwce_mon_version }}
```

## Container Management

```bash
# Check container status
docker ps | grep {{ values.name }}-bwce-monitoring

# View container logs
docker logs {{ values.name }}-bwce-monitoring

# Follow live logs
docker logs -f {{ values.name }}-bwce-monitoring

# Stop container
docker stop {{ values.name }}-bwce-monitoring

# Start container
docker start {{ values.name }}-bwce-monitoring

# Remove container
docker rm {{ values.name }}-bwce-monitoring

# Access container shell
docker exec -it {{ values.name }}-bwce-monitoring /bin/bash
```

## Docker Compose Alternative

Create `docker-compose.yml` for easier management:

```yaml
version: '3.8'

services:
  bwce-monitoring:
    image: {{ values.name }}/bwce-monitoring:{{ values.bwce_mon_version }}
    container_name: {{ values.name }}-bwce-monitoring
    ports:
      - "8080:8080"
    environment:
      {% if values.database_type != 'h2' %}
      - PERSISTENCE_TYPE={{ values.database_type }}
      - DB_URL={{ values.database_type }}://{{ values.db_username }}:YOUR_PASSWORD@{{ values.db_host }}:{{ values.db_port }}/{{ values.db_name }}
      {% else %}
      - PERSISTENCE_TYPE=h2
      - DB_URL=h2:mem:{{ values.db_name }}
      {% endif %}
      - JAVA_OPTS=-Xmx512m -Xms256m
    restart: unless-stopped
    {% if values.database_type != 'h2' %}
    depends_on:
      - {{ values.database_type }}
      
  {% if values.database_type == 'postgres' %}
  postgres:
    image: postgres:13
    container_name: {{ values.name }}-postgres
    environment:
      - POSTGRES_DB={{ values.db_name }}
      - POSTGRES_USER={{ values.db_username }}
      - POSTGRES_PASSWORD=YOUR_PASSWORD
    ports:
      - "{{ values.db_port }}:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: unless-stopped
      
volumes:
  postgres_data:
  {% elif values.database_type == 'mysql' %}
  mysql:
    image: mysql:8.0
    container_name: {{ values.name }}-mysql
    environment:
      - MYSQL_DATABASE={{ values.db_name }}
      - MYSQL_USER={{ values.db_username }}
      - MYSQL_PASSWORD=YOUR_PASSWORD
      - MYSQL_ROOT_PASSWORD=ROOT_PASSWORD
    ports:
      - "{{ values.db_port }}:3306"
    volumes:
      - mysql_data:/var/lib/mysql
    restart: unless-stopped
      
volumes:
  mysql_data:
  {% endif %}
    {% endif %}
```

Use with Docker Compose:

```bash
# Start services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services  
docker-compose down

# Stop and remove volumes
docker-compose down -v
```