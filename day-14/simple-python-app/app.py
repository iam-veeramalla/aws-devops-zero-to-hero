def more_classes():
    total_points = 0
    total_credits = 0

    while True:
        credits = int(input("Enter number of credits: "))
        print("No. of credits are:", credits)

        grade = input("Enter grade: ").upper()
        print("Grade is:", grade)

        grade_value = 0

        if grade == "A":
            grade_value = 4
        elif grade == "B":
            grade_value = 3
        elif grade == "C":
            grade_value = 2
        elif grade == "D":
            grade_value = 1
        elif grade == "F":
            grade_value = 0
        else:
            print("Please enter valid grades.")
            continue

        points = grade_value * credits
        print("Points:", points)

        total_points += points
        total_credits += credits
        print("Total Points:", total_points)
        print("Total Credits:", total_credits)

        more_classes = input("Do you want to add another class? (Y/N): ")
        if more_classes.upper() != "Y":
            break

    gpa = total_points / total_credits if total_credits > 0 else 0
    print("GPA is:", gpa)


def main():
    more_classes()


if __name__ == "__main__":
    main()
