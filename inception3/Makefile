## Inception Makefile

# Define variables for directories
DATA_DIR := /home/mvolkman/data
DB_DIR := $(DATA_DIR)/db
WP_DIR := $(DATA_DIR)/wp



default: build up

create-directories:
	@echo "Creating required directories..."
	mkdir -p $(DB_DIR)
	mkdir -p $(WP_DIR)
	@echo "Directories created: $(DB_DIR), $(WP_DIR)"

build:
	cd srcs && docker compose build

up:
	$(MAKE) create-directories
	cd srcs && docker compose up

down:
	cd srcs && docker compose down

re: fclean build up

clean:
	cd srcs && docker compose down

cclean:
	docker system prune -a --volumes -f
	docker volume rm inception_db_data

fclean:
	$(MAKE) clean
	@if [ -d "/home/$(USER)/data" ]; then \
		sudo rm -rf /home/$(USER)/data; \
		echo "Removed /home/$(USER)/data"; \
	else \
		echo "Directory /home/$(USER)/data is empty"; \
	fi

# Command to rebuild and restart a specific service
rebuild:
	@if [ -z "$(service)" ]; then \
		echo "Usage: make rebuild service=<service_name>"; \
	else \
		cd srcs && docker compose up -d --build $(service); \
	fi

# Aliases for common services
rebuild-wp:
	$(MAKE) rebuild service=wordpress

rebuild-db:
	$(MAKE) rebuild service=mariadb

rebuild-nginx:
	$(MAKE) rebuild service=nginx

rebuild-ftp:
	$(MAKE) rebuild service=ftp

.PHONY: default build up down re clean fclean rebuild rebuild-wp rebuild-db rebuild-nginx
