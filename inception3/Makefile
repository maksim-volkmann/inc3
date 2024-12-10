## Inception Makefile

default: build up

build:
	cd srcs && docker compose build

up:
	cd srcs && docker compose up

down:
	cd srcs && docker compose down

re: fclean build up

clean:
	cd srcs && docker compose down

fclean:
	$(MAKE) clean
	if [ -d "/home/$(USER)/data" ]; then \
		sudo rm -rf /home/$(USER)/data; \
		echo "Removed /home/$(USER)/data"; \
	else \
		echo "Directory /home/$(USER)/data is empty"; \
	fi

