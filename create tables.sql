CREATE TABLE privacy_status
(
  status_id	  		tinyint unsigned NOT NULL,
  status_desc			varchar(255) NOT NULL,
  
  PRIMARY KEY (status_id)
);

INSERT INTO privacy_status
(status_id, status_desc)
VALUES
(0, "public"),
(1, "private"),
(2, "specified");

CREATE TABLE deletion_status
(
  status_id	  		tinyint unsigned NOT NULL,
  status_desc			varchar(255) NOT NULL,
  
  PRIMARY KEY (status_id)
);

INSERT INTO deletion_status
(status_id, status_desc)
VALUES
(0, "not deleted"),
(1, "deleted"),
(2, "superseded");

CREATE TABLE users
(
  user_id	          		int unsigned NOT NULL auto_increment,	# User ID.
  password_hash     		varchar(255) NOT NULL,						# Hash of user''s password.
  display_name	      	varchar(255) NOT NULL,					# User''s display name.
  timestamp_registered	timestamp,					# Timestamp of user''s registration.
  icon			          	mediumblob,								# User''s icon (optional).
  
  PRIMARY KEY (user_id)
);

CREATE TABLE task_status
(
  status_id			  tinyint unsigned NOT NULL,
  status_desc     varchar(255) NOT NULL,
  
  PRIMARY KEY (status_id)
);

INSERT INTO task_status (status_id, status_desc)
VALUES
(0, 'Open'), 
(1, 'Completed'),
(2, 'Cancelled'),
(3, 'Superseded');

CREATE TABLE tasks
(
  task_id			    int unsigned NOT NULL auto_increment,
  user_id         int unsigned NOT NULL, # ID of the user who owns the task.
  name            varchar(255) NOT NULL,
  timestamp_due	  timestamp,
  status          tinyint unsigned NOT NULL,
  privacy_status  tinyint unsigned NOT NULL,
  deletion_status  tinyint unsigned NOT NULL,
  
  PRIMARY KEY (task_id),
  CONSTRAINT task_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT task_status_id FOREIGN KEY (status) REFERENCES task_status(status_id),
  CONSTRAINT task_privacy_status_id FOREIGN KEY (privacy_status) REFERENCES privacy_status(status_id),
  CONSTRAINT task_deletion_status_id FOREIGN KEY (deletion_status) REFERENCES deletion_status(status_id)
);

CREATE TABLE task_hierarchy
(
  sub_task_id		        int unsigned NOT NULL,
  parent_task_id		      int unsigned NOT NULL,
  
  CONSTRAINT task_hierarchy_sub_task_id FOREIGN KEY (sub_task_id) REFERENCES tasks(task_id),
  CONSTRAINT task_hierarchy_parent_task_id FOREIGN KEY (parent_task_id) REFERENCES tasks(task_id)  
);

CREATE TABLE orgs
(
  org_id		      int unsigned NOT NULL auto_increment,
  name            varchar(255) NOT NULL,
  short_name      varchar(255),
  
  PRIMARY KEY (org_id)
);

CREATE TABLE user_groups
(
  user_group_id   int unsigned NOT NULL auto_increment,
  name            varchar(255) NOT NULL,
);

CREATE TABLE user_groups_orgs
(
  user_group_id           int unsigned NOT NULL,
  org_id                  int unsigned NOT NULL,
  
  CONSTRAINT user_groups_orgs_user_group_id FOREIGN KEY (user_group_id) REFERENCES user_groups(user_group_id),
  CONSTRAINT user_groups_orgs_org_id FOREIGN KEY (org_id) REFERENCES orgs(org_id)
);

CREATE TABLE users_user_groups
(
  user_id       int unsigned NOT NULL,
  user_group_id int unsigned NOT NULL,
  
  CONSTRAINT users_user_groups_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT users_user_groups_user_group_id FOREIGN KEY (user_group_id) REFERENCES user_groups(user_group_id)
);

CREATE TABLE people
(
  person_id			    int unsigned NOT NULL auto_increment,
  name              varchar(255) NOT NULL,
  
  PRIMARY KEY (person_id)
);

CREATE TABLE users_people
(
  user_id           int unsigned NOT NULL,
  person_id         int unsigned NOT NULL,
  
  CONSTRAINT users_people_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT users_people_person_id FOREIGN KEY (person_id) REFERENCES people(person_id)
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

CREATE TABLE org_relationship_types
(
  org_relationship_type_id      int unsigned NOT NULL auto_increment,
  org_relationship_type_desc    varchar(255) NOT NULL,
  is_reciprocal                 boolean NOT NULL,
  
  PRIMARY KEY (org_relationship_type_id)
);

INSERT INTO org_relationship_types
(org_relationship_type_id, org_relationship_type_desc, is_reciprocal)
VALUES
(1, "Parent organization", 0),
(2, "Fiscal sponsor", 0),
(3, "Partner", 1);

CREATE TABLE org_relationships
(
  org1_id		                  int unsigned NOT NULL,
  org2_id	  	                int unsigned NOT NULL,
  org_relationship_type_id    int unsigned NOT NULL,
  
  CONSTRAINT org_relationships_org1_id FOREIGN KEY (org1_id) REFERENCES orgs(org_id),
  CONSTRAINT org_relationships_org2_org_id FOREIGN KEY (org2_id) REFERENCES orgs(org_id),
  CONSTRAINT org_relationships_org_relationship_type_id FOREIGN KEY (org_relationship_type_id) REFERENCES org_relationship_types(org_relationship_type_id)
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
  text          varchar(65535) NOT NULL,
  user_id       int unsigned NOT NULL,
  
  PRIMARY KEY (note_id),
  CONSTRAINT note_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);