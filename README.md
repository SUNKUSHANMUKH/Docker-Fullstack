# 🚀 **Dockerized Full Stack Application**

This project demonstrates a complete **Dockerized full-stack application** consisting of a **PostgreSQL database**, a **Spring Boot backend**, and a **frontend (JS/HTML/CSS)** application — all managed through **Docker Compose**.

---

## 🧩 **Prerequisites**

Make sure you have the following installed and running on your system:
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Docker Engine & Docker Compose

---

## ⚙️ **How to Run the Application**

### **Step 1: Start the Application**

Run the following command from the project root:

```bash
docker-compose up --build
```

Alternatively, you can start it in **detached mode** (runs in background):

```bash
docker-compose up --build -d
```

### 🧠 What Happens When You Run It

1. Docker first spawns a container for the **PostgreSQL database**.  
2. Once ready, it builds and starts the **Spring Boot backend** container.  
3. Docker waits for the backend’s **healthcheck** to pass.  
4. Finally, it launches the **frontend** container.  

> ⚠️ **Note:** The application is configured such that re-running `docker-compose` will **clean up existing data** from the database.

---

## 🌐 **Step 2: Access the Application**

After successful startup, open your browser and visit:

👉 **http://localhost**

### Available Actions:
- **Test Connection:** Tests backend connection.  
- **Clear:** Clears all form fields.  
- **Auto Fill:** Fills form with default values (editable).  
- **Submit:** Submits data and displays the success or failure message.  
- **View Data:** Shows database contents in a tabular view.

---

## 🧹 **Step 3: Stop the Application**

If you started it normally:
```bash
CTRL + C
```

If you started it in detached mode:
```bash
docker-compose down
```

Alternatively, you can also **stop containers** directly from the Docker Desktop UI by pressing the **⏹ Stop** button.

---

## 🗂️ **Project Structure**

```
Docker/
│
├── docker-compose.yml
│
├── backend/
│   ├── backend.Dockerfile
│   └── <backend source code files>
│
├── frontend/
│   ├── frontend.Dockerfile
│   └── <JS, HTML & CSS files>
│
└── database/
    ├── database.Dockerfile
    └── 1_init_db.sql
```

The root `docker-compose.yml` file orchestrates all three services using their respective Dockerfiles.

---

## 🧪 **Testing Each Component Individually**

### **1️⃣ Frontend**
Accessible via:
```
http://localhost
```
You can interact with the buttons and verify UI functionality.

---

### **2️⃣ Backend (Spring Boot App)**

Base URL:
```
http://localhost:8080
```

#### 🔹 Health Check:
```bash
curl -f http://localhost:8080/ping
```

To see detailed output:
```bash
curl -v -f http://localhost:8080/ping
```

#### 🔹 Create User:
```bash
curl -X POST http://localhost:8080/user \
-H "Content-Type: application/json" \
-d '{"full_name":"Harry Potter", "email":"harry@potter.com", "phone_number":"4123567890"}'
```

#### 🔹 Get All Users:
```bash
curl -f http://localhost:8080/user
```

If there are no results, response will be:
```json
[]
```

---

### **3️⃣ Accessing PostgreSQL Directly**

1. Open **Docker Desktop**.  
2. Expand the running stack and find the **backend-database** container.  
3. Click on it → Open the **Exec** tab → Access terminal.  

Run:
```bash
psql backend_db -U user -w
```
If prompted for password, enter:
```
password
```

Then execute SQL queries, for example:
```sql
SELECT * FROM user_entity;
```

---

## 🧱 **Technology Stack**

| Layer | Technology |
|-------|-------------|
| **Frontend** | HTML, CSS, JavaScript |
| **Backend** | Java (Spring Boot) |
| **Database** | PostgreSQL |
| **Containerization** | Docker & Docker Compose |

---

## 💡 **Notes**

- The Docker setup ensures proper container dependency (database → backend → frontend).  
- You can modify environment variables like **POSTGRES_USER**, **POSTGRES_PASSWORD**, and **POSTGRES_DB** in `docker-compose.yml`.  
- For production deployment, use **private Docker images** or an **internal registry** to protect credentials.

---

## 🧾 **License**

This project is open-source and available under the [MIT License](LICENSE).
