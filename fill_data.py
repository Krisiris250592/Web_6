import sqlite3
from faker import Faker
from main import database
from random import randint, choice
from datetime import datetime


NUMBER_STUDENTS = 30
NUMBER_GRADES = 20
NUMBER_TEACHERS = 5
SUBJECTS = ['Mathematics',
            'Algebra',
            'Geometry',
            'Science',
            'Geography',
            'History',
            'English']
GROUPS = ['A',
          'B',
          'C']

DATE = ['2.10.2024',
        '3.10.2024']

fake = Faker('uk_UA')
connect = sqlite3.connect(database)
cur = connect.cursor()


def seed_teachers():
    teachers = [(fake.first_name(), fake.last_name()) for _ in range(NUMBER_TEACHERS)]
    sql = "INSERT INTO teachers (first_name,last_name) VALUES(?,?);"
    cur.executemany(sql, teachers)
    connect.commit()


def seed_groups():
    sql = "INSERT INTO groups(name) VALUES(?);"
    cur.executemany(sql, GROUPS)
    connect.commit()


def seed_students():
    students = [(fake.first_name(), randint(1, len(GROUPS))) for _ in range(NUMBER_STUDENTS)]
    sql = "INSERT INTO students (name, group_id) VALUES(?, ?);"
    cur.executemany(sql, students)
    connect.commit()


def seed_subjects():
    subjects = [(i, randint(1, 5)) for i in SUBJECTS]
    sql = "INSERT INTO subjects (name, teacher_id) VALUES(?, ?);"
    cur.executemany(sql, subjects)
    connect.commit()


def seed_grades():
    date_list = [datetime.strptime(date, "%d.%m.%Y")for date in DATE]
    grades = [(randint(1, 30), randint(1, len(SUBJECTS)), randint(3, 5), choice(date_list)) for _ in range(30)]
    sql = "INSERT INTO grades (student_id, subject_id, grade, date_of) VALUES(?, ?, ?, ?);"
    cur.executemany(sql, grades)
    connect.commit()


if __name__ == "__main__":
    # seed_teachers()
    # seed_groups()
    # seed_students()
    seed_grades()
