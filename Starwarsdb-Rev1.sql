/***********************************************************************
** File: Starwarsdb_Rev1.sql   
** Name: Starwarsdb 
** Desc: Script to create star wars database
** Auth: Aaron Jenkins		
** Date: 25/01/2019
**************************
** Change History
**************************
** Rev		Date		Author		Description 
** ---		--------	-------		------------------------------------
** 1		25/01/2019	Aaron		First Release
***********************************************************************/


DROP TABLE Cast;
DROP TABLE Driver;
DROP TABLE Pilot;
DROP TABLE Character;
DROP TABLE Species;
DROP TABLE Film;
DROP TABLE Color;
DROP TABLE Planet;
DROP TABLE Vehicle;
DROP TABLE Starship;


CREATE TABLE Film(
  id NUMBER(11), 
  producer VARCHAR2(100), 
  title VARCHAR2(100), 
  release_date DATE, 
  episode_id NUMBER(2), 
  director VARCHAR2(100), 
  opening_crawl VARCHAR2(4000),
  CONSTRAINT pk_film PRIMARY KEY (id)
);

CREATE TABLE color(
  id NUMBER(11), 
  name VARCHAR2(100),
  CONSTRAINT pk_color PRIMARY KEY (id)
);

CREATE TABLE Planet(
  id NUMBER(11), 
  diameter NUMBER(20),
  climate VARCHAR2(100), 
  surface_water NUMBER(20),
  name VARCHAR2(100), 
  rotation_period NUMBER(20),
  terrain VARCHAR2(100), 
  gravity VARCHAR2(100), 
  orbital_period NUMBER(20), 
  population NUMBER(20),
  CONSTRAINT pk_Planet PRIMARY KEY(id)
);

CREATE TABLE Species(
 id NUMBER(11), 
 homeworld NUMBER(20),
 name VARCHAR2(100), 
 average_height NUMBER(20),
 skin_color NUMBER(20),
 hair_color NUMBER(20),
 eye_color NUMBER(20),
 language VARCHAR2(100), 
 average_lifespan NUMBER(20),
 classification VARCHAR2(100), 
 CONSTRAINT pk_species PRIMARY KEY (id), 
 CONSTRAINT fk_species_hair FOREIGN KEY (hair_color) REFERENCES color (id), 
 CONSTRAINT fk_species_skin FOREIGN KEY (skin_color) REFERENCES color (id), 
 CONSTRAINT fk_species_eye FOREIGN KEY (eye_color) REFERENCES color(id),
 CONSTRAINT fk_species_homeworld FOREIGN KEY (homeworld) REFERENCES Planet(id)
 );
 
 CREATE TABLE Character(
  id NUMBER(11), 
  planet_id NUMBER(20), 
  species_id NUMBER(20), 
  name VARCHAR2(100), 
  height NUMBER(20), 
  mass NUMBER(20), 
  hair_color NUMBER(20), 
  skin_color NUMBER(20), 
  eye_color NUMBER(20),  
  birth_year VARCHAR2(100), 
  gender VARCHAR2(100),
  CONSTRAINT pk_Character PRIMARY KEY(id),
  CONSTRAINT fk_Character_planet    FOREIGN KEY (planet_id)  REFERENCES Planet(id),
  CONSTRAINT fk_Character_species   FOREIGN KEY (species_id) REFERENCES Species(id)
);

CREATE TABLE Vehicle(
  id NUMBER(11), 
  vehicle_class VARCHAR2(100), 
  passengers NUMBER(20), 
  manufacturer VARCHAR2(100), 
  cost_in_credits NUMBER(20), 
  name VARCHAR2(100), 
  model VARCHAR2(100), 
  cargo_capacity NUMBER(20), 
  consumables VARCHAR2(100), 
  max_atmosphering_speed NUMBER(20), 
  crew NUMBER(20), 
  length FLOAT(20),
  CONSTRAINT pk_Vehicle PRIMARY KEY (id)
);

CREATE TABLE Starship(
  id NUMBER(11), 
  manufacturer VARCHAR2(100), 
  passengers NUMBER(20),
  cost_in_credits NUMBER(20), 
  name VARCHAR2(100), 
  hyperdrive_rating FLOAT(20), 
  cargo_capacity NUMBER(20), 
  consumables VARCHAR2(100), 
  max_atmosphering_speed VARCHAR2(100), 
  crew NUMBER(20), 
  length FLOAT(20),
  MGLT NUMBER(20), 
  starship_class VARCHAR2(100),
  CONSTRAINT pk_Starship PRIMARY KEY (id)
);

CREATE TABLE Cast(
Character_id NUMBER(11),
film_id NUMBER(11),
CONSTRAINT fk_cast_Character FOREIGN KEY (Character_id) REFERENCES Character(id),
CONSTRAINT fk_cast_film FOREIGN KEY (film_id) REFERENCES Film(id),
CONSTRAINT pk_cast PRIMARY KEY (Character_id, film_id)
);

CREATE TABLE Driver(
Character_id NUMBER(11),
vehicle_id NUMBER(11),
CONSTRAINT fk_Driver_Character FOREIGN KEY (Character_id) REFERENCES Character(id),
CONSTRAINT fk_Driver_Vehicle FOREIGN KEY (vehicle_id) REFERENCES Vehicle(id),
CONSTRAINT pk_Driver PRIMARY KEY (Character_id, vehicle_id)
);

CREATE TABLE Pilot(
Character_id NUMBER(11),
starship_id NUMBER(11),
CONSTRAINT fk_starship_used_Character FOREIGN KEY (Character_id) REFERENCES Character(id),
CONSTRAINT fk_starship_used_starship FOREIGN KEY (starship_id) REFERENCES Starship(id),
CONSTRAINT pk_pilot PRIMARY KEY (Character_id, starship_id)
);

SET DEFINE OFF
--Populate Film
INSERT INTO Film (ID, PRODUCER, TITLE, RELEASE_DATE, EPISODE_ID, DIRECTOR, OPENING_CRAWL) 
VALUES (1, 'Gary Kurtz, Rick McCallum', 'A New Hope', TO_DATE('25/05/1977','DD/MM/YYYY'), 4, 'George Lucas', 'It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire''s\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire''s\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....');

INSERT INTO Film (ID, PRODUCER, TITLE, RELEASE_DATE, EPISODE_ID, DIRECTOR, OPENING_CRAWL) 
VALUES (5, 'Rick McCallum', 'Attack of the Clones', TO_DATE('16/05/2002','DD/MM/YYYY'), 2, 'George Lucas', 'There is unrest in the Galactic\r\nSenate. Several thousand solar\r\nsystems have declared their\r\nintentions to leave the Republic.\r\n\r\nThis separatist movement,\r\nunder the leadership of the\r\nmysterious Count Dooku, has\r\nmade it difficult for the limited\r\nnumber of Jedi Knights to maintain \r\npeace and order in the galaxy.\r\n\r\nSenator Amidala, the former\r\nQueen of Naboo, is returning\r\nto the Galactic Senate to vote\r\non the critical issue of creating\r\nan ARMY OF THE REPUBLIC\r\nto assist the overwhelmed\r\nJedi....');

INSERT INTO Film (ID, PRODUCER, TITLE, RELEASE_DATE, EPISODE_ID, DIRECTOR, OPENING_CRAWL) 
VALUES (4, 'Rick McCallum', 'The Phantom Menace', TO_DATE('19/05/1999','DD/MM/YYYY'), 1, 'George Lucas', 'Turmoil has engulfed the\r\nGalactic Republic. The taxation\r\nof trade routes to outlying star\r\nsystems is in dispute.\r\n\r\nHoping to resolve the matter\r\nwith a blockade of deadly\r\nbattleships, the greedy Trade\r\nFederation has stopped all\r\nshipping to the small planet\r\nof Naboo.\r\n\r\nWhile the Congress of the\r\nRepublic endlessly debates\r\nthis alarming chain of events,\r\nthe Supreme Chancellor has\r\nsecretly dispatched two Jedi\r\nKnights, the guardians of\r\npeace and justice in the\r\ngalaxy, to settle the conflict....');

INSERT INTO Film (ID, PRODUCER, TITLE, RELEASE_DATE, EPISODE_ID, DIRECTOR, OPENING_CRAWL) 
VALUES (6, 'Rick McCallum', 'Revenge of the Sith', TO_DATE('19/05/2005','DD/MM/YYYY'), 3, 'George Lucas', 'War! The Republic is crumbling\r\nunder attacks by the ruthless\r\nSith Lord, Count Dooku.\r\nThere are heroes on both sides.\r\nEvil is everywhere.\r\n\r\nIn a stunning move, the\r\nfiendish droid leader, General\r\nGrievous, has swept into the\r\nRepublic capital and kidnapped\r\nChancellor Palpatine, leader of\r\nthe Galactic Senate.\r\n\r\nAs the Separatist Droid Army\r\nattempts to flee the besieged\r\ncapital with their valuable\r\nhostage, two Jedi Knights lead a\r\ndesperate mission to rescue the\r\ncaptive Chancellor....');

INSERT INTO Film (ID, PRODUCER, TITLE, RELEASE_DATE, EPISODE_ID, DIRECTOR, OPENING_CRAWL) 
VALUES (3, 'Howard G. Kazanjian, George Lucas, Rick McCallum', 'Return of the Jedi', TO_DATE('25/05/1983','DD/MM/YYYY'), 6, 'Richard Marquand', 'Luke Skywalker has returned to\r\nhis home planet of Tatooine in\r\nan attempt to rescue his\r\nfriend Han Solo from the\r\nclutches of the vile gangster\r\nJabba the Hutt.\r\n\r\nLittle does Luke know that the\r\nGALACTIC EMPIRE has secretly\r\nbegun construction on a new\r\narmored space station even\r\nmore powerful than the first\r\ndreaded Death Star.\r\n\r\nWhen completed, this ultimate\r\nweapon will spell certain doom\r\nfor the small band of rebels\r\nstruggling to restore freedom\r\nto the galaxy...');

INSERT INTO Film (ID, PRODUCER, TITLE, RELEASE_DATE, EPISODE_ID, DIRECTOR, OPENING_CRAWL) 
VALUES (2, 'Gary Kurtz, Rick McCallum', 'The Empire Strikes Back', TO_DATE('17/05/1980','DD/MM/YYYY'), 5, 'Irvin Kershner', 'It is a dark time for the\r\nRebellion. Although the Death\r\nStar has been destroyed,\r\nImperial troops have driven the\r\nRebel forces from their hidden\r\nbase and pursued them across\r\nthe galaxy.\r\n\r\nEvading the dreaded Imperial\r\nStarfleet, a group of freedom\r\nfighters led by Luke Skywalker\r\nhas established a new secret\r\nbase on the remote ice world\r\nof Hoth.\r\n\r\nThe evil lord Darth Vader,\r\nobsessed with finding young\r\nSkywalker, has dispatched\r\nthousands of remote probes into\r\nthe far reaches of space....');

INSERT INTO Film (ID, PRODUCER, TITLE, RELEASE_DATE, EPISODE_ID, DIRECTOR, OPENING_CRAWL) 
VALUES (7, 'Kathleen Kennedy, J. J. Abrams, Bryan Burk', 'The Force Awakens', TO_DATE('11/12/2015','DD/MM/YYYY'), 7, 'J. J. Abrams', 'Luke Skywalker has vanished.\r\nIn his absence, the sinister\r\nFIRST ORDER has risen from\r\nthe ashes of the Empire\r\nand will not rest until\r\nSkywalker, the last Jedi,\r\nhas been destroyed.\r\n \r\nWith the support of the\r\nREPUBLIC, General Leia Organa\r\nleads a brave RESISTANCE.\r\nShe is desperate to find her\r\nbrother Luke and gain his\r\nhelp in restoring peace and\r\njustice to the galaxy.\r\n \r\nLeia has sent her most daring\r\npilot on a secret mission\r\nto Jakku, where an old ally\r\nhas discovered a clue to\r\nLuke''s whereabouts....');

--Populate Color
INSERT INTO COLOR (ID, name) 
VALUES (1, 'blond');

INSERT INTO COLOR (ID, name) 
VALUES (2, 'n/a');

INSERT INTO COLOR (ID, name) 
VALUES (3, 'none');

INSERT INTO COLOR (ID, name) 
VALUES (4, 'brown');

INSERT INTO COLOR (ID, name) 
VALUES (5, 'black');

INSERT INTO COLOR (ID, name) 
VALUES (6, 'auburn');

INSERT INTO COLOR (ID, name) 
VALUES (7, 'white');

INSERT INTO COLOR (ID, name) 
VALUES (8, 'grey');

INSERT INTO COLOR (ID, name) 
VALUES (9, 'fair');

INSERT INTO COLOR (ID, name) 
VALUES (10, 'gold');

INSERT INTO COLOR (ID, name) 
VALUES (11, 'light');

INSERT INTO COLOR (ID, name) 
VALUES (12, 'unknown');

INSERT INTO COLOR (ID, name) 
VALUES (13, 'green');

INSERT INTO COLOR (ID, name) 
VALUES (14, 'green-tan');

INSERT INTO COLOR (ID, name) 
VALUES (15, 'pale');

INSERT INTO COLOR (ID, name) 
VALUES (16, 'metal');

INSERT INTO COLOR (ID, name) 
VALUES (17, 'dark');

INSERT INTO COLOR (ID, name) 
VALUES (18, 'brown mottle');

INSERT INTO COLOR (ID, name) 
VALUES (19, 'mottled green');

INSERT INTO COLOR (ID, name) 
VALUES (20, 'orange');

INSERT INTO COLOR (ID, name) 
VALUES (21, 'blue');

INSERT INTO COLOR (ID, name) 
VALUES (22, 'red');

INSERT INTO COLOR (ID, name) 
VALUES (23, 'yellow');

INSERT INTO COLOR (ID, name) 
VALUES (24, 'blue-gray');

INSERT INTO COLOR (ID, name) 
VALUES (25, 'hazel');

INSERT INTO COLOR (ID, name) 
VALUES (26, 'pink');

INSERT INTO COLOR (ID, name) 
VALUES (27, 'pale pink');

INSERT INTO COLOR (ID, name) 
VALUES (28, 'peach');

INSERT INTO COLOR (ID, name) 
VALUES (29, 'gray');

INSERT INTO COLOR (ID, name) 
VALUES (30, 'caucasian');

INSERT INTO COLOR (ID, name) 
VALUES (31, 'blonde');

INSERT INTO COLOR (ID, name) 
VALUES (32, ' grey');

INSERT INTO COLOR (ID, name) 
VALUES (33, ' white');

INSERT INTO COLOR (ID, name) 
VALUES (34, ' red');

INSERT INTO COLOR (ID, name) 
VALUES (35, ' yellow');

INSERT INTO COLOR (ID, name) 
VALUES (36, ' green');

INSERT INTO COLOR (ID, name) 
VALUES (37, ' blue');

INSERT INTO COLOR (ID, name) 
VALUES (38, ' brown');

INSERT INTO COLOR (ID, name) 
VALUES (39, ' golden');

INSERT INTO COLOR (ID, name) 
VALUES (40, ' orange');

INSERT INTO COLOR (ID, name) 
VALUES (41, ' black');

INSERT INTO COLOR (ID, name) 
VALUES (42, ' amber');

INSERT INTO COLOR (ID, name) 
VALUES (43, ' purple');

INSERT INTO COLOR (ID, name) 
VALUES (44, ' gray');

INSERT INTO COLOR (ID, name) 
VALUES (45, ' blond');

INSERT INTO COLOR (ID, name) 
VALUES (46, ' pink');

INSERT INTO COLOR (ID, name) 
VALUES (47, ' indigo');

INSERT INTO COLOR (ID, name) 
VALUES (48, ' silver');

INSERT INTO COLOR (ID, name) 
VALUES (49, ' hazel');

INSERT INTO COLOR (ID, name) 
VALUES (50, ' tan');

INSERT INTO COLOR (ID, name) 
VALUES (51, ' asian');

INSERT INTO COLOR (ID, name) 
VALUES (52, ' magenta');

INSERT INTO COLOR (ID, name) 
VALUES (53, ' hispanic');


-- POPULATE Planet
INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (2, 12500, 'temperate', 40, 'Alderaan', 24, 'grasslands,mountains', '1,standard', 364, 2000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (3, 10200, 'temperate,tropical', 8, 'Yavin,IV', 24, 'jungle,rainforests', '1,standard', 4818, 1000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (4, 7200, 'frozen', 100, 'Hoth', 23, 'tundra,ice,caves,mountain,ranges', '1.1,standard', 549, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (5, 8900, 'murky', 8, 'Dagobah', 23, 'swamp,jungles', 'N/A', 341, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (6, 118000, 'temperate', 0, 'Bespin', 12, 'gas,giant', '1.5,(surface),1,standard,(Cloud,City)', 5110, 6000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (7, 4900, 'temperate', 8, 'Endor', 18, 'forests,mountains,lakes', '0.85,standard', 402, 30000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (8, 12120, 'temperate', 12, 'Naboo', 26, 'grassy,hills,swamps,forests,mountains', '1,standard', 312, 4500000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (9, 12240, 'temperate', NULL, 'Coruscant', 24, 'cityscape,mountains', '1,standard', 368, 1000000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (10, 19720, 'temperate', 100, 'Kamino', 27, 'ocean', '1,standard', 463, 1000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (11, 11370, 'temperate,arid', 5, 'Geonosis', 30, 'rock,desert,mountain,barren', '0.9,standard', 256, 100000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (12, 12900, 'temperate,arid,windy', 10, 'Utapau', 27, 'scrublands,savanna,canyons,sinkholes', '1,standard', 351, 95000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (13, 4200, 'hot', 0, 'Mustafar', 36, 'volcanoes,lava,rivers,mountains,caves', '1,standard', 412, 20000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (14, 12765, 'tropical', 60, 'Kashyyyk', 26, 'jungle,forests,lakes,rivers', '1,standard', 381, 45000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (15, 0, 'artificial,temperate,', 0, 'Polis,Massa', 24, 'airless,asteroid', '0.56,standard', 590, 1000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (16, 10088, 'frigid', NULL, 'Mygeeto', 12, 'glaciers,mountains,ice,canyons', '1,standard', 167, 19000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (17, 9100, 'hot,humid', NULL, 'Felucia', 34, 'fungus,forests', '0.75,standard', 231, 8500000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (18, 0, 'temperate,moist', NULL, 'Cato,Neimoidia', 25, 'mountains,fields,forests,rock,arches', '1,standard', 278, 10000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (19, 14920, 'hot', NULL, 'Saleucami', 26, 'caves,desert,mountains,volcanoes', '', 392, 1400000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (20, 0, 'temperate', NULL, 'Stewjon', NULL, 'grass', '1,standard', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (21, 13490, 'polluted', NULL, 'Eriadu', 24, 'cityscape', '1,standard', 360, 22000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (22, 11000, 'temperate', 70, 'Corellia', 25, 'plains,urban,hills,forests', '1,standard', 329, 3000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (23, 7549, 'hot', 60, 'Rodia', 29, 'jungles,oceans,urban,swamps', '1,standard', 305, 1300000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (24, 12150, 'temperate', NULL, 'Nal,Hutta', 87, 'urban,oceans,swamps,bogs', '1,standard', 413, 7000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (25, 9830, 'temperate', NULL, 'Dantooine', 25, 'oceans,savannas,mountains,grasslands', '1,standard', 378, 1000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (26, 6400, 'temperate', 98, 'Bestine,IV', 26, 'rocky,islands,oceans', '', 680, 62000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (27, 14050, 'temperate', 10, 'Ord,Mantell', 26, 'plains,seas,mesas', '1,standard', 334, 4000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (28, 0, '', NULL, 'unknown', 0, 'unknown', '', 0, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (29, 0, 'arid', NULL, 'Trandosha', 25, 'mountains,seas,grasslands,deserts', '0.62,standard', 371, 42000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (30, 0, 'arid', NULL, 'Socorro', 20, 'deserts,mountains', '1,standard', 326, 300000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (31, 11030, 'temperate', 100, 'Mon,Cala', 21, 'oceans,reefs,islands', '1', 398, 27000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (32, 13500, 'temperate', 40, 'Chandrila', 20, 'plains,forests', '1', 368, 1200000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (33, 12780, 'superheated', 5, 'Sullust', 20, 'mountains,volcanoes,rocky,deserts', '1', 263, 18500000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (34, 7900, 'temperate', NULL, 'Toydaria', 21, 'swamps,lakes', '1', 184, 11000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (35, 18880, 'arid,temperate,tropical', NULL, 'Malastare', 26, 'swamps,deserts,jungles,mountains', '1.56', 201, 2000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (36, 10480, 'temperate', NULL, 'Dathomir', 24, 'forests,deserts,savannas', '10', 491, 5200);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (37, 10600, 'temperate,arid,subartic', 5, 'Ryloth', 30, 'mountains,valleys,deserts,tundra', '1', 305, 1500000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (38, NULL, '', NULL, 'Aleen,Minor', NULL, 'unknown', '', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (39, 14900, 'temperate,artic', NULL, 'Vulpter', 22, 'urban,barren', '1', 391, 421000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (40, NULL, '', NULL, 'Troiken', NULL, 'desert,tundra,rainforests,mountains', '', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (41, 12190, '', NULL, 'Tund', 48, 'barren,ash', '', 1770, 0);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (42, 10120, 'temperate', NULL, 'Haruun,Kal', 25, 'toxic,cloudsea,plateaus,volcanoes', '0.98', 383, 705300);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (43, NULL, 'temperate', 20, 'Cerea', 27, 'verdant', '1', 386, 450000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (44, 15600, 'tropical,temperate', 80, 'Glee,Anselm', 33, 'lakes,islands,swamps,seas', '1', 206, 500000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (45, NULL, '', NULL, 'Iridonia', 29, 'rocky,canyons,acid,pools', '', 413, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (46, NULL, '', NULL, 'Tholoth', NULL, 'unknown', '', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (47, NULL, 'arid,rocky,windy', NULL, 'Iktotch', 22, 'rocky', '1', 481, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (48, NULL, '', NULL, 'Quermia', NULL, 'unknown', '', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (49, 13400, 'temperate', NULL, 'Dorin', 22, 'unknown', '1', 409, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (50, NULL, 'temperate', NULL, 'Champala', 27, 'oceans,rainforests,plateaus', '1', 318, 3500000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (51, NULL, '', NULL, 'Mirial', NULL, 'deserts', '', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (52, NULL, '', NULL, 'Serenno', NULL, 'rainforests,rivers,mountains', '', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (53, NULL, '', NULL, 'Concord,Dawn', NULL, 'jungles,forests,deserts', '', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (54, NULL, '', NULL, 'Zolan', NULL, 'unknown', '', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (55, NULL, 'frigid', 100, 'Ojom', NULL, 'oceans,glaciers', '', NULL, 500000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (56, NULL, 'temperate', NULL, 'Skako', 27, 'urban,vines', '1', 384, 500000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (57, 13800, 'temperate', 25, 'Muunilinst', 28, 'plains,forests,hills,mountains', '1', 412, 5000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (58, NULL, 'temperate', NULL, 'Shili', NULL, 'cities,savannahs,seas,plains', '1', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (59, 13850, 'arid,temperate,tropical', NULL, 'Kalee', 23, 'rainforests,cliffs,canyons,seas', '1', 378, 4000000000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (60, NULL, '', NULL, 'Umbara', NULL, 'unknown', '', NULL, NULL);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (1, 10465, 'arid', 1, 'Tatooine', 23, 'desert', '1,standard', 304, 200000);

INSERT INTO Planet (ID, DIAMETER, CLIMATE, SURFACE_WATER, NAME, ROTATION_PERIOD, TERRAIN, GRAVITY, ORBITAL_PERIOD, POPULATION) 
VALUES (61, NULL, '', NULL, 'Jakku', NULL, 'deserts', '', NULL, NULL);

--Populate species
INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (5, 24, 'Hutt', 300, 13, 2, 23, 'Huttese', 1000, 'gastropod');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (6, 28, 'Yoda''s species', 66, 13, 4, 4, 'Galactic basic', 900, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (7, 29, 'Trandoshan', 200, 4, 3, 23, 'Dosh', NULL, 'reptile');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (8, 31, 'Mon Calamari', 160, 22, 3, 23, 'Mon Calamarian', NULL, 'amphibian');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (9, 7, 'Ewok', 100, 4, 7, 20, 'Ewokese', NULL, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (10, 33, 'Sullustan', 180, 15, 3, 5, 'Sullutese', NULL, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (11, 18, 'Neimodian', 180, 8, 3, 22, 'Neimoidia', NULL, '');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (12, 8, 'Gungan', 190, 4, 3, 20, 'Gungan basic', NULL, 'amphibian');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (13, 34, 'Toydarian', 120, 21, 3, 23, 'Toydarian', 91, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (14, 35, 'Dug', 100, 4, 3, 23, 'Dugese', NULL, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (15, 37, 'Twi''lek', 200, 20, 3, 21, 'Twi''leki', NULL, 'mammals');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (16, 38, 'Aleena', 80, 21, 3, 12, 'Aleena', 79, 'reptile');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (17, 39, 'Vulptereen', 100, 8, 3, 23, 'vulpterish', NULL, '');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (18, 40, 'Xexto', 125, 8, 3, 5, 'Xextese', NULL, '');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (19, 41, 'Toong', 200, 8, 3, 20, 'Tundan', NULL, '');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (20, 43, 'Cerean', 200, 27, 22, 25, 'Cerean', NULL, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (21, 44, 'Nautolan', 180, 13, 3, 5, 'Nautila', 70, 'amphibian');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (22, 45, 'Zabrak', 180, 15, 5, 4, 'Zabraki', NULL, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (23, 46, 'Tholothian', NULL, 17, 12, 21, '', NULL, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (24, 47, 'Iktotchi', 180, 26, 3, 20, 'Iktotchese', NULL, '');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (25, 48, 'Quermian', 240, 7, 3, 23, 'Quermian', 86, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (26, 49, 'Kel Dor', 180, 28, 3, 5, 'Kel Dor', 70, '');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (27, 50, 'Chagrian', 190, 21, 3, 21, 'Chagria', NULL, 'amphibian');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (28, 11, 'Geonosian', 178, 13, 3, 13, 'Geonosian', NULL, 'insectoid');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (29, 51, 'Mirialan', 180, 23, 5, 21, 'Mirialan', NULL, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (30, 54, 'Clawdite', 180, 13, 3, 23, 'Clawdite', 70, 'reptilian');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (31, 55, 'Besalisk', 178, 4, 3, 23, 'besalisk', 75, 'amphibian');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (32, 10, 'Kaminoan', 220, 8, 3, 5, 'Kaminoan', 80, 'amphibian');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (33, 56, 'Skakoan', NULL, 8, 3, 12, 'Skakoan', NULL, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (34, 57, 'Muun', 190, 8, 3, 5, 'Muun', 100, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (35, 58, 'Togruta', 180, 22, 3, 22, 'Togruti', 94, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (36, 59, 'Kaleesh', 170, 4, 3, 23, 'Kaleesh', 80, 'reptile');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (37, 12, 'Pau''an', 190, 8, 3, 5, 'Utapese', 700, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (3, 14, 'Wookiee', 210, 29, 5, 21, 'Shyriiwook', 400, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (2, NULL, 'Droid', NULL, 2, 2, 2, '', NULL, 'artificial');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (1, 9, 'Human', 180, 30, 31, 4, 'Galactic Basic', 120, 'mammal');

INSERT INTO SPECIES (ID, HOMEWORLD, NAME, AVERAGE_HEIGHT, SKIN_color, HAIR_color, EYE_color, LANGUAGE, AVERAGE_LIFESPAN, CLASSIFICATION) 
VALUES (4, 23, 'Rodian', 170, 13, 2, 5, 'Galactic Basic', NULL, 'sentient');

--Populate Character
INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (1, 1, 1, 'Luke Skywalker', 172, 77, 1, 9, 21, '19BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (2, 1, 2, 'C-3PO', 167, 75, 2, 10, 23, '112BBY', '');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (3, 8, 2, 'R2-D2', 96, 32, 2, 7, 22, '33BBY', '');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (4, 1, 1, 'Darth Vader', 202, 136, 3, 7, 23, '42BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (5, 2, 1, 'Leia Organa', 150, 49, 4, 11, 4, '19BBY', 'female');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (6, 1, 1, 'Owen Lars', 178, 120, 4, 11, 21, '52BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (7, 1, 1, 'Beru Whitesun lars', 165, 75, 4, 11, 21, '47BBY', 'female');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (8, 1, 2, 'R5-D4', 97, 32, 2, 7, 22, '', '');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (9, 1, 1, 'Biggs Darklighter', 183, 84, 5, 11, 4, '24BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (10, 20, 1, 'Obi-Wan Kenobi', 182, 77, 6, 9, 24, '57BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (11, 1, 1, 'Anakin Skywalker', 188, 84, 1, 9, 21, '42BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (12, 21, 1, 'Wilhuff Tarkin', 180, NULL, 6, 9, 21, '64BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (13, 14, 3, 'Chewbacca', 228, 112, 4, 12, 21, '200BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (14, 22, 1, 'Han Solo', 180, 80, 4, 9, 4, '29BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (15, 23, 4, 'Greedo', 173, 74, 2, 13, 5, '44BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (16, 24, 5, 'Jabba Desilijic Tiure', 175, 1358, 2, 14, 20, '600BBY', 'hermaphrodite');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (18, 22, 1, 'Wedge Antilles', 170, 77, 4, 9, 25, '21BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (19, 26, 1, 'Jek Tono Porkins', 180, 110, 4, 9, 21, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (20, 28, 6, 'Yoda', 66, 17, 7, 13, 4, '896BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (21, 8, 1, 'Palpatine', 170, 75, 8, 15, 23, '82BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (22, 10, 1, 'Boba Fett', 183, 78, 5, 9, 4, '32BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (23, 28, 2, 'IG-88', 200, 140, 3, 16, 22, '15BBY', 'none');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (24, 29, 7, 'Bossk', 190, 113, 3, 13, 22, '53BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (25, 30, 1, 'Lando Calrissian', 177, 79, 5, 17, 4, '31BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (26, 6, 1, 'Lobot', 175, 79, 3, 11, 21, '37BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (27, 31, 8, 'Ackbar', 180, 83, 3, 18, 20, '41BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (28, 32, 1, 'Mon Mothma', 150, NULL, 6, 9, 21, '48BBY', 'female');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (29, 28, 1, 'Arvel Crynyd', NULL, NULL, 4, 9, 4, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (30, 7, 9, 'Wicket Systri Warrick', 88, 20, 4, 4, 4, '8BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (31, 33, 10, 'Nien Nunb', 160, 68, 3, 8, 5, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (32, 28, 1, 'Qui-Gon Jinn', 193, 89, 4, 9, 21, '92BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (33, 18, 11, 'Nute Gunray', 191, 90, 3, 19, 22, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (34, 9, 1, 'Finis Valorum', 170, NULL, 1, 9, 21, '91BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (36, 8, 12, 'Jar Jar Binks', 196, 66, 3, 20, 20, '52BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (37, 8, 12, 'Roos Tarpals', 224, 82, 3, 8, 20, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (38, 8, 12, 'Rugor Nass', 206, NULL, 3, 13, 20, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (39, 8, NULL, 'Ric Oli\u00e9', 183, NULL, 4, 9, 21, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (40, 34, 13, 'Watto', 137, NULL, 5, 21, 23, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (41, 35, 14, 'Sebulba', 112, 40, 3, 8, 20, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (42, 8, NULL, 'Quarsh Panaka', 183, NULL, 5, 17, 4, '62BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (43, 1, 1, 'Shmi Skywalker', 163, NULL, 5, 9, 4, '72BBY', 'female');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (44, 36, 22, 'Darth Maul', 175, 80, 3, 22, 23, '54BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (45, 37, 15, 'Bib Fortuna', 180, NULL, 3, 15, 26, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (46, 37, 15, 'Ayla Secura', 178, 55, 3, 21, 25, '48BBY', 'female');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (48, 39, 17, 'Dud Bolt', 94, 45, 3, 21, 23, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (49, 40, 18, 'Gasgano', 122, NULL, 3, 7, 5, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (50, 41, 19, 'Ben Quadinaros', 163, 65, 3, 8, 20, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (51, 42, 1, 'Mace Windu', 188, 84, 3, 17, 4, '72BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (52, 43, 20, 'Ki-Adi-Mundi', 198, 82, 7, 15, 23, '92BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (53, 44, 21, 'Kit Fisto', 196, 87, 3, 13, 5, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (54, 45, 22, 'Eeth Koth', 171, NULL, 5, 4, 4, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (55, 9, 23, 'Adi Gallia', 184, 50, 3, 17, 21, '', 'female');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (56, 47, 24, 'Saesee Tiin', 188, NULL, 3, 15, 20, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (57, 48, 25, 'Yarael Poof', 264, NULL, 3, 7, 23, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (58, 49, 26, 'Plo Koon', 188, 80, 3, 20, 5, '22BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (59, 50, 27, 'Mas Amedda', 196, NULL, 3, 21, 21, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (60, 8, 1, 'Gregar Typho', 185, 85, 5, 17, 4, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (61, 8, 1, 'Cord\u00e9', 157, NULL, 4, 11, 4, '', 'female');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (62, 1, 1, 'Cliegg Lars', 183, NULL, 4, 9, 21, '82BBY', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (63, 11, 28, 'Poggle the Lesser', 183, 80, 3, 13, 23, '', 'male');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (64, 51, 29, 'Luminara Unduli', 170, 56, 5, 23, 21, '58BBY', 'female');

INSERT INTO Character (ID, PLANET_ID, SPECIES_ID, NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER) 
VALUES (65, 51, 29, 'Barriss Offee', 166, 50, 5, 23, 21, '40BBY', 'female');

--Populate Vehicle
INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (4, 'wheeled', 30, 'Corellia Mining Corporation', 150000, 'Sand Crawler', 'Digger Crawler', 50000, '2 months', 30, 46, 36.8);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (6, 'repulsorcraft', 1, 'Incom Corporation', 14500, 'T-16 skyhopper', 'T-16 skyhopper', 50, '0', 1200, 1, 10.4);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (7, 'repulsorcraft', 1, 'SoroSuub Corporation', 10550, 'X-34 landspeeder', 'X-34 landspeeder', 5, '', 250, 1, 3.4);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (8, 'starfighter', 0, 'Sienar Fleet Systems', NULL, 'TIE/LN starfighter', 'Twin Ion Engine/Ln Starfighter', 65, '2 days', 1200, 1, 6.4);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (14, 'airspeeder', 0, 'Incom corporation', NULL, 'Snowspeeder', 't-47 airspeeder', 10, '', 650, 2, 4.5);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (16, 'space/planetary bomber', 0, 'Sienar Fleet Systems', NULL, 'TIE bomber', 'TIE/sa bomber', NULL, '2 days', 850, 1, 7.8);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (18, 'assault walker', 40, 'Kuat Drive Yards, Imperial Department of Military Research', NULL, 'AT-AT', 'All Terrain Armored Transport', 1000, '', 60, 5, 20);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (19, 'walker', 0, 'Kuat Drive Yards, Imperial Department of Military Research', NULL, 'AT-ST', 'All Terrain Scout Transport', 200, '', 90, 2, 2);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (20, 'repulsorcraft', 0, 'Bespin Motors', 75000, 'Storm IV Twin-Pod cloud car', 'Storm IV Twin-Pod', 10, '1 day', 1500, 2, 7);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (24, 'sail barge', 500, 'Ubrikkian Industries Custom Vehicle Division', 285000, 'Sail barge', 'Modified Luxury Sail Barge', 2000000, 'Live food tanks', 100, 26, 30);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (25, 'repulsorcraft cargo skiff', 16, 'Ubrikkian Industries', 8000, 'Bantha-II cargo skiff', 'Bantha-II', 135000, '1 day', 250, 5, 9.5);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (26, 'starfighter', 0, 'Sienar Fleet Systems', NULL, 'TIE/IN interceptor', 'Twin Ion Engine Interceptor', 75, '2 days', 1250, 1, 9.6);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (30, 'speeder', 1, 'Aratech Repulsor Company', 8000, 'Imperial Speeder Bike', '74-Z speeder bike', 4, '1 day', 360, 1, 3);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (33, 'starfighter', 0, 'Haor Chall Engineering, Baktoid Armor Workshop', NULL, 'Vulture Droid', 'Vulture-class droid starfighter', 0, '', 1200, 0, 3.5);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (34, 'repulsorcraft', 112, 'Baktoid Armor Workshop', 138000, 'Multi-Troop Transport', 'Multi-Troop Transport', 12000, '', 35, 4, 31);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (35, 'repulsorcraft', 6, 'Baktoid Armor Workshop', NULL, 'Armored Assault Tank', 'Armoured Assault Tank', NULL, '', 55, 4, 9.75);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (36, 'repulsorcraft', 0, 'Baktoid Armor Workshop', 2500, 'Single Trooper Aerial Platform', 'Single Trooper Aerial Platform', NULL, '', 400, 1, 2);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (37, 'landing craft', 284, 'Haor Chall Engineering', 200000, 'C-9979 landing craft', 'C-9979 landing craft', 1800000, '1 day', 587, 140, 210);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (38, 'submarine', 2, 'Otoh Gunga Bongameken Cooperative', NULL, 'Tribubble bongo', 'Tribubble bongo', 1600, '', 85, 1, 15);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (42, 'speeder', 0, 'Razalon', 4000, 'Sith speeder', 'FC-20 speeder bike', 2, '', 180, 1, 1.5);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (44, 'repulsorcraft', 1, 'Mobquet Swoops and Speeders', 5750, 'Zephyr-G swoop bike', 'Zephyr-G swoop bike', 200, '', 350, 1, 3.68);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (45, 'airspeeder', 1, 'Desler Gizh Outworld Mobility Corporation', NULL, 'Koro-2 Exodrive airspeeder', 'Koro-2 Exodrive airspeeder', 80, '', 800, 1, 6.6);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (46, 'airspeeder', 1, 'Narglatch AirTech prefabricated kit', NULL, 'XJ-6 airspeeder', 'XJ-6 airspeeder', NULL, '', 720, 1, 6.23);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (50, 'gunship', 30, 'Rothana Heavy Engineering', NULL, 'LAAT/i', 'Low Altitude Assault Transport/infrantry', 170, '', 620, 6, 17.4);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (51, 'gunship', 0, 'Rothana Heavy Engineering', NULL, 'LAAT/c', 'Low Altitude Assault Transport/carrier', 40000, '', 620, 1, 28.82);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (60, 'wheeled walker', 1, 'Z-Gomot Ternbuell Guppat Corporation', 15000, 'Tsmeu-6 personal wheel bike', 'Tsmeu-6 personal wheel bike', 10, '', 330, 1, 3.5);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (62, 'fire suppression ship', NULL, '', NULL, 'Emergency Firespeeder', 'Fire suppression speeder', NULL, '', NULL, 2, NULL);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (67, 'droid starfighter', 0, 'Colla Designs, Phlac-Arphocc Automata Industries', 20000, 'Droid tri-fighter', 'tri-fighter', 0, '', 1180, 1, 5.4);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (69, 'airspeeder', 2, 'Appazanna Engineering Works', 12125, 'Oevvaor jet catamaran', 'Oevvaor jet catamaran', 50, '3 days', 420, 2, 15.1);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (70, 'air speeder', 0, 'Appazanna Engineering Works', 14750, 'Raddaugh Gnasp fluttercraft', 'Raddaugh Gnasp fluttercraft', 20, '', 310, 2, 7);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (71, 'wheeled walker', 300, 'Kuat Drive Yards', 350000, 'Clone turbo tank', 'HAVw A6 Juggernaut', 30000, '20 days', 160, 20, 49.4);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (72, 'droid tank', 4, 'Techno Union', 49000, 'Corporate Alliance tank droid', 'NR-N99 Persuader-class droid enforcer', NULL, '', 100, 0, 10.96);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (73, 'airspeeder', 0, 'Baktoid Fleet Ordnance, Haor Chall Engineering', 60000, 'Droid gunship', 'HMP droid gunship', 0, '', 820, 0, 12.3);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (76, 'walker', 0, 'Kuat Drive Yards', 40000, 'AT-RT', 'All Terrain Recon Transport', 20, '1 day', 90, 1, 3.2);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (53, 'walker', 36, 'Rothana Heavy Engineering, Kuat Drive Yards', NULL, 'AT-TE', 'All Terrain Tactical Enforcer', 10000, '21 days', 60, 6, 13.2);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (54, 'walker', 30, 'Rothana Heavy Engineering', NULL, 'SPHA', 'Self-Propelled Heavy Artillery', 500, '7 days', 35, 25, 140);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (55, 'speeder', 0, 'Huppla Pasa Tisc Shipwrights Collective', 8000, 'Flitknot speeder', 'Flitknot speeder', NULL, '', 634, 1, 2);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (56, 'transport', 6, 'Haor Chall Engineering', NULL, 'Neimoidian shuttle', 'Sheathipede-class transport shuttle', 1000, '7 days', 880, 2, 20);

INSERT INTO Vehicle (ID, VEHICLE_CLASS, PASSENGERS, MANUFACTURER, COST_IN_CREDITS, NAME, MODEL, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH) 
VALUES (57, 'starfighter', 0, 'Huppla Pasa Tisc Shipwrights Collective', NULL, 'Geonosian starfighter', 'Nantex-class territorial defense', NULL, '', 20000, 1, 9.8);

--Populate Vehicle
INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (15, 'Kuat Drive Yards, Fondor Shipyards', 38000, 1143350000, 'Executor', 2, 250000000, '6 years', '', 279144, 19000, 40, 'Star dreadnought');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (5, 'Sienar Fleet Systems, Cyngus Spaceworks', 75, 240000, 'Sentinel-class landing craft', 1, 180000, '1 month', '1000', 5, 38, 70, 'landing craft');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (9, 'Imperial Department of Military Research, Sienar Fleet Systems', 843342, 1000000000000, 'Death Star', 4, 1000000000000, '3 years', '', 342953, 120000, 10, 'Deep Space Mobile Battlestation');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (10, 'Corellian Engineering Corporation', 6, 100000, 'Millennium Falcon', 0.5, 100000, '2 months', '1050', 4, 34.37, 75, 'Light freighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (11, 'Koensayr Manufacturing', 0, 134999, 'Y-wing', 1, 110, '1 week', '1000', 2, 14, 80, 'assault starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (12, 'Incom Corporation', 0, 149999, 'X-wing', 1, 110, '1 week', '1050', 1, 12.5, 100, 'Starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (13, 'Sienar Fleet Systems', 0, NULL, 'TIE Advanced x1', 1, 150, '5 days', '1200', 1, 9.2, 105, 'Starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (21, 'Kuat Systems Engineering', 6, NULL, 'Slave 1', 3, 70000, '1 month', '1000', 1, 21.5, 70, 'Patrol craft');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (22, 'Sienar Fleet Systems', 20, 240000, 'Imperial shuttle', 1, 80000, '2 months', '850', 6, 20, 50, 'Armed government transport');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (23, 'Kuat Drive Yards', 75, 8500000, 'EF76 Nebulon-B escort frigate', 2, 6000000, '2 years', '800', 854, 300, 40, 'Escort ship');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (27, 'Mon Calamari shipyards', 1200, 104000000, 'Calamari Cruiser', 1, NULL, '2 years', '', 5400, 1200, 60, 'Star Cruiser');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (28, 'Alliance Underground Engineering, Incom Corporation', 0, 175000, 'A-wing', 1, 40, '1 week', '1300', 1, 9.6, 120, 'Starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (29, 'Slayn and Korpil', 0, 220000, 'B-wing', 2, 45, '1 week', '950', 1, 16.9, 91, 'Assault Starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (31, 'Corellian Engineering Corporation', 16, NULL, 'Republic Cruiser', 2, NULL, '', '900', 9, 115, NULL, 'Space cruiser');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (39, 'Theed Palace Space Vessel Engineering Corps', 0, 200000, 'Naboo fighter', 1, 65, '7 days', '1100', 1, 11, NULL, 'Starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (40, 'Theed Palace Space Vessel Engineering Corps, Nubia Star Drives', NULL, NULL, 'Naboo Royal Starship', 1.8, NULL, '', '920', 8, 76, NULL, 'yacht');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (41, 'Republic Sienar Systems', 6, 55000000, 'Scimitar', 1.5, 2500000, '30 days', '1180', 1, 26.5, NULL, 'Space Transport');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (43, 'Theed Palace Space Vessel Engineering Corps, Nubia Star Drives', 10, 2000000, 'J-type diplomatic barge', 0.7, NULL, '1 year', '2000', 5, 39, NULL, 'Diplomatic barge');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (47, 'Botajef Shipyards', 30000, NULL, 'AA-9 Coruscant freighter', NULL, NULL, '', '', NULL, 390, NULL, 'freighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (48, 'Kuat Systems Engineering', 0, 180000, 'Jedi starfighter', 1, 60, '7 days', '1150', 1, 8, NULL, 'Starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (49, 'Theed Palace Space Vessel Engineering Corps', NULL, NULL, 'H-type Nubian yacht', 0.9, NULL, '', '8000', 4, 47.9, NULL, 'yacht');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (3, 'Kuat Drive Yards', 0, 150000000, 'Star Destroyer', 2, 36000000, '2 years', '975', 47060, 1600, 60, 'Star Destroyer');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (59, 'Rendili StarDrive, Free Dac Volunteers Engineering corps.', 48247, 125000000, 'Trade Federation cruiser', 1.5, 50000000, '4 years', '1050', 600, 1088, NULL, 'capital ship');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (61, 'Cygnus Spaceworks', 16, 1000000, 'Theta-class T-2c shuttle', 1, 50000, '56 days', '2000', 5, 18.5, NULL, 'transport');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (77, 'Incom', NULL, NULL, 'T-70 X-wing fighter', NULL, NULL, '', '', 1, NULL, NULL, 'fighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (17, 'Gallofree Yards, Inc.', 90, NULL, 'Rebel transport', 4, 19000000, '6 months', '650', 6, 90, 20, 'Medium transport');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (32, 'Hoersch-Kessel Drive, Inc.', 139000, NULL, 'Droid control ship', 2, 4000000000, '500 days', '', 175, 3170, NULL, 'Droid control ship');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (52, 'Rothana Heavy Engineering', 16000, NULL, 'Republic Assault ship', 0.6, 11250000, '2 years', '', 700, 752, NULL, 'assault ship');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (58, 'Huppla Pasa Tisc Shipwrights Collective', 11, 35700, 'Solar Sailer', 1.5, 240, '7 days', '1600', 3, 15.2, NULL, 'yacht');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (63, 'Kuat Drive Yards, Allanteen Six shipyards', 2000, 59000000, 'Republic attack cruiser', 1, 20000000, '2 years', '975', 7400, 1137, NULL, 'star destroyer');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (64, 'Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated', 3, NULL, 'Naboo star skiff', 0.5, NULL, '', '1050', 3, 29.2, NULL, 'yacht');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (65, 'Kuat Systems Engineering', 0, 320000, 'Jedi Interceptor', 1, 60, '2 days', '1500', 1, 5.47, NULL, 'starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (66, 'Incom Corporation, Subpro Corporation', 0, 155000, 'arc-170', 1, 110, '5 days', '1000', 3, 14.5, 100, 'starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (74, 'Feethan Ottraw Scalable Assemblies', 0, 168000, 'Belbullab-22 starfighter', 6, 140, '7 days', '1100', 1, 6.71, NULL, 'starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (75, 'Kuat Systems Engineering', 0, 102500, 'V-wing', 1, 60, '15 hours', '1050', 1, 7.9, NULL, 'starfighter');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (2, 'Corellian Engineering Corporation', 600, 3500000, 'CR90 corvette', 2, 3000000, '1 year', '950', 165, 150, 60, 'corvette');

INSERT INTO Starship (ID, MANUFACTURER, PASSENGERS, COST_IN_CREDITS, NAME, HYPERDRIVE_RATING, CARGO_CAPACITY, CONSUMABLES, MAX_ATMOSPHERING_SPEED, CREW, LENGTH, MGLT, STARSHIP_CLASS) 
VALUES (68, 'Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries', NULL, 57000000, 'Banking clan frigate', 1, 40000000, '2 years', '', 200, 825, NULL, 'cruiser');

--Populate CAST
INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (1, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (1, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (1, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (1, 7);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (2, 5);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (2, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (2, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (2, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (2, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (3, 5);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (3, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (3, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (3, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (3, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (3, 7);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (4, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (4, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (4, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (5, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (5, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (5, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (5, 7);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (6, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (6, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (7, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (7, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (8, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (9, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (10, 5);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (10, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (10, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (10, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (10, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (11, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (11, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (12, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (13, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (13, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (13, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (13, 7);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (14, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (14, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (14, 7);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (15, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (16, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (16, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (18, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (18, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (19, 1);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (20, 5);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (20, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (20, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (20, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (21, 5);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (21, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (21, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (21, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (22, 5);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (22, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (23, 2);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (24, 2);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (25, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (26, 2);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (27, 7);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (28, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (29, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (30, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (31, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (32, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (33, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (33, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (34, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (36, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (37, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (38, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (39, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (40, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (41, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (42, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (43, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (44, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (45, 3);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (46, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (46, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (48, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (49, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (50, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (51, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (51, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (52, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (52, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (53, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (53, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (54, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (55, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (56, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (57, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (58, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (58, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (59, 4);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (60, 5);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (61, 5);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (62, 5);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (63, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (64, 6);

INSERT INTO CAST (Character_ID, FILM_ID) 
VALUES (65, 5);

--Populate Driver
INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (1.0, 14.0);

INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (1.0, 30.0);

INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (5.0, 30.0);

INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (10.0, 38.0);

INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (11.0, 44.0);

INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (11.0, 46.0);

INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (13.0, 19.0);

INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (18.0, 14.0);

INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (32.0, 38.0);

INSERT INTO DRIVER (CHARACTER_ID, VEHICLE_ID) 
VALUES (44.0, 42.0);

--Populate Pilot
INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (1.0, 12.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (1.0, 22.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (4.0, 13.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (9.0, 12.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (10.0, 48.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (10.0, 59.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (11.0, 59.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (11.0, 65.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (13.0, 10.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (13.0, 22.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (14.0, 10.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (14.0, 22.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (18.0, 12.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (19.0, 12.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (22.0, 21.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (25.0, 10.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (29.0, 28.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (31.0, 10.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (39.0, 40.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (44.0, 41.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (58.0, 48.0);

INSERT INTO PILOT (CHARACTER_ID, STARSHIP_ID) 
VALUES (60.0, 39.0);

