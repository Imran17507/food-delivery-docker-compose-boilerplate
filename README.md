# Food Delivery App Installation Guide

This guide provides detailed steps to install and set up the Food Delivery App using Docker Compose. Follow these instructions carefully to ensure a successful installation.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Git
- Docker
- Docker Compose

## Installation Steps

1. **Clone the Boilerplate Repository**

   First, clone the boilerplate repository to your local machine. Open your terminal and run the following command:

   ```bash
   git clone git@github.com:Imran17507/food-delivery-docker-compose-boilerplate.git food-delivery-app
   ```

2. **Navigate to the Application Directory**
   
   Change into the newly created directory:
   
   ```bash
   cd food-delivery-app
   ```

3. **Clone the Application**
   
   Clone the application into a src directory within the food-delivery-app folder:
   
   ```bash
    git clone git@github.com:Imran17507/food-delivery-app.git src
   ```

4. **Install Dependencies with Docker Compose**
   
   Run the following command to install PHP dependencies through Composer:
   
   ```bash
   docker compose run --rm composer install
   ```
  
5. **Start the Server**
   
   Use Docker Compose to start the server:
   
   ```bash
   docker compose up -d server
   ```
   
6. **Set Up Environment Configuration**
   
   Use Docker Compose to start the server:
   
   ```bash
   cd src
   ```
   
   Copy the example environment file to create a new .env file:
   
   ```bash
    cp .env.example .env
    ```
   
   Ensure the .env file contains the following database configuration:
   
   ```php
    DB_CONNECTION=mysql
    DB_HOST=mysql
    DB_PORT=3306
    DB_DATABASE=food_delivery
    DB_USERNAME=admin
    DB_PASSWORD=1234
   ```

7. **Generate Application Key**
   
   Generate a new application key:
    
	```bash
    docker compose run --rm artisan key:generate
    ```

8. **Browse the application**

9. **Run Database Migrations**
   
   Apply the database migrations:
   
   ```bash
    docker compose run --rm artisan migrate
    ```

10. **Seed the Database**
   
   Populate the database with initial data:
   
   ```bash
    docker compose run --rm artisan db:seed
   ```

11. **Run the API Tests**
    
	Ensure everything is set up correctly by running:
    
	```bash
    docker compose run --rm test
    ```
	
## Testing API Endpoints

After installation, you can test the API endpoints using a tool like Postman or curl.

- Store Rider Location History
  ```bash
    POST http://localhost:8000/api/rider/location-history
  ```
  Payload:

	```json
	{
		"rider_id": "80",
		"service_name": "UberEats",
		"latitude": "23.807624",
		"longitude": "90.368352",
		"capture_time": "2024-03-30 08:51:55"
	}
	```

- Find The Nearest Rider
	```bash
	POST http://localhost:8000/api/restaurant/nearest-rider
	```
  Payload:

	```json
	{
		"restaurant_id": "10"
	}
	```

Follow these steps to set up and start using the Food Delivery App Service.
