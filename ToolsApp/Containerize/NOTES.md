# Containerization Notes

1. Run the comments from the Tools App folder, not the Containerize folder.

2. Build the individual images:

```bash
docker build -t tools-app-web -f ./Containerize/ToolsAppDockerfile .
```

```bash
docker build -t tools-app-sql-edge -f ./Containerize/SqlEdgeDockerfile .
```

3. Build the images with Docker Compose.

```bash
docker compose -f ./Containerize/docker-compose.yml --project-directory . build
```

4. Run the containers with Docker Compose.

```bash
docker compose -f ./Containerize/docker-compose.yml --project-directory . up
```