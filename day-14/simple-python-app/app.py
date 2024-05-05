from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/calculate', methods=['POST'])
def calculate():
    # Get grades and credits from form
    grades = request.form.getlist('grade')
    credits = request.form.getlist('credit')

    # Convert grades to numerical values
    grade_points = {
        'A': 4.0,
        'B': 3.0,
        'C': 2.0,
        'D': 1.0,
        'F': 0.0
    }

    # Calculate total grade points and total credits
    total_grade_points = sum(grade_points[grade] * float(credit) for grade, credit in zip(grades, credits))
    total_credits = sum(float(credit) for credit in credits)

    # Calculate GPA
    if total_credits > 0:
        gpa = total_grade_points / total_credits
    else:
        gpa = 0.0

    return render_template('result.html', gpa=gpa)

if __name__ == '__main__':
    app.run(debug=True)
