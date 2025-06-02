bash11111111
#!/bin/bash

# File to log memory usage
LOG_FILE="/var/log/ec2_memory_monitor.log"

# Function to get memory usage
get_memory_usage() {
    # Using 'free' command to get memory details
    total_memory=$(free -m | awk '/^Mem:/{print $2}')
    used_memory=$(free -m | awk '/^Mem:/{print $3}')
    memory_usage=$(awk "BEGIN {printf \"%.2f\", ($used_memory/$total_memory)*100}")
    echo "$memory_usage"
}

# Function to log memory usage
log_memory_usage() {
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    memory_usage=$(get_memory_usage)
    echo "$timestamp - Memory Usage: $memory_usage%" >> "$LOG_FILE"
}

# Main script execution
log_memory_usage

# Optional: Print memory usage to console
echo "Memory usage logged. Check $LOG_FILE for details."
