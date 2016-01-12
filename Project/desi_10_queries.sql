#1 How many users are in the group with group.id = 2?
SELECT COUNT(user_id)
    FROM `user_group`
        WHERE group_id = 2;

#2 Who is the desi for task "Empty Dishwasher" in
#  the group with group.id = 1?

SELECT username
  FROM `user_group` 
  NATURAL JOIN `user_group_task`
  NATURAL JOIN `task`
  NATURAL JOIN `user`
  WHERE group_id = 1
    AND task_name = "Empty Dishwasher"
    AND is_desi = 1;

#3 How many groups is user with username "mwflickner" in?
SELECT COUNT(user_id)
  FROM `user_group` NATURAL JOIN `user`
    WHERE username = "mwflickner";

#4 How many points does user "mwflickner" have in task
#  "Take Out Trash" in group with group.id = 1?
SELECT points from `user_group_task`
  NATURAL JOIN `user_group`
  NATURAL JOIN `task`
  NATURAL JOIN `user`
  WHERE task_name = "Take out trash"
  AND group_id = 1
  AND username = "mwflickner";
    

#5 When has the task "Empty Dishwasher"
#  in group with group.id = 1 been completed?
SELECT completed_date
  FROM `completion` NATURAL JOIN `user_group_task_action`
  NATURAL JOIN `user_group_task`
  NATURAL JOIN `task`
  NATURAL JOIN `user_group`
  WHERE group_id = 1
  AND task_name = "Empty Dishwasher";

#6 What is the first name and the last name
#  of the user with user.id = 2?
SELECT user.first_name, user.last_name
  FROM `user`
    WHERE user.user_id = 2;


#7 How many points does user with user.user_id = 1
#  have among all of his tasks in group with
#  group.id = 3?
SELECT SUM(points) FROM `user_group_task`
  NATURAL JOIN `user_group`
  WHERE user_id = 1 AND group_id = 3;


#8 How many points does user with user.user_id = 1
#  have among all of his tasks in all of his groups?

SELECT SUM(points) FROM `user_group_task`
  NATURAL JOIN `user_group`
  WHERE user_id = 1;

#9 How many points are there
#  total in this application?
SELECT SUM(user_group_task.points)
  FROM `user_group_task`;

#10 Who are the users who have performed an opt out?
SELECT user_id, username FROM `user_group` NATURAL JOIN `user`
WHERE user_group_id = (SELECT
  user_group_id FROM `user_group_task`
  WHERE user_group_task_id = (SELECT
      user_group_task_id FROM `user_group_task_action`
      WHERE task_action_id = (SELECT
        task_action_id FROM `opt_out`
      )
    )
);






