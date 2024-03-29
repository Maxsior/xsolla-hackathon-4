create table category
(
	id integer not null
		primary key autoincrement,
	name varchar(30) not null,
	constraint category_name_uindex
		unique (name)
)
;

create table service
(
	id integer not null
		primary key autoincrement,
	name varchar(60) not null,
	ranking integer null,
	var_value integer null,
	constraint service_name_uindex
		unique (name),
	constraint service_var_value_id_fk
		foreign key (var_value) references var_value (id)
			on update cascade on delete cascade
)
;

create index service_var_value_id_fk
	on service (var_value)
;

create table task
(
	id integer not null
		primary key autoincrement,
	name text not null,
	everyday tinyint(1) not null
)
;

create table task_template
(
	id integer not null
		primary key autoincrement,
	task integer not null,
	template integer not null,
	constraint task_template_task_id_fk
		foreign key (task) references task (id)
			on update cascade on delete cascade,
	constraint task_template_template_id_fk
		foreign key (template) references template (id)
			on update cascade on delete cascade
)
;

create index task_template_task_id_fk
	on task_template (task)
;

create index task_template_template_id_fk
	on task_template (template)
;

create table template
(
	id integer not null
		primary key autoincrement,
	name varchar(100) not null,
	category integer not null,
	formula text not null,
	constraint template_category_id_fk
		foreign key (category) references category (id)
			on update cascade on delete cascade
)
;

create index template_category_id_fk
	on template (category)
;

create table value_name
(
	id integer not null
		primary key autoincrement,
	name varchar(20) not null,
	scope integer null,
	constraint value_name_template_id_fk
		foreign key (scope) references template (id)
			on update cascade on delete cascade
)
;

create index value_name_template_id_fk
	on value_name (scope)
;

create table var_value
(
	id integer not null
		primary key autoincrement,
	name varchar(50) not null,
	value_name integer not null,
	constraint var_value_value_names_id_fk
		foreign key (value_name) references value_name (id)
			on update cascade on delete cascade
)
;

create index var_value_value_names_id_fk
	on var_value (value_name)
;

INSERT INTO `category` VALUES (4,'карьера и учёба'),(5,'материальные ценности'),(3,'саморазвитие'),(1,'социальная'),(2,'спорт');

INSERT INTO `service` VALUES (1,'Udacity',1,NULL),(2,'Swifty',1,52),(3,'Swift',2,52),(4,'Codecademy Hour of Code',1,NULL),(5,'Lrn',1,NULL),(6,'Tynker',2,NULL),(7,'Khan Academy',1,NULL),(8,'Javvy',2,NULL),(9,'Coursera: Online courses',3,NULL),(10,'EdX — Online Courses',1,NULL),(11,'CodeCombat',1,NULL),(12,'CodeWars',1,NULL),(13,'https://metanit.com/sharp/',3,49),(14,'https://metanit.com/java/',3,56),(15,'https://metanit.com/web/',3,NULL),(16,'https://metanit.com/python/',2,51),(17,'https://metanit.com/cpp/',2,47),(18,'https://metanit.com/nosql/mongodb/',2,NULL),(19,'https://metanit.com/go/',2,50),(20,'https://metanit.com/visualbasic/tutorial/',2,53),(21,'https://metanit.com/swift/tutorial/',2,52),(22,'https://metanit.com/sql/mysql/',2,57),(23,'https://metanit.com/sql/postgresql/',3,58),(24,'http://begin-english.ru/samouchitel',3,1),(25,'https://lingust.ru/english',2,1),(26,'https://mir-slov.com/',1,1),(27,'https://lingust.ru/japanese',1,2),(28,'https://lingust.ru/deutsch/deutschunterricht',1,3),(31,'https://pythonworld.ru',3,51),(32,'https://kotlinlang.ru',3,55);

INSERT INTO `task` VALUES (1,'купить самоучитель или книгу по языку',0),(2,'читать 10 страниц в день',1),(3,'учить 10 слов в день',1),(4,'перейти на язык в повседневной жизни (смотреть видео/читать тексты на этом языке)',1),(5,'перевести часть ПО на этот язык',1),(6,'пройти онлайн-курс',0),(7,'записаться на сдачу экзамена и сдать его',0),(8,'купить словарик',0),(9,'сделать карточки со словами и их переводами',0),(10,'проверить себя на специализированных сайтах или с помощью карточек',0),(11,'скачать необходимое ПО',0),(12,'смотреть 1 обучающее видео в день',1),(13,'изучать 3 функции ПО в день',1),(14,'практиковаться как минимум 20 минут в день',1),(15,'опубликовать работу и собрать фидбэк',0),(16,'купить необходимые инструменты',0),(17,'записаться в художественную школу',0),(18,'выполнять задания в этой школе',1),(19,'выпуститься из школы и сдать проект',0);

INSERT INTO `task_template` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,2),(9,9,2),(10,10,2),(11,3,2),(12,4,2),(13,5,2),(14,11,3),(15,12,3),(16,13,3),(17,14,3),(18,15,3),(19,16,4),(20,17,4),(21,18,4),(22,19,4),(23,1,16),(24,11,16),(25,12,16),(26,13,16),(27,14,16),(28,15,16),(29,6,16);

INSERT INTO `template` VALUES (1,'выучить язык до определенного уровня',3,'выучить %s язык до уровня %s'),(2,'выучить слова в языке',3,'выучить %d слов в %s языке'),(3,'научиться рисовать в программе',3,'научиться рисовать %s в программе %s'),(4,'научиться рисовать на бумаге',3,'научиться рисовать %s %s'),(5,'научиться играть на музыкальном инструменте',3,'научиться играть %d мелодий на %s'),(6,'пробежать марафон',2,'пробежать марафон длиной %d км'),(7,'научиться поднимать штангу',2,'научиться поднимать штангу %d кг %d раз подряд '),(8,'похудеть',2,'похудеть на %d кг'),(9,'набрать вес',2,'набрать %d кг'),(10,'приобрести',5,'накопить %d рублей для покупки %s'),(11,'накопить',5,'накопить %d рублей'),(12,'повысить квалификацию',4,'повыситься до %s'),(13,'приобрести квалификацию',4,'приобрести квалификацию %s'),(14,'принять участие',1,'принять участие в %s'),(15,'организовать',1,'организовать %s на %s уровне'),(16,'выучить язык программирования',4,'реализовать %d проектов на языке %d'),(17,'выучить конкретный язык SQL',4,'реализовать %d баз данных на языке %d');

INSERT INTO `value_name` VALUES (1,'lang',1),(2,'level',1),(3,'events',14),(4,'lang',2),(5,'prog',3),(6,'style',4),(7,'level',15),(8,'music',5),(9,'events',15),(10,'lang',16),(11,'lang',17);

INSERT INTO `var_value` VALUES (1,'английский',1),(2,'японский',1),(3,'немецкий',1),(4,'A1 (выживание)',2),(5,'A2 (предпороговый)',2),(6,'B1 (пороговой)',2),(7,'B2 (пороговый продвинутый)',2),(8,'C1 (профессиональный)',2),(9,'C2 (в совершенстве)',2),(10,'митинге',3),(11,'хакатоне',3),(12,'форуме',3),(13,'олимпиаде',3),(14,'фестивале',3),(15,'балу',3),(16,'английский',4),(17,'японский',4),(18,'немецкий',4),(19,'photoshop',5),(20,'paint tool sai',5),(21,'gimp',5),(22,'paint net',5),(23,'акварелью',6),(24,'карандашом',6),(25,'фломастерами',6),(26,'красками',6),(27,'без лайна',6),(28,'в стиле аниме',6),(29,'районном',7),(30,'муниципальном',7),(31,'городском',7),(32,'областном',7),(33,'краевом',7),(34,'всероссийском',7),(35,'международном',7),(36,'гитаре',8),(37,'скрипке',8),(38,'пианино',8),(39,'бояне',8),(40,'барабанах',8),(41,'форум',9),(42,'олимпиаду',9),(43,'фестиваль',9),(44,'бал',9),(45,'митинг',9),(46,'хакатон',9),(47,'C++',10),(48,'C',10),(49,'C#',10),(50,'Go',10),(51,'Python',10),(52,'Swift',10),(53,'Visual Basic',10),(54,'Java Script',10),(55,'Kotlin',10),(56,'Java',10),(57,'MySQL',11),(58,'PostgreSQL',11);