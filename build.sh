#!/bin/bash

# Function to prompt user to select an option from a list
select_option() {
    local options=("$@")
    local selected_option
    select selected_option in "${options[@]}"; do
        # shellcheck disable=SC2199
        # shellcheck disable=SC2076
        if [[ " ${options[@]} " =~ " ${selected_option} " ]]; then
            echo "$selected_option"
            break
        else
            echo "Invalid option. Please select from the given choices."
        fi
    done
}

# Step 1: Prompt user to select platform (Android/iOS)
echo "Step 1: Select platform (Android/iOS)"
platform_options=("Android" "iOS")
selected_platform=$(select_option "${platform_options[@]}")

# Step 2: If iOS selected, assign ipa to local variable
if [ "$selected_platform" == "iOS" ]; then
    echo "IPA file will be generated."
    generated_file="ipa"
else
    # Step 2.1: If Android selected, prompt for build type (APK or App Bundle)
    echo "Step 2.1: Select build type (APK/App Bundle)"
    build_type_options=("APK" "App Bundle")
    selected_build_type=$(select_option "${build_type_options[@]}")
    if [ "$selected_build_type" == "App Bundle" ]; then
      generated_file="appbundle"
    else
      generated_file="apk"
    fi
fi

# Step 3: Prompt user to select flavor (dev/stage/prod)
echo "Step 3: Select flavor (dev/stage/prod)"
flavor_options=("dev" "stage" "prod")
selected_flavor=$(select_option "${flavor_options[@]}")

# Step 4: Prompt user to select build mode (debug/release)
echo "Step 4: Select build mode (debug/release)"
build_mode_options=("debug" "release")
selected_build_mode=$(select_option "${build_mode_options[@]}")

# Constructing command based on user selections
command="flutter build $generated_file --flavor $selected_flavor --dart-define-from-file=.env/$selected_flavor.json --$selected_build_mode"

# If Android and APK build type, append "--target-platform=android-arm,android-arm64,android-x64" to the command
#if [ "$selected_platform" == "Android" ] && [ "$selected_build_type" == "APK" ]; then
#    command+=" --target-platform=android-arm,android-arm64,android-x64"
#fi

# Execute the constructed command
echo "Executing command:"
echo "$command"
eval "$command"

# Inform the user about the generated file
echo "Generated $generated_file file."
