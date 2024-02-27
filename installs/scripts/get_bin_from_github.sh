#!/usr/bin/env zsh

repo_path="$1"
dist="${2:-"x86_64-apple-darwin"}"

# Extract both the latest tag name and the download url from curl response
latest_tag_and_url=$(curl -s "https://api.github.com/repos/$repo_path/releases/latest" \
    | jq -r --arg dist_arg "$dist" '
        {
            tag_name: .tag_name,
            download_url: (.assets[] | select(.browser_download_url | test($dist_arg + ".tar.gz$")) | .browser_download_url)
        }
')

# Parse the extracted information
latest_tag=$(echo "$latest_tag_and_url" | jq -r '.tag_name')
latest_url=$(echo "$latest_tag_and_url" | jq -r '.download_url')

# Check if the latest_tag and latest_url are not empty
if [ -z "$latest_tag" ] || [ -z "$latest_url" ]; then
    echo "Error: Failed to extract the latest tag or download URL."
    exit   1
fi

echo "Latest release tag is: '$latest_tag'"
echo "Downloading for '$dist': '$latest_url'..."

curl -#LO "$latest_url"
echo "Done."
