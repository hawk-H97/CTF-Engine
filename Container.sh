#!/bin/bash

# File to store the Docker Compose content
output_file="docker-compose.yml"

# Initialize the Docker Compose file
echo "version: '3'" > $output_file
echo "services:" >> $output_file

# Loop to create containers from 1 to the desired number
for i in $(seq 1 100); do
  echo "  ctf_container_$i:" >> $output_file
  echo "    build: ." >> $output_file
  echo "    container_name: ctf_container_$i" >> $output_file
  echo "    ports:" >> $output_file
  echo "      - \"22$(printf "%02d" $i):22\"" >> $output_file
  echo "    environment:" >> $output_file
  echo "      - USERNAME=ctfuser" >> $output_file
  echo "      - PASSWORD=CTFpassword123" >> $output_file
  echo "    volumes:" >> $output_file
  echo "      - /home/webhack/ctf_challenge/challenge/ctf_container_$i:/home/webhack_host" >> $output_file
  echo "    restart: unless-stopped" >> $output_file
  echo "" >> $output_file
done

echo "Docker Compose file generated: $output_file"
