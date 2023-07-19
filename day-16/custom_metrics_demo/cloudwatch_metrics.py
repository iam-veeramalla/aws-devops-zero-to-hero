from flask import Flask
import time
import random
import boto3


app = Flask(__name__)

# Initialize AWS CloudWatch client
cloudwatch = boto3.client('cloudwatch', region_name='us-east-1')

# Sample product data for our online store
products = {
    '1': {'name': 'Product 1', 'price': 10.99},
    '2': {'name': 'Product 2', 'price': 19.99},
    '3': {'name': 'Product 3', 'price': 5.49}
}

@app.route('/')
def index():
    start_time = time.time()

    # Simulate processing time
    time.sleep(random.uniform(0.1, 0.5))

    # Log the page view metric to CloudWatch
    log_metric('PageViews', 1)

    # Log the response time metric to CloudWatch
    response_time = (time.time() - start_time) * 1000
    log_metric('ResponseTime', response_time)

    return "Welcome to our Online Store!"

@app.route('/product/<product_id>')
def product(product_id):
    start_time = time.time()

    # Simulate processing time
    time.sleep(random.uniform(0.2, 0.8))

    # Log the page view metric to CloudWatch
    log_metric('PageViews', 1)

    # Log the response time metric to CloudWatch
    response_time = (time.time() - start_time) * 1000
    log_metric('ResponseTime', response_time)

    if product_id in products:
        return f"Product: {products[product_id]['name']}, Price: ${products[product_id]['price']}"
    else:
        return "Product not found."

def log_metric(metric_name, value):
    # Send custom metric to CloudWatch
    cloudwatch.put_metric_data(
        Namespace='OnlineStore',
        MetricData=[{
            'MetricName': metric_name,
            'Value': value,
            'Unit': 'Count'
        }]
    )

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
