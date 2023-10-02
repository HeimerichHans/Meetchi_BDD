CREATE TABLE public."User" (
	id serial8 NOT NULL,
	nom varchar NOT NULL,
	prenom varchar NOT NULL,
	CONSTRAINT user_pk PRIMARY KEY (id)
);