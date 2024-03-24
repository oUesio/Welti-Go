PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2024-03-20 19:00:07.604043');
INSERT INTO django_migrations VALUES(2,'contenttypes','0002_remove_content_type_name','2024-03-20 19:00:07.618128');
INSERT INTO django_migrations VALUES(3,'auth','0001_initial','2024-03-20 19:00:07.643697');
INSERT INTO django_migrations VALUES(4,'auth','0002_alter_permission_name_max_length','2024-03-20 19:00:07.654506');
INSERT INTO django_migrations VALUES(5,'auth','0003_alter_user_email_max_length','2024-03-20 19:00:07.662453');
INSERT INTO django_migrations VALUES(6,'auth','0004_alter_user_username_opts','2024-03-20 19:00:07.670805');
INSERT INTO django_migrations VALUES(7,'auth','0005_alter_user_last_login_null','2024-03-20 19:00:07.681239');
INSERT INTO django_migrations VALUES(8,'auth','0006_require_contenttypes_0002','2024-03-20 19:00:07.686313');
INSERT INTO django_migrations VALUES(9,'auth','0007_alter_validators_add_error_messages','2024-03-20 19:00:07.694210');
INSERT INTO django_migrations VALUES(10,'auth','0008_alter_user_username_max_length','2024-03-20 19:00:07.702355');
INSERT INTO django_migrations VALUES(11,'auth','0009_alter_user_last_name_max_length','2024-03-20 19:00:07.710962');
INSERT INTO django_migrations VALUES(12,'auth','0010_alter_group_name_max_length','2024-03-20 19:00:07.721544');
INSERT INTO django_migrations VALUES(13,'auth','0011_update_proxy_permissions','2024-03-20 19:00:07.732377');
INSERT INTO django_migrations VALUES(14,'auth','0012_alter_user_first_name_max_length','2024-03-20 19:00:07.742316');
INSERT INTO django_migrations VALUES(15,'api','0001_initial','2024-03-20 19:00:07.820086');
INSERT INTO django_migrations VALUES(16,'admin','0001_initial','2024-03-20 19:00:07.840764');
INSERT INTO django_migrations VALUES(17,'admin','0002_logentry_remove_auto_add','2024-03-20 19:00:07.855214');
INSERT INTO django_migrations VALUES(18,'admin','0003_logentry_add_action_flag_choices','2024-03-20 19:00:07.865706');
INSERT INTO django_migrations VALUES(19,'authtoken','0001_initial','2024-03-20 19:00:07.880700');
INSERT INTO django_migrations VALUES(20,'authtoken','0002_auto_20160226_1747','2024-03-20 19:00:07.923311');
INSERT INTO django_migrations VALUES(21,'authtoken','0003_tokenproxy','2024-03-20 19:00:07.930390');
INSERT INTO django_migrations VALUES(22,'sessions','0001_initial','2024-03-20 19:00:07.941129');
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(4,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(5,'sessions','session');
INSERT INTO django_content_type VALUES(6,'api','locationtype');
INSERT INTO django_content_type VALUES(7,'api','monstertype');
INSERT INTO django_content_type VALUES(8,'api','tasktype');
INSERT INTO django_content_type VALUES(9,'api','user');
INSERT INTO django_content_type VALUES(10,'api','location');
INSERT INTO django_content_type VALUES(11,'api','monster');
INSERT INTO django_content_type VALUES(12,'api','task');
INSERT INTO django_content_type VALUES(13,'api','taskverification');
INSERT INTO django_content_type VALUES(14,'authtoken','token');
INSERT INTO django_content_type VALUES(15,'authtoken','tokenproxy');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(14,4,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(15,4,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(16,4,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(17,5,'add_session','Can add session');
INSERT INTO auth_permission VALUES(18,5,'change_session','Can change session');
INSERT INTO auth_permission VALUES(19,5,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(20,5,'view_session','Can view session');
INSERT INTO auth_permission VALUES(21,6,'add_locationtype','Can add location type');
INSERT INTO auth_permission VALUES(22,6,'change_locationtype','Can change location type');
INSERT INTO auth_permission VALUES(23,6,'delete_locationtype','Can delete location type');
INSERT INTO auth_permission VALUES(24,6,'view_locationtype','Can view location type');
INSERT INTO auth_permission VALUES(25,7,'add_monstertype','Can add monster type');
INSERT INTO auth_permission VALUES(26,7,'change_monstertype','Can change monster type');
INSERT INTO auth_permission VALUES(27,7,'delete_monstertype','Can delete monster type');
INSERT INTO auth_permission VALUES(28,7,'view_monstertype','Can view monster type');
INSERT INTO auth_permission VALUES(29,8,'add_tasktype','Can add task type');
INSERT INTO auth_permission VALUES(30,8,'change_tasktype','Can change task type');
INSERT INTO auth_permission VALUES(31,8,'delete_tasktype','Can delete task type');
INSERT INTO auth_permission VALUES(32,8,'view_tasktype','Can view task type');
INSERT INTO auth_permission VALUES(33,9,'add_user','Can add user');
INSERT INTO auth_permission VALUES(34,9,'change_user','Can change user');
INSERT INTO auth_permission VALUES(35,9,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(36,9,'view_user','Can view user');
INSERT INTO auth_permission VALUES(37,10,'add_location','Can add location');
INSERT INTO auth_permission VALUES(38,10,'change_location','Can change location');
INSERT INTO auth_permission VALUES(39,10,'delete_location','Can delete location');
INSERT INTO auth_permission VALUES(40,10,'view_location','Can view location');
INSERT INTO auth_permission VALUES(41,11,'add_monster','Can add monster');
INSERT INTO auth_permission VALUES(42,11,'change_monster','Can change monster');
INSERT INTO auth_permission VALUES(43,11,'delete_monster','Can delete monster');
INSERT INTO auth_permission VALUES(44,11,'view_monster','Can view monster');
INSERT INTO auth_permission VALUES(45,12,'add_task','Can add task');
INSERT INTO auth_permission VALUES(46,12,'change_task','Can change task');
INSERT INTO auth_permission VALUES(47,12,'delete_task','Can delete task');
INSERT INTO auth_permission VALUES(48,12,'view_task','Can view task');
INSERT INTO auth_permission VALUES(49,13,'add_taskverification','Can add task verification');
INSERT INTO auth_permission VALUES(50,13,'change_taskverification','Can change task verification');
INSERT INTO auth_permission VALUES(51,13,'delete_taskverification','Can delete task verification');
INSERT INTO auth_permission VALUES(52,13,'view_taskverification','Can view task verification');
INSERT INTO auth_permission VALUES(53,14,'add_token','Can add Token');
INSERT INTO auth_permission VALUES(54,14,'change_token','Can change Token');
INSERT INTO auth_permission VALUES(55,14,'delete_token','Can delete Token');
INSERT INTO auth_permission VALUES(56,14,'view_token','Can view Token');
INSERT INTO auth_permission VALUES(57,15,'add_tokenproxy','Can add token');
INSERT INTO auth_permission VALUES(58,15,'change_tokenproxy','Can change token');
INSERT INTO auth_permission VALUES(59,15,'delete_tokenproxy','Can delete token');
INSERT INTO auth_permission VALUES(60,15,'view_tokenproxy','Can view token');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "api_locationtype" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(200) NOT NULL UNIQUE, "description" text NULL);
INSERT INTO api_locationtype VALUES(1,'Recycle Point','');
INSERT INTO api_locationtype VALUES(2,'Building','');
CREATE TABLE IF NOT EXISTS "api_monstertype" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(200) NOT NULL UNIQUE, "picture" varchar(100) NULL, "description" text NULL);
INSERT INTO api_monstertype VALUES(1,'Blob','uploaded/monsters/Blob_4uhV9Dd.png','');
INSERT INTO api_monstertype VALUES(2,'Bonepos','uploaded/monsters/Bonepos.png','');
INSERT INTO api_monstertype VALUES(3,'Chickpick','uploaded/monsters/Chickpick_ybkaJU0.png','');
INSERT INTO api_monstertype VALUES(4,'Gunth','uploaded/monsters/Gunth.png','');
INSERT INTO api_monstertype VALUES(5,'Loom','uploaded/monsters/Loom.png','');
INSERT INTO api_monstertype VALUES(6,'Sockub','uploaded/monsters/Sockub.png','');
INSERT INTO api_monstertype VALUES(7,'Sparret','uploaded/monsters/Sparret.png','');
INSERT INTO api_monstertype VALUES(8,'Torrentoise','uploaded/monsters/Torrentoise.png','');
INSERT INTO api_monstertype VALUES(9,'Veneam','uploaded/monsters/Veneam.png','');
INSERT INTO api_monstertype VALUES(10,'Vorp','uploaded/monsters/Vorp.png','');
CREATE TABLE IF NOT EXISTS "api_tasktype" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(200) NOT NULL UNIQUE, "description" text NULL);
INSERT INTO api_tasktype VALUES(1,'Recycle','When a player does something where they recycle something.');
INSERT INTO api_tasktype VALUES(2,'Quiz','This is when a player is asked various questions as part of a quiz.');
INSERT INTO api_tasktype VALUES(3,'Purchase','This is when a player makes a decision on a purchase that is a more eco-friendly and sustainable version of something.');
INSERT INTO api_tasktype VALUES(4,'Share','When a player shares a status or photo etc onto social media that is promoting sustainable and eco-friendly living.');
CREATE TABLE IF NOT EXISTS "api_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(150) NOT NULL, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "email_confirmed" bool NOT NULL);
INSERT INTO api_user VALUES(1,'pbkdf2_sha256$720000$ehmjr9kf6nbY4rVn1azSpI$nAq47Hq0ayaf81a1U6EZ+67qO3sucjskYC9tFmS6GVI=','2024-03-20 19:01:56.548687',1,'admin','','','admin@example.com',1,1,'2024-03-20 19:01:33.506691',0);
INSERT INTO api_user VALUES(2,'pbkdf2_sha256$720000$8wN62bKKbGUsH3CwmyHZPG$qmQ0pgCYhHxrKeBlaL3gGljumSzFl3nwAmPmoY4kRHY=',NULL,0,'johnsmith','John','Smith','john@example.com',0,1,'2024-03-20 20:01:21.723910',0);
CREATE TABLE IF NOT EXISTS "api_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" bigint NOT NULL REFERENCES "api_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "api_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" bigint NOT NULL REFERENCES "api_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CCREATE TABLE IF NOT EXISTS "api_location" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(200) NOT NULL UNIQUE, "longitude" varchar(200) NOT NULL, "latitude" varchar(200) NOT NULL, "description" text NULL, "type_id" bigint NOT NULL REFERENCES "api_locationtype" ("id") DEFERRABLE INITIALLY DEFERRED, "task_slot1_id" bigint NULL REFERENCES "api_task" ("id") DEFERRABLE INITIALLY DEFERRED, "task_slot2_id" bigint NULL REFERENCES "api_task" ("id") DEFERRABLE INITIALLY DEFERRED, "task_slot3_id" bigint NULL REFERENCES "api_task" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO api_location VALUES(1,'INTO','-3.5336984457699394','50.7363279283402','',2,5,6,7);
INSERT INTO api_location VALUES(2,'Peter Chalk','-3.535975245769926','50.736325387118086','',2,2,3,4);
INSERT INTO api_location VALUES(3,'Streatham Court','-3.53092028994958','50.73589298893594','',2,8,9,10);
INSERT INTO api_location VALUES(4,'Amory','-3.531684389949515','50.736672146278565','',2,11,12,13);
INSERT INTO api_location VALUES(5,'Harrisson','-3.5326732769422953','50.7378497367553','',2,14,15,16);
INSERT INTO api_location VALUES(6,'The Forum','-3.5337217034418655','50.7353738201005','',2,17,18,19);
INSERT INTO api_location VALUES(7,'SWIoT','-3.530605989949407','50.73816689014049','',2,20,21,22);
CREATE TABLE IF NOT EXISTS "api_monster" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "obtained" datetime NOT NULL, "user_id" bigint NOT NULL REFERENCES "api_user" ("id") DEFERRABLE INITIALLY DEFERRED, "type_id" bigint NOT NULL REFERENCES "api_monstertype" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO api_monster VALUES(1,'2024-03-20 20:02:47.106165',2,1);
INSERT INTO api_monster VALUES(2,'2024-03-20 20:02:52.229937',2,5);
INSERT INTO api_monster VALUES(3,'2024-03-20 20:03:07.752816',2,10);
CREATE TABLE IF NOT EXISTS "api_task" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(200) NOT NULL UNIQUE, "task_description" text NULL, "verify_instructions" text NULL, "verify_example_photo" varchar(100) NULL, "monster_slot1_chance" integer NULL, "monster_slot2_chance" integer NULL, "location_id" bigint NOT NULL REFERENCES "api_location" ("id") DEFERRABLE INITIALLY DEFERRED, "monster_slot1_id" bigint NULL REFERENCES "api_monstertype" ("id") DEFERRABLE INITIALLY DEFERRED, "monster_slot2_id" bigint NULL REFERENCES "api_monstertype" ("id") DEFERRABLE INITIALLY DEFERRED, "type_id" bigint NOT NULL REFERENCES "api_tasktype" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO api_task VALUES(1,'Bin it to win it','Recycle your waste at one of the recycling bin points around campus -- show what you''re recycling and what bin you''re using.','- Check that the bin and object to recycle is clearly visible in the photo and verify that whatevever is being recylced is being put in the correct bin.','uploaded/verify/example/Screenshot_from_2024-03-14_21-10-22.png',100,100,1,NULL,NULL,1);
INSERT INTO api_task VALUES(2,'Paper recycling','Submit a photo of putting paper in recycling','check if a user adds paper to recycling','uploaded/verify/example/paper_recycling.png',20,80,2,5,9,1);
INSERT INTO api_task VALUES(3,'finish meal','post a picture of your finished meal in a reusable container','check users social media for the relevant picture','uploaded/verify/example/finish_meal.png',100,100,2,NULL,NULL,4);
INSERT INTO api_task VALUES(4,'Use a reusable coffee cup in a cafe','Make a social media post of you using a reusable coffee cup in a cafe','Find relevant social media post in user social media account','uploaded/verify/example/post_in_social_media.png',100,100,2,NULL,NULL,4);
INSERT INTO api_task VALUES(5,'bring and finish home made meal','Post a photo of bringing and finishing a homemade meal in a reusable container','Find a relevant photo in users social media','uploaded/verify/example/post_in_social_media_zwEcaI7.png',70,30,1,3,9,4);
INSERT INTO api_task VALUES(6,'Recycle something','Submit a photo of yourself throwing suitable trash in a recycle bin','check if a user throws suitable trash in a recycle bin','uploaded/verify/example/paper_recycling_1wGS1aG.png',10,90,1,4,6,1);
INSERT INTO api_task VALUES(7,'step counter','post a photo of your step counter with a minimum of 5 thousand steps on your social media','check if a photo of a step counter on users social media has a minimum of 5 thousand steps','uploaded/verify/example/step_counter.png',10,90,1,4,5,4);
INSERT INTO api_task VALUES(8,'Paper recycling 1','submit a photo of you putting paper in a recycling bin','Check a photo of a user for putting paper in a recycling bin','uploaded/verify/example/paper_recycling_zBs0Z3j.png',50,50,3,4,8,1);
INSERT INTO api_task VALUES(9,'bike photo','Post a photo of your bike near the building','Check if a user posted a photo of a bike near a relevant building on their social media','uploaded/verify/example/post_in_social_media_pxyuUnp.png',10,90,3,2,7,4);
INSERT INTO api_task VALUES(10,'eat a homemade meal','post a photo of you finishing a homemade meal in a reusable container','Check user''s social media for the finished meal in a reusable container','uploaded/verify/example/post_in_social_media_fJcdmvb.png',1,99,3,5,7,4);
INSERT INTO api_task VALUES(11,'Paper recycling 2','Submit a photo of you throwing a paper to the recycling bin','Check a photo for a user throwing a paper to the recycling bin','uploaded/verify/example/paper_recycling_XN3OGJr.png',99,1,4,4,7,1);
INSERT INTO api_task VALUES(12,'bike photo 1','submit a photo of your bike near a relevant location','check if a there is a photo of user''s bike near a relevant location','',1,99,4,5,6,4);
INSERT INTO api_task VALUES(13,'coffee in a reusable coffee cup','Submit a picture of buying a coffee in your reusable cup in a local cafe','Check if the submission contains a picture of buying a coffee in user''s reusable cup in a local cafe','uploaded/verify/example/reusable_cup.png',1,99,4,3,1,3);
INSERT INTO api_task VALUES(14,'Paper recycling 3','submit a photo of you putting paper into the recycling bin','Check if a photo contains a user putting paper into the recycling bin','uploaded/verify/example/paper_recycling_7STiPwe.png',1,99,5,2,5,1);
INSERT INTO api_task VALUES(15,'step counter 1','Post on social media a photo of your step counter with a minimum of 5 thousand steps','Check if users'' photo on social media contains a step counter with a minimum of 5 thousand steps','uploaded/verify/example/step_counter_68wHokn.png',1,99,5,2,7,4);
INSERT INTO api_task VALUES(16,'coffee in a reusable cup','Submit a picture of you buying a coffee in a reusable cup in a local cafe','check a submitted photo for a reusable cup','uploaded/verify/example/reusable_cup_xfwIDKy.png',1,100,5,6,8,3);
INSERT INTO api_task VALUES(17,'too good to go bag','Submit a photo of getting too good to go bag from the forum','check a photo on user getting a food bag from the Forum','uploaded/verify/example/food_bag.png',1,98,6,5,9,3);
INSERT INTO api_task VALUES(18,'reusable bag','Post yourself using a reusable bag while shopping in the Forum','Check users social media for the reusable bag in forum','uploaded/verify/example/reusable_bag.png',1,98,6,9,10,4);
INSERT INTO api_task VALUES(19,'bike photo 2','Post a picture of your bike near the Forum','check a user''s social media for picture of a bike','uploaded/verify/example/bike.png',1,99,6,2,6,4);
INSERT INTO api_task VALUES(20,'Recycle something 1','Post a picture of you throwing relevant trash into a recycling bin','check a photo for a user throwing relevant trash into a recycling bin','uploaded/verify/example/recycling.png',99,NULL,7,1,9,1);
INSERT INTO api_task VALUES(21,'step counter 2','Post your step counter on social media with a minimum of 5 thousand steps','Check user''s social media for a step counter with a minimum of 5 thousand steps','uploaded/verify/example/step_counter_BIs3UMe.png',1,99,7,3,7,4);
INSERT INTO api_task VALUES(22,'eat a homemade meal 1','Post on social media you finishing a homemade meal in a reusable container','Check user''s social media for a finished homemade meal in a reusable container','uploaded/verify/example/post_in_social_media_CYDHYns.png',1,99,7,1,10,4);
CREATE TABLE IF NOT EXISTS "api_taskverification" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "photo" varchar(100) NULL, "date_created" datetime NOT NULL, "date_verified" datetime NULL, "verified" bool NOT NULL, "task_id" bigint NOT NULL REFERENCES "api_task" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" bigint NOT NULL REFERENCES "api_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO api_taskverification VALUES(1,'uploaded/verify/recycling-example_t7XdUck.jpg','2024-03-20 20:20:21.562316',NULL,0,1,2);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" bigint NOT NULL REFERENCES "api_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
INSERT INTO django_admin_log VALUES(1,'1','Recycle Point',1,'[{"added": {}}]',6,1,'2024-03-20 19:06:06.331796');
INSERT INTO django_admin_log VALUES(2,'2','Building',1,'[{"added": {}}]',6,1,'2024-03-20 19:06:35.788168');
INSERT INTO django_admin_log VALUES(3,'1','Recycle',1,'[{"added": {}}]',8,1,'2024-03-20 19:08:57.575796');
INSERT INTO django_admin_log VALUES(4,'2','Quiz',1,'[{"added": {}}]',8,1,'2024-03-20 19:09:10.350880');
INSERT INTO django_admin_log VALUES(5,'3','Purchase',1,'[{"added": {}}]',8,1,'2024-03-20 19:09:27.283070');
INSERT INTO django_admin_log VALUES(6,'4','Share',1,'[{"added": {}}]',8,1,'2024-03-20 19:09:43.539656');
INSERT INTO django_admin_log VALUES(7,'1','INTO',1,'[{"added": {}}]',10,1,'2024-03-20 19:12:05.637308');
INSERT INTO django_admin_log VALUES(8,'1','Bin it to win it',1,'[{"added": {}}]',12,1,'2024-03-20 19:12:35.071930');
INSERT INTO django_admin_log VALUES(9,'1','INTO',2,'[{"changed": {"fields": ["Task slot1"]}}]',10,1,'2024-03-20 19:15:32.641818');
INSERT INTO django_admin_log VALUES(10,'2','Peter Chalk',1,'[{"added": {}}]',10,1,'2024-03-20 19:39:58.656517');
INSERT INTO django_admin_log VALUES(11,'3','Streatham Court',1,'[{"added": {}}]',10,1,'2024-03-20 19:40:37.926916');
INSERT INTO django_admin_log VALUES(12,'4','Amory',1,'[{"added": {}}]',10,1,'2024-03-20 19:41:02.868678');
INSERT INTO django_admin_log VALUES(13,'5','Harrisson',1,'[{"added": {}}]',10,1,'2024-03-20 19:41:35.229096');
INSERT INTO django_admin_log VALUES(14,'6','The Forum',1,'[{"added": {}}]',10,1,'2024-03-20 19:42:17.739554');
INSERT INTO django_admin_log VALUES(15,'7','SWIoT',1,'[{"added": {}}]',10,1,'2024-03-20 19:43:45.599929');
INSERT INTO django_admin_log VALUES(16,'1','INTO',2,'[{"changed": {"fields": ["Longitude", "Latitude"]}}]',10,1,'2024-03-20 19:44:24.623981');
INSERT INTO django_admin_log VALUES(17,'3','Streatham Court',2,'[{"changed": {"fields": ["Longitude", "Latitude"]}}]',10,1,'2024-03-20 19:45:11.579312');
INSERT INTO django_admin_log VALUES(18,'4','Amory',2,'[{"changed": {"fields": ["Longitude", "Latitude"]}}]',10,1,'2024-03-20 19:46:01.682821');
INSERT INTO django_admin_log VALUES(19,'5','Harrisson',2,'[{"changed": {"fields": ["Longitude", "Latitude"]}}]',10,1,'2024-03-20 19:46:20.195438');
INSERT INTO django_admin_log VALUES(20,'6','The Forum',2,'[{"changed": {"fields": ["Longitude"]}}]',10,1,'2024-03-20 19:46:39.207593');
INSERT INTO django_admin_log VALUES(21,'7','SWIoT',2,'[]',10,1,'2024-03-20 19:46:47.540461');
INSERT INTO django_admin_log VALUES(22,'1','Blob',1,'[{"added": {}}]',7,1,'2024-03-20 19:48:46.277217');
INSERT INTO django_admin_log VALUES(23,'2','Bonepos',1,'[{"added": {}}]',7,1,'2024-03-20 19:49:00.661048');
INSERT INTO django_admin_log VALUES(24,'3','Chickpick',1,'[{"added": {}}]',7,1,'2024-03-20 19:49:42.878933');
INSERT INTO django_admin_log VALUES(25,'4','Gunth',1,'[{"added": {}}]',7,1,'2024-03-20 19:57:15.676316');
INSERT INTO django_admin_log VALUES(26,'5','Loom',1,'[{"added": {}}]',7,1,'2024-03-20 19:57:48.125579');
INSERT INTO django_admin_log VALUES(27,'6','Sockub',1,'[{"added": {}}]',7,1,'2024-03-20 19:58:06.380440');
INSERT INTO django_admin_log VALUES(28,'7','Sparret',1,'[{"added": {}}]',7,1,'2024-03-20 19:58:25.738742');
INSERT INTO django_admin_log VALUES(29,'8','Torrentoise',1,'[{"added": {}}]',7,1,'2024-03-20 19:58:50.069275');
INSERT INTO django_admin_log VALUES(30,'9','Veneam',1,'[{"added": {}}]',7,1,'2024-03-20 19:59:06.555347');
INSERT INTO django_admin_log VALUES(31,'10','Vorp',1,'[{"added": {}}]',7,1,'2024-03-20 19:59:21.786322');
INSERT INTO django_admin_log VALUES(32,'1','Blob',1,'[{"added": {}}]',11,1,'2024-03-20 20:02:47.108170');
INSERT INTO django_admin_log VALUES(33,'2','Loom',1,'[{"added": {}}]',11,1,'2024-03-20 20:02:52.230588');
INSERT INTO django_admin_log VALUES(34,'3','Vorp',1,'[{"added": {}}]',11,1,'2024-03-20 20:03:07.753762');
INSERT INTO django_admin_log VALUES(35,'1','User:2 Task:Bin it to win it Verified:False',1,'[{"added": {}}]',13,1,'2024-03-20 20:20:21.563377');
CREATE TABLE IF NOT EXISTS "authtoken_token" ("key" varchar(40) NOT NULL PRIMARY KEY, "created" datetime NOT NULL, "user_id" bigint NOT NULL UNIQUE REFERENCES "api_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO authtoken_token VALUES('7205b7371d59dff633f3e9e10be8506dff6dc255','2024-03-20 20:01:31.597609',2);
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session VALUES('77mdb25gotk0iq16d8gkqtc8k9gg0d7u','.eJxVjMEOwiAQRP-FsyGwBVw8evcbyAJbqRpISnsy_rtt0oNmbvPezFsEWpcS1s5zmLK4CC1Ov12k9OS6g_ygem8ytbrMU5S7Ig_a5a1lfl0P9--gUC_b2oPbEtHkUdFA1hoFpDkajZ4MezUY0pgBz34AQGcZXQIEwynC6EF8vrYgNrM:1rn1CG:l0AS_T_ASqczBZWYmVTOlM3QrN5urtMviek7r1dUMpk','2024-04-03 19:01:56.553117');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',22);
INSERT INTO sqlite_sequence VALUES('django_content_type',15);
INSERT INTO sqlite_sequence VALUES('auth_permission',60);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('django_admin_log',35);
INSERT INTO sqlite_sequence VALUES('api_user',2);
INSERT INTO sqlite_sequence VALUES('api_locationtype',2);
INSERT INTO sqlite_sequence VALUES('api_tasktype',4);
INSERT INTO sqlite_sequence VALUES('api_location',7);
INSERT INTO sqlite_sequence VALUES('api_task',1);
INSERT INTO sqlite_sequence VALUES('api_monstertype',10);
INSERT INTO sqlite_sequence VALUES('api_monster',3);
INSERT INTO sqlite_sequence VALUES('api_taskverification',1);
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE UNIQUE INDEX "api_user_groups_user_id_group_id_9c7ddfb5_uniq" ON "api_user_groups" ("user_id", "group_id");
CREATE INDEX "api_user_groups_user_id_a5ff39fa" ON "api_user_groups" ("user_id");
CREATE INDEX "api_user_groups_group_id_3af85785" ON "api_user_groups" ("group_id");
CREATE UNIQUE INDEX "api_user_user_permissions_user_id_permission_id_a06dd704_uniq" ON "api_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "api_user_user_permissions_user_id_f3945d65" ON "api_user_user_permissions" ("user_id");
CREATE INDEX "api_user_user_permissions_permission_id_305b7fea" ON "api_user_user_permissions" ("permission_id");
CREATE INDEX "api_location_type_id_08bba790" ON "api_location" ("type_id");
CREATE INDEX "api_monster_user_id_6a829b40" ON "api_monster" ("user_id");
CREATE INDEX "api_monster_type_id_f5583ed6" ON "api_monster" ("type_id");
CREATE INDEX "api_task_location_id_6b73901c" ON "api_task" ("location_id");
CREATE INDEX "api_task_monster_slot1_id_b58835cc" ON "api_task" ("monster_slot1_id");
CREATE INDEX "api_task_monster_slot2_id_dcd333e1" ON "api_task" ("monster_slot2_id");
CREATE INDEX "api_task_type_id_0f5d1a19" ON "api_task" ("type_id");
CREATE INDEX "api_location_task_slot1_id_631bfee3" ON "api_location" ("task_slot1_id");
CREATE INDEX "api_location_task_slot2_id_c1ec1eee" ON "api_location" ("task_slot2_id");
CREATE INDEX "api_location_task_slot3_id_875ef7d4" ON "api_location" ("task_slot3_id");
CREATE INDEX "api_taskverification_task_id_057c7f85" ON "api_taskverification" ("task_id");
CREATE INDEX "api_taskverification_user_id_38c2c8eb" ON "api_taskverification" ("user_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
COMMIT;