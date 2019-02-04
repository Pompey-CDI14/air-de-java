/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  30/01/2019 10:27:01                      */
/*==============================================================*/
drop database if exists air_de_java;

create database air_de_java CHARACTER SET 'utf8';

use air_de_java;

drop table if exists anciensnomsgroupes;

drop table if exists coordonnees;

drop table if exists ecrit;

drop table if exists estmembre;

drop table if exists estresponsable;

drop table if exists groupes;

drop table if exists inclutplaylist;

drop table if exists instruments;

drop table if exists interprete;

drop table if exists joue;

drop table if exists pays;

drop table if exists personnes;

drop table if exists regions;

drop table if exists rencontres;

drop table if exists representations;

drop table if exists responsabilites;

drop table if exists scenes;

drop table if exists specialites;

drop table if exists titres;

drop table if exists typestitres;

/*==============================================================*/
/* Table : anciensnomsgroupes                                   */
/*==============================================================*/
create table anciensnomsgroupes
(
   idAncienNom          int not null auto_increment,
   idGroupe             int not null,
   ancienNom            varchar(40) not null,
   primary key (idAncienNom)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : coordonnees                                          */
/*==============================================================*/
create table coordonnees
(
   idCoord              int not null auto_increment,
   idPays               int not null,
   idPerso              int not null,
   adressePerso         varchar(60) not null,
   codePostal           varchar(9) not null,
   villePerso           varchar(25) not null,
   tel                  varchar(15),
   fax                  varchar(15),
   email                varchar(50),
   primary key (idCoord)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : ecrit                                                */
/*==============================================================*/
create table ecrit
(
   idPerso              int not null,
   idTitre              int not null,
   primary key (idPerso, iDTITRE)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : estmembre                                            */
/*==============================================================*/
create table estmembre
(
   idPerso              int not null,
   idGroupe             int not null,
   idSpec               int not null,
   dateAdhesion         date not null,
   dateRupture          date,
   disponibilite        bool,
   primary key (idPerso, idGroupe, idSpec)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : estresponsable                                       */
/*==============================================================*/
create table estresponsable
(
   idResp               int not null,
   idGroupe             int not null,
   idPerso              int not null,
   primary key (idResp, idGroupe, idPerso)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : groupes                                              */
/*==============================================================*/
create table groupes
(
   idGroupe             int not null auto_increment,
   idRegion             int,
   idCorresp            int not null,
   idPays               int not null,
   denomination         varchar(50) not null,
   primary key (idGroupe)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : inclutplaylist                                       */
/*==============================================================*/
create table inclutplaylist
(
   idRepresentation     int not null,
   idTitre              int not null,
   tempsPrevu           time not null,
   annuleTitre          bool,
   primary key (idRepresentation, idTitre)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : instruments                                          */
/*==============================================================*/
create table instruments
(
   idInstrument         int not null auto_increment,
   nomInstrument        varchar(40) not null,
   primary key (idInstrument)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : interprete                                           */
/*==============================================================*/
create table interprete
(
   idGroupe             int not null,
   idTitre              int not null,
   primary key (idGroupe, idTitre)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : joue                                                 */
/*==============================================================*/
create table joue
(
   idInstrument         int not null,
   idGroupe             int not null,
   idPerso              int not null,
   primary key (idInstrument, idGroupe, idPerso)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : pays                                                 */
/*==============================================================*/
create table pays
(
   idPays               int not null auto_increment,
   nomPays              varchar(30) not null,
   primary key (idPays)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : personnes                                            */
/*==============================================================*/
create table personnes
(
   idPerso              int not null auto_increment,
   nomPerso             varchar(30) not null,
   prenomPerso          varchar(20),
   civilite             varchar(4),
   dateNaissance        date,
   primary key (idPerso)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : regions                                              */
/*==============================================================*/
create table regions
(
   idRegion             int not null auto_increment,
   nomRegion            varchar(30) not null,
   primary key (idRegion)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : rencontres                                           */
/*==============================================================*/
create table rencontres
(
   idRencontre          int not null auto_increment,
   idPerso              int not null,
   nomRencontre         varchar(40) not null,
   villeRencontre       varchar(25) not null,
   dateDebut            date not null,
   dateFin              date not null,
   nbPersonnesAttendues int,
   periodicite          int,
   annulRencontre       bool,
   primary key (idRencontre)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : representations                                      */
/*==============================================================*/
create table representations
(
   idRepresentation     int not null auto_increment,
   idRencontre          int not null,
   idScene              int not null,
   idGroupe             int not null,
   dateRepresentation   date not null,
   heureDebut           time not null,
   heureFin             time not null,
   annuleRepresentation bool,
   primary key (idRepresentation)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : responsabilites                                      */
/*==============================================================*/
create table responsabilites
(
   idResp               int not null auto_increment,
   libelleResp          varchar(20) not null,
   primary key (idResp)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : scenes                                               */
/*==============================================================*/
create table scenes
(
   idScene              int not null auto_increment,
   nomScene             varchar(45) not null,
   adresseScene         varchar(60),
   villeScene           varchar(25),
   primary key (idScene)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : specialites                                          */
/*==============================================================*/
create table specialites
(
   idSpec               int not null auto_increment,
   nomSpec              varchar(10) not null,
   primary key (idSpec)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : titres                                               */
/*==============================================================*/
create table titres
(
   idTitre              int not null auto_increment,
   idType           	int not null,
   titre               	varchar(40) not null,
   epoque               varchar(25),
   duree                time,
   primary key (iDTITRE)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : typestitres                                          */
/*==============================================================*/
create table typestitres
(
   idType           int not null auto_increment,
   typeTitre        varchar(30) not null,
   primary key (idType)
)ENGINE=InnoDB;

/*==============================================================*/
/* Table : ajout des contraintes de clés étrangères             */
/*==============================================================*/
alter table anciensnomsgroupes add constraint FK_archivenom foreign key (idGroupe)
      references groupes (idGroupe) on delete restrict on update restrict;

alter table coordonnees add constraint FK_appartenir_a foreign key (idPays)
      references pays (idPays) on delete restrict on update restrict;

alter table coordonnees add constraint FK_contacte foreign key (idPerso)
      references personnes (idPerso) on delete restrict on update restrict;

alter table ecrit add constraint FK_ecrit foreign key (idPerso)
      references personnes (idPerso) on delete restrict on update restrict;

alter table ecrit add constraint FK_ecrit2 foreign key (iDTITRE)
      references titres (iDTITRE) on delete restrict on update restrict;

alter table estmembre add constraint FK_estmembre foreign key (idPerso)
      references personnes (idPerso) on delete restrict on update restrict;

alter table estmembre add constraint FK_estmembre2 foreign key (idGroupe)
      references groupes (idGroupe) on delete restrict on update restrict;

alter table estmembre add constraint FK_estmembre3 foreign key (idSpec)
      references specialites (idSpec) on delete restrict on update restrict;

alter table estresponsable add constraint FK_estresponsable foreign key (idResp)
      references responsabilites (idResp) on delete restrict on update restrict;

alter table estresponsable add constraint FK_estresponsable2 foreign key (idGroupe)
      references groupes (idGroupe) on delete restrict on update restrict;

alter table estresponsable add constraint FK_estresponsable3 foreign key (idPerso)
      references personnes (idPerso) on delete restrict on update restrict;

alter table groupes add constraint FK_correspond foreign key (idCorresp)
      references personnes (idPerso) on delete restrict on update restrict;

alter table groupes add constraint FK_representepays foreign key (idPays)
      references pays (idPays) on delete restrict on update restrict;

alter table groupes add constraint FK_representeregion foreign key (idRegion)
      references regions (idRegion) on delete restrict on update restrict;

alter table inclutplaylist add constraint FK_inclutplaylist foreign key (idRepresentation)
      references representations (idRepresentation) on delete restrict on update restrict;

alter table inclutplaylist add constraint FK_inclutplaylist2 foreign key (idTitre)
      references titres (idTitre) on delete restrict on update restrict;

alter table interprete add constraint FK_interprete foreign key (idGroupe)
      references groupes (idGroupe) on delete restrict on update restrict;

alter table interprete add constraint FK_interprete2 foreign key (idTitre)
      references titres (idTitre) on delete restrict on update restrict;

alter table joue add constraint FK_joue foreign key (idInstrument)
      references instruments (idInstrument) on delete restrict on update restrict;

alter table joue add constraint FK_joue2 foreign key (idPerso)
      references personnes (idPerso) on delete restrict on update restrict;

alter table joue add constraint FK_joue3 foreign key (idGroupe)
      references groupes (idGroupe) on delete restrict on update restrict;

alter table rencontres add constraint FK_organise foreign key (idPerso)
      references personnes (idPerso) on delete restrict on update restrict;

alter table representations add constraint FK_estprogramme foreign key (idRencontre)
      references rencontres (idRencontre) on delete restrict on update restrict;

alter table representations add constraint FK_seproduit foreign key (idGroupe)
      references groupes (idGroupe) on delete restrict on update restrict;

alter table representations add constraint FK_setientdans foreign key (idScene)
      references scenes (idScene) on delete restrict on update restrict;

alter table titres add constraint FK_est foreign key (idType)
      references typestitres (idType) on delete restrict on update restrict;
	  
/*==============================================================*/
/* Table : ajout des index                                      */
/*==============================================================*/
create index I_denomination on groupes (denomination);

create index I_nomPersonne on personnes(nomPerso);

create index I_nomIntsrument on instruments(nomInstrument);

create index I_nompays on pays(nomPays);

create index I_nomRegion on regions(nomRegion);

create index I_nomRencontre on rencontres(nomRencontre);

create index I_libelleResp on responsabilites(libelleResp);

create index I_titre on titres(titre);

