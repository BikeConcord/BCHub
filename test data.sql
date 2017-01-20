INSERT INTO people
(person_id, name)
VALUES
(1, "Ady Olvera"),
(2, "Smitty Ardrey"),
(3, "Kenji Yamada"),
(4, "Amy Ma"),
(5, "Claire Linder"),
(6, "Sergio Huerta"),
(7, "Aaron McHugh"),
(8, "David Schomaker"),
(9, "Ford Tivakul"),
(10, "Ana Villalobos"),
(101, "Laura Hoffmeister");

INSERT INTO users
(user_id, display_name, password_hash)
VALUES
(1, "Ady Olvera", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS"),
(2, "Smitty Ardrey", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS"),
(3, "Kenji Yamada", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS"),
(4, "Amy Ma", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS"),
(5, "Claire Linder", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS"),
(6, "Sergio Huerta", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS"),
(7, "Aaron McHugh", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS"),
(8, "David Schomaker", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS"),
(9, "Ford Tivakul", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS"),
(10, "Ana Villalobos", "$2y$10$K8.2egz5x74pFzVSoTG5H.N01QjpNibNMsQQbDe.wLi9cDavlbHhS");

INSERT INTO tasks
(task_id, user_id, name, timestamp_due, status, privacy_status, deletion_status)
VALUES
(1, 3, "Advocacy", NULL, 0, 0, 0),
(2, 2, "Bike Works", NULL, 0, 0, 0),
(3, 1, "Wrench Raising", NULL, 0, 0, 0),
(4, 2, "Community Bicycle Shop", NULL, 0, 0, 0),
(101, 2, "Secure initial location for CBS", NULL, 0, 0, 0),
(102, 3, "SR-242 ramps project", NULL, 0, 0, 0);

INSERT INTO task_hierarchy
(sub_task_id, parent_task_id)
VALUES
(4, 1),
(101, 2),
(102, 1);

INSERT INTO people_groups
(people_group_id, name, short_name)
VALUES
(1, "Bike Concord", "Bike Concord", 1),
(2, "City of Concord", "City", 1),
(3, "Contra Costa Transportation Authority", "CCTA", 1),
(4, "Monument Impact", "MI", 1),
(5, "First Five Contra Costa", "FFCC", 1),
(6, "Central County Regional Group", "CCRG", 1),
(7, "Bike East Bay", "BEB", 1),
(8, "Contra Costa Health Services", "CCHS", 1),
(9, "Advocacy Committee", "AdCom", 1),
(10, "Planning Division", "Planning Division", 1),
(11, "City Council", "Council", 1),
(12, "Leadership Committee", "Leadership", 1);

INSERT INTO user_groups
(user_group_id, name)
VALUES
(1, "Bike Concord"),
(2, "Leadership Committee"),
(3, "Advocacy Committee"),
(4, "Bike Works Committee"),
(5, "Partners of BC");

INSERT INTO user_groups_people_groups
(user_group_id, people_group_id)
VALUES
(1, 1),
(2, 12),
(3, 9);

INSERT INTO users_user_groups
(user_id, user_group_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4);

INSERT INTO roles
(people_group_id, person_id, title, timestamp_start, timestamp_end)
VALUES
(1, 1, "Programs Coordinator", '2015-06-18', NULL),
(1, 2, "Instigator", '2013-10-05', NULL),
(9, 3, "Lead Advocacy Organizer", '2014-09-28', NULL);

INSERT INTO people_group_relationships
(people_group1_id, people_group2_id, people_group_relationship_type_id)
VALUES
(1, 9, 1),
(2, 10, 1),
(1, 7, 3),
(1, 12, 1),
(1, 7, 3),
(1, 6, 3);
