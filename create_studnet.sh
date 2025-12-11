#!/bin/bash


groupadd -f students

students=(
    1023061622
)

for student in "${students[@]}"
do
    username="stu$student"
    useradd -m -s /bin/bash -g students "$username"


    echo "$username:123456789" | chpasswd


    chage -d 0 "$student"

done
