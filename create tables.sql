CREATE TABLE privacy_status
(
  status_id	  		tinyint unsigned NOT NULL,
  status_desc			varchar(255) NOT NULL,
  
  PRIMARY KEY (status_id)
);

INSERT INTO privacy_status
(status_id, status_desc)
VALUES
(0, "private"),
(1, "public"),
(2, "specified");

CREATE TABLE users
(
  user_id	          		int unsigned NOT NULL auto_increment,	# User ID.
  password_hash     		char(255) NOT NULL,						# Hash of user''s password.
  display_name	      	varchar(255) NOT NULL,					# User''s display name.
  timestamp_registered	timestamp NOT NULL,					# Timestamp of user''s registration.
  icon			          	mediumblob,								# User''s icon (optional).
  
  PRIMARY KEY (user_id)
);

CREATE TABLE task_status
(
  status_id			  int unsigned NOT NULL auto_increment,
  status_desc     varchar(255) NOT NULL,
  
  PRIMARY KEY (status_id)
);

INSERT INTO task_status (status_id, status_desc)
VALUES (0, 'Open', 1, 'Completed', 2, 'Cancelled', 3, 'Superseded');

CREATE TABLE tasks
(
  task_id			    int unsigned NOT NULL auto_increment,
  user_id         int unsigned NOT NULL, # ID of the user who owns the task.
  name            varchar(255) NOT NULL,
  timestamp_due	  timestamp NOT NULL,
  status          tinyint unsigned NOT NULL,
  privacy_status  tinyint unsigned NOT NULL,
  
  PRIMARY KEY (task_id),
  CONSTRAINT task_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT task_status_id FOREIGN KEY (status) REFERENCES task_status(status_id),
  CONSTRAINT task_privacy_status_id FOREIGN KEY (privacy_status) REFERENCES privacy_status(privacy_status_id)
);

CREATE TABLE task_links
(
  sub_task_id		        int unsigned NOT NULL,
  parent_task_id		      int unsigned NOT NULL,
  
  CONSTRAINT task_link_sub_task_id FOREIGN KEY (sub_task_id) REFERENCES tasks(task_id),
  CONSTRAINT task_link_parent_task_id FOREIGN KEY (parent_task_id) REFERENCES tasks(task_id)  
);

CREATE TABLE orgs
(
  org_id		      int unsigned NOT NULL auto_increment,
  name            varchar(255) NOT NULL,
  short_name      varchar(255) NOT NULL,
  
  PRIMARY KEY (org_id)
);

CREATE TABLE people
(
  person_id			    int unsigned NOT NULL auto_increment,
  name              varchar(255) NOT NULL,
  
  PRIMARY KEY (person_id)
);

CREATE TABLE roles
(
  org_id		      int unsigned NOT NULL,
  person_id		    int unsigned NOT NULL,
  title           varchar(255) NOT NULL,
  timestamp_start timestamp NOT NULL,
  timestamp_end	  timestamp,
  
  CONSTRAINT role_org_id FOREIGN KEY (org_id) REFERENCES orgs(org_id),
  CONSTRAINT role_person_id FOREIGN KEY (person_id) REFERENCES people(person_id)
);

CREATE TABLE org_links
(
  sub_org_id		        int unsigned NOT NULL,
  parent_org_id		      int unsigned NOT NULL,
  
  CONSTRAINT org_link_sub_org_id FOREIGN KEY (sub_org_id) REFERENCES orgs(org_id),
  CONSTRAINT org_link_parent_org_id FOREIGN KEY (parent_org_id) REFERENCES orgs(org_id)
);

CREATE TABLE phone_numbers
(
  person_id		      int unsigned NOT NULL,
  phone_number      varchar(255) NOT NULL,
  priority          tinyint unsigned NOT NULL,
  obsolete          boolean NOT NULL,
  can_receive_sms   boolean NOT NULL,
  
  CONSTRAINT phone_number_person_id FOREIGN KEY (person_id) REFERENCES people(person_id)
);

CREATE TABLE email_addresses
(
  person_id		      int unsigned NOT NULL,
  email_addresses   varchar(255) NOT NULL,
  priority          tinyint unsigned NOT NULL,
  obsolete          boolean NOT NULL,
  
  CONSTRAINT email_address_person_id FOREIGN KEY (person_id) REFERENCES people(person_id)
);

CREATE TABLE notes
(
  note_id	      int unsigned NOT NULL,
  text          varchar(255) NOT NULL,
  user_id       int unsigned NOT NULL,
  
  PRIMARY KEY (note_id),
  CONSTRAINT note_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);