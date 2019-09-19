
Users
-----

column | data_type
-------|---------
id | integer
first_name | text
last_name | text
email | text
password | text
timestamp | datetime


Tasks
-----

column | data_type
-------|---------
id | integer
title | text
content | text
user_id | integer
timestamp | datetime


labels
------

column | data_type
-------|---------
id | integer
label_name | text
task_id | integer
timestamp | datetime
