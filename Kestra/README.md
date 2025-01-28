# Kestra Workflow for Taxi Data ETL

This project defines and runs an ETL (Extract, Transform, Load) workflow using **Kestra**, a modern workflow orchestration platform. The workflow processes NYC taxi trip datasets, extracting specific data based on user input and loading it into a PostgreSQL database.

## Project Overview

### Workflow Features
- **Input Parameters**: Select taxi type (`yellow` or `green`), year, and month.
- **Dynamic Variables**: Automatically resolve file names, table names, and paths based on inputs.
- **ETL Process**:
  - Download and decompress NYC taxi trip data.
  - Create staging and final tables in PostgreSQL.
  - Load and merge data, avoiding duplication.

### Technologies Used
- **Kestra**: Workflow orchestration.
- **PostgreSQL**: Database for data storage and manipulation.
- **Docker**: Containerized deployment.
- **Docker Compose**: Simplified multi-container setup.

---

## Project Structure

### Key Files

1. **`kestra.yml`**
   - Defines the Kestra workflow.
   - Handles inputs, tasks, and logic for processing taxi data.

2. **`docker-compose.yml`**
   - Sets up a local Kestra instance with PostgreSQL.
   - Configures storage, queues, and other Kestra services.

---

## Prerequisites

### Software Requirements
- PostgreSQL installed on your system
- Docker and Docker Compose installed on your system.
- Basic knowledge of YAML and SQL.

### Environment Setup
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/amaechijude/ZoomCampDE
   cd ZoomCampDE/Kestra
   ```
2. **Prepare the Database**:
   Ensure a PostgreSQL instance is available and accessible via:
   - URL: `jdbc:postgresql://host.docker.internal:5432/kestradb`
   - Credentials: `username=postgres`, `password=postgres`

---

## Getting Started

### Step 1: Launch Kestra Instance
Use the provided `docker-compose.yml` to start a Kestra instance.

#### Command:
```bash
docker-compose up -d
```

#### Access Kestra:
- Kestra UI: [http://localhost:8080](http://localhost:8080)

### Step 2: Load the Workflow
1. Open the Kestra UI.
2. Create a new flow
3. Copy the `kestra.yml` contents to yoour workflow space.

### Step 3: Execute the Workflow
1. Specify the inputs:
   - **Taxi Type**: `yellow` or `green`.
   - **Year**: `2019`, `2020`, or `2021`.
   - **Month**: `01` to `12`.
2. Run the workflow and monitor its progress through the UI.

---

## Workflow Details

### Inputs
| Parameter | Description             | Default Value |
|-----------|-------------------------|---------------|
| `taxi`    | Type of taxi (yellow/green) | `green`       |
| `year`    | Year of the dataset     | `2020`        |
| `month`   | Month of the dataset    | `04`          |

### Tasks
| Task ID               | Description                                  |
|-----------------------|----------------------------------------------|
| `set_label`           | Assigns labels for tracking purposes.       |
| `extract`             | Downloads and decompresses the dataset.     |
| `if_green`            | Executes subtasks for green taxi data only. |
| `green_create_table`  | Creates the final table for green taxis.    |
| `green_create_staging_table` | Creates a staging table.           |
| `green_truncate_staging_table` | Clears staging table before new data. |
| `green_copy_data_to_staging_table` | Loads data into the staging table. |
| `green_add_unique_id_and_filename` | Updates staging table with unique IDs. |
| `green_merge_data`    | Merges staging data into the final table.   |

---

## Advanced Usage

### Customizing the Workflow
You can modify `kestra.yml` to:
- Add more input parameters.
- Customize SQL queries for additional transformations.
- Extend the workflow to handle other taxi types.

### Cleaning Up
To stop and remove the containers:
```bash
docker-compose down
```

---

## Troubleshooting

1. **Database Connection Issues**:
   Ensure PostgreSQL is accessible at the specified `jdbc` URL and credentials are correct.
   Create the databases `kestradb` and `workflowDb` beforehand.

2. **Kestra Workflow Fails**:
   Check the logs via the Kestra UI or Docker logs:
   ```bash
   docker logs <kestra_container_id>
   ```

---

## References
- [Kestra Documentation](https://kestra.io/docs/)
- [NYC Taxi Data](https://github.com/DataTalksClub/nyc-tlc-data)

---
