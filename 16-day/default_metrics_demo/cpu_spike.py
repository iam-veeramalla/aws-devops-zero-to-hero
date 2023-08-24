import time

def simulate_cpu_spike(duration=30, cpu_percent=80):
    print(f"Simulating CPU spike at {cpu_percent}%...")
    start_time = time.time()

    # Calculate the number of iterations needed to achieve the desired CPU utilization
    target_percent = cpu_percent / 100
    total_iterations = int(target_percent * 5_000_000)  # Adjust the number as needed

    # Perform simple arithmetic operations to spike CPU utilization
    for _ in range(total_iterations):
        result = 0
        for i in range(1, 1001):
            result += i

    # Wait for the rest of the time interval
    elapsed_time = time.time() - start_time
    remaining_time = max(0, duration - elapsed_time)
    time.sleep(remaining_time)

    print("CPU spike simulation completed.")

if __name__ == '__main__':
    # Simulate a CPU spike for 30 seconds with 80% CPU utilization
    simulate_cpu_spike(duration=30, cpu_percent=80)
