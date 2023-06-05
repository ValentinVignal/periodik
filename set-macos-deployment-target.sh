#!/bin/bash

# Define the new deployment target version here
NEW_DEPLOYMENT_TARGET=11.0

# Loop through all the configurations in the project
for CONFIGURATION in Debug Release; do
    for SDK in macosx iphonesimulator appletvsimulator watchsimulator; do
        # Set the deployment target for the current configuration and SDK
        xcodebuild -configuration $CONFIGURATION -sdk $SDK MACOSX_DEPLOYMENT_TARGET=$NEW_DEPLOYMENT_TARGET
    done
done
