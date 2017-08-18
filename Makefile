# install dependencies for the project
install:
	carthage update --platform iOS

# build the framework for deployment
build:
	carthage build --no-skip-current