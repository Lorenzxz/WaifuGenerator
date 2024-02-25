APP_NAME := waifugenerator
SRC_DIR := app
INSTALL_DIR := ~/.config/waifugenerator

install:
	mkdir -p $(INSTALL_DIR)
	sudo npm i -g electron-packager
	electron-packager $(SRC_DIR) $(APP_NAME) --platform=linux --arch=x64 --out=dist --electron-version=13.1.7
	sudo cp -r $(SRC_DIR)/waifugenerator.desktop /usr/share/applications
	sudo cp -r $(SRC_DIR)/dist/$(APP_NAME)-linux-x64/* $(INSTALL_DIR)
	sudo chmod +x $(INSTALL_DIR)/$(APP_NAME)
	sudo update-desktop-database

uninstall:
	sudo rm -rf $(INSTALL_DIR)
	sudo rm -f /usr/share/applications/$(APP_NAME).desktop
	sudo update-desktop-database

.PHONY: install uninstall