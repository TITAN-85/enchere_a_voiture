DROP DATABASE voiture;
CREATE database voiture;


CREATE TABLE profil (
profil_id INT NOT NULL auto_increment primary key, 
profil_nom VARCHAR(45)
);


CREATE TABLE pays(
pays_id INT NOT NULL auto_increment primary key, 
pays_nom VARCHAR(45)
);


CREATE TABLE utilisateur (
utilisateur_id INT NOT NULL auto_increment primary key,
utilisateur_nom VARCHAR(45),
utilisateur_prenom VARCHAR(45),
utilisateur_courriel VARCHAR(45),
utilisateur_mdp VARCHAR(255),
utilisateur_profil_id INT not null,
constraint utilisateur_profil_id_fk foreign key (utilisateur_profil_id) references profil (profil_id)
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;


CREATE TABLE achat (
achat_id INT NOT NULL auto_increment primary key,
achat_date_debut DATE,
achat_date_fin DATE,
achat_utilisateur_id INT not null,
constraint achat_utilisateur_id_fk foreign key (achat_utilisateur_id) references utilisateur (utilisateur_id)
);


CREATE TABLE mise(
mise_id INT NOT NULL auto_increment primary key,
mise_prix DOUBLE,
mise_date DATE NOT NULL,
mise_achat_id INT not null,
constraint mise_achat_id_fk foreign key (mise_achat_id) references achat (achat_id),
mise_utilisateur_id INT not null,
constraint mise_utilisateur_id_fk foreign key (mise_utilisateur_id) references utilisateur (utilisateur_id)
);

CREATE TABLE categorie(
categorie_id INT NOT NULL auto_increment primary key,
categorie_nom VARCHAR(45) NOT NULL
);


CREATE TABLE voiture(
voiture_id INT NOT NULL auto_increment primary key, 
voiture_nom VARCHAR(45) NOT NULL, 
voiture_description VARCHAR(255), 
voiture_prix DOUBLE NOT NULL,
voiture_km DOUBLE NOT NULL,
voiture_anee DOUBLE NOT NULL,
voiture_rate DOUBLE NOT NULL,
voiture_pays_id INT NOT NULL,
constraint voiture_pays_id_fk foreign key (voiture_pays_id) references pays (pays_id),
voiture_categorie_id INT NOT NULL, 
constraint voiture_categorie_id_fk foreign key (voiture_categorie_id) references categorie (categorie_id),
voiture_achat_id INT NOT NULL,
constraint voiture_achat_id_fk foreign key (voiture_achat_id) references achat (achat_id),
voiture_utilisateur_id INT NOT NULL,
constraint voiture_utilisateur_id_fk foreign key (voiture_utilisateur_id) references utilisateur (utilisateur_id)
);

CREATE TABLE image (
image_id INT NOT NULL auto_increment primary key,
image_url VARCHAR(255),
image_voiture_id INT not null,
constraint image_voiture_id_fk foreign key (image_voiture_id) references voiture (voiture_id)
);

-- ================================= INSERT profil ==========================
INSERT INTO profil VALUES (null, "administrateur");
INSERT INTO profil VALUES (null, "membre");

-- ================================= INSERT utilisateur ==========================
INSERT INTO utilisateur VALUES
(null, "candutatiana@gmail.com",   "Candu Tatiana", "candutatiana@gmail.com",  SHA2("1234", 512), "1"),
(null, "Jouhannet", "Charles", "cjouhannet@cmaisonneuve.qc.ca", SHA2("a1b2c3d4e5", 512), "1"),
(null, "Tremblay",  "Jean",    "jean.tremblay@site1.ca",        SHA2("f1g2h3i4j5", 512), "2"),
(null, "Legrand",   "Jacques", "jacques.legrand@site2.ca",      SHA2("k1l2m3n4o5", 512), "2"),
(null, "alex",   "alex", "alex@alex.ca",      SHA2("1234", 512), "1"),
(null, "alex2",   "alex2", "alex2@alex2.ca",  SHA2("1234", 512), "2");

-- ================================= INSERT pays ==========================
insert into pays value (null, "basic");
insert into pays value (null, "auto-trunk");
insert into pays value (null, "auto-air cond.");
insert into pays value (null, "auto-air.c.+ trunk");

-- select * from voiture.pays
-- ================================= INSERT categorie ==========================
insert into categorie value (null, "Rims");
insert into categorie value (null, "Mags");

-- ================================= INSERT achat ==========================
insert into achat value (null, "2022-12-28", "2023-12-28", "1");
insert into achat value (null, "2022-12-28", "2023-12-28", "1");
insert into achat value (null, "2022-12-28", "2023-12-28", "1");
insert into achat value (null, "2022-12-28", "2023-12-28", "1");

-- ================================= INSERT voiture ==========================
insert into voiture value (null, "2015 Subaru outback", "google.com", "16995", "135000", "2015", "85", "2", "1", "1", "1");
insert into voiture value (null, "2016 Subaru outback", "google.com", "17995", "165000", "2016", "110", "3", "2", "2", "1");
insert into voiture value (null, "2017 Subaru outback", "google.com", "18995", "115000", "2017", "135", "2", "2", "3", "1");
insert into voiture value (null, "2018 Subaru outback", "google.com", "19995", "185000", "2018", "155", "1", "1", "4", "1");

-- update timbr set voiture_achat_id = 4 where voiture_id = 5;


-- ================================= INSERT images ==========================
insert into image value (null, "0111.jpg", "1");
insert into image value (null, "0222.jpg", "1");
insert into image value (null, "0333.jpg", "1");
insert into image value (null, "0444.jpg", "1");
