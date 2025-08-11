# Todo API Implementation

A MuleSoft API implementation that demonstrates MySQL database integration using Docker containers. This project shows how to build a Todo API with database connectivity in Anypoint Code Builder (ACB).

## Important: API Specification Setup

> [!IMPORTANT]
> **Before using this project**, you'll need to implement the API specification in your own Anypoint Platform organization.

The complete OpenAPI 3.0 specification is available in [`todo-task-api.yaml`](todo-task-api.yaml). This project currently references an API specification from a specific organization. To use this project:

1. **Import the specification** - Upload [`todo-task-api.yaml`](todo-task-api.yaml) to your Anypoint Exchange
2. **Update the reference** - Modify the API reference in [`src/main/mule/global.xml`](src/main/mule/global.xml) and [`pom.xml`](/pom.xml) to point to your organization's API
3. **Configure the project** - Update the `api` attribute in the `apikit:config` element with your organization's API details

The API specification defines:
- All available endpoints and their operations
- Request/response schemas for Task objects
- Query parameters for filtering tasks
- Error responses and status codes

## Features

- ✅ MySQL database running in Docker
- ✅ MuleSoft flows with database operations
- ✅ DataWeave transformations for SQL and JSON
- ✅ RESTful API endpoints
- ✅ VS Code integration with Container Tools and Database Client
- ✅ OpenAPI 3.0 specification

## API Endpoints

| Method | Endpoint | Happy Path | Error Handling | Description |
|--------|----------|------------|----------------|-------------|
| GET | `/api/tasks` | ✅ | Not Implemented | Get all tasks |
| GET | `/api/tasks/{taskId}` | ✅ | Not Implemented | Get specific task |
| POST | `/api/tasks` | ✅ | Not Implemented | Create new task |
| PUT | `/api/tasks/{taskId}` | ✅ | Not Implemented | Update task |
| DELETE | `/api/tasks/{taskId}` | ✅ | Not Implemented | Delete task |


## Prerequisites

- [VS Code](https://code.visualstudio.com/Download) with extensions:
  - [Anypoint Extension Pack](https://marketplace.visualstudio.com/items?itemName=salesforce.mule-dx-extension-pack)
  - [Container Tools](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
  - [Database Client](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-database-client2)
  - [Postcode](https://marketplace.visualstudio.com/items?itemName=rohinivsenthil.postcode) and/or [Postman](https://marketplace.visualstudio.com/items?itemName=Postman.postman-for-vscode)
- [Docker Desktop](https://docs.docker.com/desktop/)

## Quick Start

### 1. Start MySQL Database

Use the Container Tools extension in VS Code to click "Run All Services" on the [`docker-compose.yml`](docker-compose.yml) file.

```yml
version: '3'
services:
  db:
    image: mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: admin
      MYSQL_DATABASE: mysqldb
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    ports:
      - 3306:3306
    volumes:
      - db_data:/var/lib/mysql
volumes:
  db_data:
```

### 2. Set Up Database

Connect to MySQL using the Database Client extension:

- **Host**: `127.0.0.1`
- **Port**: `3306`
- **User**: `user`
- **Password**: `password`
- **Database**: `mysqldb`

Run the [SQL script](/create-table-template.sql) to create the tasks table:

```sql
CREATE TABLE tasks(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    dueDate VARCHAR(255),
    completed BOOLEAN NOT NULL
);
```

### 3. Run the Application

Start the Mule application in Anypoint Code Builder.

### 4. Test the API

You can use the attached Postman Collection to run the 5 endpoints: [To-Do API.postman_collection.json](/To-Do%20API.postman_collection.json)