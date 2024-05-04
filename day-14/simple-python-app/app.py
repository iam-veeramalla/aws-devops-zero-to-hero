from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Successfull deployment of Python App on Flask using AWS CodePipeline!'

if __name__ == '__main__':
    app.run()