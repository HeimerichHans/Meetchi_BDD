CREATE SCHEMA meetchi;

CREATE TABLE meetchi.sexe (
	id serial NOT NULL,
	sexe varchar(5) NOT NULL,
	CONSTRAINT sexe_pk PRIMARY KEY (id)
);

CREATE TABLE meetchi.utilisateur (
	id serial NOT NULL,
	nom varchar(32) NOT NULL,
	prenom varchar(32) NOT NULL,
	pseudonyme varchar(32) NOT NULL,
	description varchar(250) NULL,
	datecreation date NOT NULL,
	datemiseajour date NULL,
	sexeid int NOT NULL,
	CONSTRAINT utilisateur_pk PRIMARY KEY (id),
	CONSTRAINT utilisateur_fk FOREIGN KEY (sexeid) REFERENCES meetchi.sexe(id)
);

CREATE TABLE meetchi.contact (
	id serial NOT NULL,
	utilisateurida int NOT NULL,
	utilisateuridb int NOT NULL,
	estbloquea bool NOT NULL DEFAULT false,
	estbloqueb bool NOT NULL DEFAULT false,
	estfinia bool NOT NULL DEFAULT false,
	estfinib bool NOT NULL DEFAULT false,
	CONSTRAINT contact_pk PRIMARY KEY (id),
	CONSTRAINT contact_fk_a FOREIGN KEY (utilisateurida) REFERENCES meetchi.utilisateur(id),
	CONSTRAINT contact_fk_b FOREIGN KEY (utilisateuridb) REFERENCES meetchi.utilisateur(id)
);

CREATE TABLE meetchi.status (
	utilisateurid int NULL,
	estvisible bool NOT NULL DEFAULT true,
	estactif bool NOT NULL DEFAULT true,
	estenligne bool NOT NULL DEFAULT false,
	CONSTRAINT status_fk FOREIGN KEY (utilisateurid) REFERENCES meetchi.utilisateur(id)
);

CREATE TABLE meetchi.identification (
	utilisateurid int NOT NULL,
	email varchar(100) NOT NULL,
	numerotelephone varchar(13) NOT NULL,
	motdepasse varchar NOT NULL,
	CONSTRAINT identification_fk FOREIGN KEY (utilisateurid) REFERENCES meetchi.utilisateur(id)
);

CREATE TABLE meetchi.tag (
	id serial NOT NULL,
	tag varchar(32) NOT NULL,
	CONSTRAINT tag_pk PRIMARY KEY (id)
);

CREATE TABLE meetchi.listetag (
	utilisateurid int NOT NULL,
	tag1 int NULL,
	tag2 int NULL,
	tag3 int NULL,
	tag4 int NULL,
	tag5 int NULL,
	tag6 int NULL,
	CONSTRAINT listetag_fk FOREIGN KEY (utilisateurid) REFERENCES meetchi.utilisateur(id),
	CONSTRAINT listetag_fk_1 FOREIGN KEY (tag1) REFERENCES meetchi.tag(id),
	CONSTRAINT listetag_fk_2 FOREIGN KEY (tag2) REFERENCES meetchi.tag(id),
	CONSTRAINT listetag_fk_3 FOREIGN KEY (tag3) REFERENCES meetchi.tag(id),
	CONSTRAINT listetag_fk_4 FOREIGN KEY (tag4) REFERENCES meetchi.tag(id),
	CONSTRAINT listetag_fk_5 FOREIGN KEY (tag5) REFERENCES meetchi.tag(id),
	CONSTRAINT listetag_fk_6 FOREIGN KEY (tag6) REFERENCES meetchi.tag(id)
);

CREATE TABLE meetchi.cause (
	id serial NOT NULL,
	cause varchar(64) NOT NULL,
	CONSTRAINT cause_pk PRIMARY KEY (id)
);

CREATE TABLE meetchi.signalement (
	id serial NOT NULL,
	rapporteurid int NOT NULL,
	coupableid int NOT NULL,
	"date" date NOT NULL,
	causeid int NOT NULL,
	CONSTRAINT signalement_pk PRIMARY KEY (id),
	CONSTRAINT signalement_fk_1 FOREIGN KEY (rapporteurid) REFERENCES meetchi.utilisateur(id),
	CONSTRAINT signalement_fk_2 FOREIGN KEY (coupableid) REFERENCES meetchi.utilisateur(id),
	CONSTRAINT signalement_fk_3 FOREIGN KEY (causeid) REFERENCES meetchi.cause(id)
);

CREATE TABLE meetchi.message (
	contactid int NOT NULL,
	"date" date NOT NULL,
	message varchar(512) NOT NULL,
	auteurid int NOT NULL,
	estediter bool NOT NULL DEFAULT false,
	estsupprimer bool NOT NULL DEFAULT false,
	CONSTRAINT message_fk_1 FOREIGN KEY (contactid) REFERENCES meetchi.contact(id),
	CONSTRAINT message_fk_2 FOREIGN KEY (auteurid) REFERENCES meetchi.utilisateur(id)
);
