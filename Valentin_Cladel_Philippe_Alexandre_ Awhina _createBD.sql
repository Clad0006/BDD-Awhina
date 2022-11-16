/*==============================================================*/
/* Nom de SGBD :  SAP SQL Anywhere 17                           */
/* Date de création :  16/11/2022 20:28:26                      */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ABSENCE_AVOIR_SALARIE') then
    alter table Absence
       delete foreign key FK_ABSENCE_AVOIR_SALARIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_AGENCE_DIRIGER_SALARIE') then
    alter table Agence
       delete foreign key FK_AGENCE_DIRIGER_SALARIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DEMENAGE_CORRESPON_TYPE_FOR') then
    alter table Demenagement
       delete foreign key FK_DEMENAGE_CORRESPON_TYPE_FOR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DEMENAGE_ORGANISER_CLIENT') then
    alter table Demenagement
       delete foreign key FK_DEMENAGE_ORGANISER_CLIENT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_GERER_GERER_DEMENAGE') then
    alter table Gerer
       delete foreign key FK_GERER_GERER_DEMENAGE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_GERER_GERER2_TYPE_SAL') then
    alter table Gerer
       delete foreign key FK_GERER_GERER2_TYPE_SAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_IMMOBILI_CONCERNER_VEHICULE') then
    alter table Immobilisation
       delete foreign key FK_IMMOBILI_CONCERNER_VEHICULE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_IMMOBILI_ETRE_GARAGE') then
    alter table Immobilisation
       delete foreign key FK_IMMOBILI_ETRE_GARAGE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARCOURI_PARCOURIR_VEHICULE') then
    alter table Parcourir
       delete foreign key FK_PARCOURI_PARCOURIR_VEHICULE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARCOURI_PARCOURIR_SALARIE') then
    alter table Parcourir
       delete foreign key FK_PARCOURI_PARCOURIR_SALARIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARCOURI_PARCOURIR_DEMENAGE') then
    alter table Parcourir
       delete foreign key FK_PARCOURI_PARCOURIR_DEMENAGE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARENTER_PARENTER_SALARIE') then
    alter table Parenter
       delete foreign key FK_PARENTER_PARENTER_SALARIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARENTER_PARENTER2_ENFANT') then
    alter table Parenter
       delete foreign key FK_PARENTER_PARENTER2_ENFANT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PRESENTE_PRESENTER_SALARIE') then
    alter table Presenter
       delete foreign key FK_PRESENTE_PRESENTER_SALARIE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PRESENTE_PRESENTER_AGENCE') then
    alter table Presenter
       delete foreign key FK_PRESENTE_PRESENTER_AGENCE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SALARIE_APPARTENI_TYPE_SAL') then
    alter table Salarie
       delete foreign key FK_SALARIE_APPARTENI_TYPE_SAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_UTILISER_UTILISER_VEHICULE') then
    alter table Utiliser
       delete foreign key FK_UTILISER_UTILISER_VEHICULE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_UTILISER_UTILISER2_DEMENAGE') then
    alter table Utiliser
       delete foreign key FK_UTILISER_UTILISER2_DEMENAGE
end if;

drop index if exists Absence.AVOIR_FK;

drop index if exists Absence.ABSENCE_PK;

drop table if exists Absence;

drop index if exists Agence.DIRIGER_FK;

drop index if exists Agence.AGENCE_PK;

drop table if exists Agence;

drop index if exists Client.CLIENT_PK;

drop table if exists Client;

drop index if exists Demenagement.CORRESPONDRE_FK;

drop index if exists Demenagement.ORGANISER_FK;

drop index if exists Demenagement.DEMENAGEMENT_PK;

drop table if exists Demenagement;

drop index if exists Enfant.ENFANT_PK;

drop table if exists Enfant;

drop index if exists Garage.GARAGE_PK;

drop table if exists Garage;

drop index if exists Gerer.GERER2_FK;

drop index if exists Gerer.GERER_FK;

drop index if exists Gerer.GERER_PK;

drop table if exists Gerer;

drop index if exists Immobilisation.ETRE_FK;

drop index if exists Immobilisation.CONCERNER_FK;

drop index if exists Immobilisation.IMMOBILISATION_PK;

drop table if exists Immobilisation;

drop index if exists Parcourir.PARCOURIR4_FK;

drop index if exists Parcourir.PARCOURIR3_FK;

drop index if exists Parcourir.PARCOURIR2_FK;

drop index if exists Parcourir.PARCOURIR_FK;

drop index if exists Parcourir.PARCOURIR_PK;

drop table if exists Parcourir;

drop index if exists Parenter.PARENTER2_FK;

drop index if exists Parenter.PARENTER_FK;

drop index if exists Parenter.PARENTER_PK;

drop table if exists Parenter;

drop index if exists Presenter.PRESENTER2_FK;

drop index if exists Presenter.PRESENTER_FK;

drop index if exists Presenter.PRESENTER_PK;

drop table if exists Presenter;

drop index if exists Salarie.APPARTENIR_FK;

drop index if exists Salarie.SALARIE_PK;

drop table if exists Salarie;

drop index if exists Type_Formule.TYPE_FORMULE_PK;

drop table if exists Type_Formule;

drop index if exists Type_Salarie.TYPE_SALARIE_PK;

drop table if exists Type_Salarie;

drop index if exists Utiliser.UTILISER2_FK;

drop index if exists Utiliser.UTILISER_FK;

drop index if exists Utiliser.UTILISER_PK;

drop table if exists Utiliser;

drop index if exists Vehicule.VEHICULE_PK;

drop table if exists Vehicule;

/*==============================================================*/
/* Table : Absence                                              */
/*==============================================================*/
create or replace table Absence 
(
   numAbs               integer                        not null,
   numSal               integer                        not null,
   dureeAbs             integer                        null,
   dateDemandeAbs       date                           null,
   dateReponseAbs       date                           null,
   etatDemandeAbs       char(2)                        null,
   motifDemandeAbs      varchar(100)                   null,
   constraint PK_ABSENCE primary key clustered (numAbs)
);

/*==============================================================*/
/* Index : ABSENCE_PK                                           */
/*==============================================================*/
create unique clustered index ABSENCE_PK on Absence (
numAbs ASC
);

/*==============================================================*/
/* Index : AVOIR_FK                                             */
/*==============================================================*/
create index AVOIR_FK on Absence (
numSal ASC
);

/*==============================================================*/
/* Table : Agence                                               */
/*==============================================================*/
create or replace table Agence 
(
   numAg                integer                        not null,
   numSal               integer                        not null,
   nomAg                varchar(100)                   null,
   adAg                 varchar(100)                   null,
   cpAg                 char(5)                        null,
   villeAg              varchar(100)                   null,
   telAg                char(10)                       null,
   mailAg               varchar(100)                   null,
   latitudeAg           float                          null,
   longitudeAg          float                          null,
   constraint PK_AGENCE primary key clustered (numAg)
);

/*==============================================================*/
/* Index : AGENCE_PK                                            */
/*==============================================================*/
create unique clustered index AGENCE_PK on Agence (
numAg ASC
);

/*==============================================================*/
/* Index : DIRIGER_FK                                           */
/*==============================================================*/
create index DIRIGER_FK on Agence (
numSal ASC
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create or replace table Client 
(
   numClient            integer                        not null,
   nomClient            varchar(100)                   null,
   pnomClient           varchar(100)                   null,
   adClient             varchar(100)                   null,
   cpClient             char(5)                        null,
   villeClient          varchar(100)                   null,
   latitudeClient       float                          null,
   longtiudeClient      float                          null,
   telClient            char(10)                       null,
   emailClient          varchar(100)                   null,
   constraint PK_CLIENT primary key clustered (numClient)
);

/*==============================================================*/
/* Index : CLIENT_PK                                            */
/*==============================================================*/
create unique clustered index CLIENT_PK on Client (
numClient ASC
);

/*==============================================================*/
/* Table : Demenagement                                         */
/*==============================================================*/
create or replace table Demenagement 
(
   numDemenagement      integer                        not null,
   numTpForm            integer                        not null,
   numClient            integer                        not null,
   etatDemenagement     varchar(100)                   null
   	constraint CKC_ETATDEMENAGEMENT_DEMENAGE check (etatDemenagement is null or (etatDemenagement in ('CONTACT','AVISITER','VISITEOK','PLAN','PLANOK','DEMOK','CLOS'))),
   datePrevueDemenagement date                           null,
   adChargementDemenagement varchar(100)                   null,
   cpChargementDemenagement char(5)                        null,
   villeChargementDemenagement varchar(100)                   null,
   latitudeChargementDemenagement float                          null,
   longitudeChargementDemenagement float                          null,
   adLivraisonDemenagement varchar(100)                   null,
   cpLivraisonDemenagement char(5)                        null,
   villeLivraisonDemenagement varchar(100)                   null,
   latitudeLivraisonDemenagement float                          null,
   longitudeLivraisonDemenagement float                          null,
   nbDemenageursDemenagement integer                        null,
   refDemenagement      varchar(100)                   null,
   constraint PK_DEMENAGEMENT primary key clustered (numDemenagement)
);

/*==============================================================*/
/* Index : DEMENAGEMENT_PK                                      */
/*==============================================================*/
create unique clustered index DEMENAGEMENT_PK on Demenagement (
numDemenagement ASC
);

/*==============================================================*/
/* Index : ORGANISER_FK                                         */
/*==============================================================*/
create index ORGANISER_FK on Demenagement (
numClient ASC
);

/*==============================================================*/
/* Index : CORRESPONDRE_FK                                      */
/*==============================================================*/
create index CORRESPONDRE_FK on Demenagement (
numTpForm ASC
);

/*==============================================================*/
/* Table : Enfant                                               */
/*==============================================================*/
create or replace table Enfant 
(
   numEnfant            integer                        not null,
   nomEnfant            varchar(100)                   null,
   pnomEnfant           varchar(100)                   null,
   dateNaisEnfant       date                           null,
   constraint PK_ENFANT primary key clustered (numEnfant)
);

/*==============================================================*/
/* Index : ENFANT_PK                                            */
/*==============================================================*/
create unique clustered index ENFANT_PK on Enfant (
numEnfant ASC
);

/*==============================================================*/
/* Table : Garage                                               */
/*==============================================================*/
create or replace table Garage 
(
   numGarage            integer                        not null,
   nomGarage            varchar(100)                   null,
   adGarage             varchar(100)                   null,
   cpGarage             char(5)                        null,
   villeGarage          varchar(100)                   null,
   telGarage            char(10)                       null,
   constraint PK_GARAGE primary key clustered (numGarage)
);

/*==============================================================*/
/* Index : GARAGE_PK                                            */
/*==============================================================*/
create unique clustered index GARAGE_PK on Garage (
numGarage ASC
);

/*==============================================================*/
/* Table : Gerer                                                */
/*==============================================================*/
create or replace table Gerer 
(
   numDemenagement      integer                        not null,
   numTpSal             integer                        not null,
   constraint PK_GERER primary key clustered (numDemenagement, numTpSal)
);

/*==============================================================*/
/* Index : GERER_PK                                             */
/*==============================================================*/
create unique clustered index GERER_PK on Gerer (
numDemenagement ASC,
numTpSal ASC
);

/*==============================================================*/
/* Index : GERER_FK                                             */
/*==============================================================*/
create index GERER_FK on Gerer (
numDemenagement ASC
);

/*==============================================================*/
/* Index : GERER2_FK                                            */
/*==============================================================*/
create index GERER2_FK on Gerer (
numTpSal ASC
);

/*==============================================================*/
/* Table : Immobilisation                                       */
/*==============================================================*/
create or replace table Immobilisation 
(
   numImmobilisation    integer                        not null,
   numGarage            integer                        not null,
   numVhc               integer                        not null,
   tpImmobilisation     varchar(100)                   null,
   kmTotauxImmobilisation integer                        null,
   dateDebImmobilisation date                           null,
   dateFinImmobilisation date                           null,
   infoSupImmobilisation varchar(100)                   null,
   constraint PK_IMMOBILISATION primary key clustered (numImmobilisation)
);

/*==============================================================*/
/* Index : IMMOBILISATION_PK                                    */
/*==============================================================*/
create unique clustered index IMMOBILISATION_PK on Immobilisation (
numImmobilisation ASC
);

/*==============================================================*/
/* Index : CONCERNER_FK                                         */
/*==============================================================*/
create index CONCERNER_FK on Immobilisation (
numVhc ASC
);

/*==============================================================*/
/* Index : ETRE_FK                                              */
/*==============================================================*/
create index ETRE_FK on Immobilisation (
numGarage ASC
);

/*==============================================================*/
/* Table : Parcourir                                            */
/*==============================================================*/
create or replace table Parcourir 
(
   numVhc               integer                        not null,
   Dem_numDemenagement  integer                        not null,
   numSal               integer                        not null,
   numDemenagement      integer                        not null,
   km                   integer                        null,
   constraint PK_PARCOURIR primary key clustered (numVhc, Dem_numDemenagement, numSal, numDemenagement)
);

/*==============================================================*/
/* Index : PARCOURIR_PK                                         */
/*==============================================================*/
create unique clustered index PARCOURIR_PK on Parcourir (
numVhc ASC,
Dem_numDemenagement ASC,
numSal ASC,
numDemenagement ASC
);

/*==============================================================*/
/* Index : PARCOURIR_FK                                         */
/*==============================================================*/
create index PARCOURIR_FK on Parcourir (
numVhc ASC
);

/*==============================================================*/
/* Index : PARCOURIR2_FK                                        */
/*==============================================================*/
create index PARCOURIR2_FK on Parcourir (
Dem_numDemenagement ASC
);

/*==============================================================*/
/* Index : PARCOURIR3_FK                                        */
/*==============================================================*/
create index PARCOURIR3_FK on Parcourir (
numSal ASC
);

/*==============================================================*/
/* Index : PARCOURIR4_FK                                        */
/*==============================================================*/
create index PARCOURIR4_FK on Parcourir (
numDemenagement ASC
);

/*==============================================================*/
/* Table : Parenter                                             */
/*==============================================================*/
create or replace table Parenter 
(
   numSal               integer                        not null,
   numEnfant            integer                        not null,
   Relation             varchar(2)                     null
   	constraint CKC_RELATION_PARENTER check (Relation is null or (Relation in ('P','M','BM','T'))),
   constraint PK_PARENTER primary key clustered (numSal, numEnfant)
);

/*==============================================================*/
/* Index : PARENTER_PK                                          */
/*==============================================================*/
create unique clustered index PARENTER_PK on Parenter (
numSal ASC,
numEnfant ASC
);

/*==============================================================*/
/* Index : PARENTER_FK                                          */
/*==============================================================*/
create index PARENTER_FK on Parenter (
numSal ASC
);

/*==============================================================*/
/* Index : PARENTER2_FK                                         */
/*==============================================================*/
create index PARENTER2_FK on Parenter (
numEnfant ASC
);

/*==============================================================*/
/* Table : Presenter                                            */
/*==============================================================*/
create or replace table Presenter 
(
   numSal               integer                        not null,
   numAg                integer                        not null,
   taux                 integer                        null
   	constraint CKC_TAUX_PRESENTE check (taux is null or (taux between 33 and 100)),
   constraint PK_PRESENTER primary key clustered (numSal, numAg)
);

/*==============================================================*/
/* Index : PRESENTER_PK                                         */
/*==============================================================*/
create unique clustered index PRESENTER_PK on Presenter (
numSal ASC,
numAg ASC
);

/*==============================================================*/
/* Index : PRESENTER_FK                                         */
/*==============================================================*/
create index PRESENTER_FK on Presenter (
numSal ASC
);

/*==============================================================*/
/* Index : PRESENTER2_FK                                        */
/*==============================================================*/
create index PRESENTER2_FK on Presenter (
numAg ASC
);

/*==============================================================*/
/* Table : Salarie                                              */
/*==============================================================*/
create or replace table Salarie 
(
   numSal               integer                        not null,
   numTpSal             integer                        not null,
   nomSal               varchar(100)                   null,
   pnomSal              varchar(100)                   null,
   dateNaisSal          date                           null,
   sexeSal              integer                        null
   	constraint CKC_SEXESAL_SALARIE check (sexeSal is null or (sexeSal in (Homme,Femme))),
   telSal               char(10)                       null,
   adSal                varchar(100)                   null,
   cpSal                char(5)                        null,
   villeSal             varchar(100)                   null,
   qualifieChefSal      smallint                       null,
   dateEmbaucheSal      date                           null,
   numPermisSal         char(12)                       null,
   constraint PK_SALARIE primary key clustered (numSal)
);

/*==============================================================*/
/* Index : SALARIE_PK                                           */
/*==============================================================*/
create unique clustered index SALARIE_PK on Salarie (
numSal ASC
);

/*==============================================================*/
/* Index : APPARTENIR_FK                                        */
/*==============================================================*/
create index APPARTENIR_FK on Salarie (
numTpSal ASC
);

/*==============================================================*/
/* Table : Type_Formule                                         */
/*==============================================================*/
create or replace table Type_Formule 
(
   numTpForm            integer                        not null,
   libTpForm            varchar(100)                   null,
   prixTpForm           numeric(8,2)                   null,
   constraint PK_TYPE_FORMULE primary key clustered (numTpForm)
);

/*==============================================================*/
/* Index : TYPE_FORMULE_PK                                      */
/*==============================================================*/
create unique clustered index TYPE_FORMULE_PK on Type_Formule (
numTpForm ASC
);

/*==============================================================*/
/* Table : Type_Salarie                                         */
/*==============================================================*/
create or replace table Type_Salarie 
(
   numTpSal             integer                        not null,
   libTpSal             varchar(100)                   null
   	constraint CKC_LIBTPSAL_TYPE_SAL check (libTpSal is null or (libTpSal in ('Commercial','Chef_d''exploitation','Déménageur'))),
   constraint PK_TYPE_SALARIE primary key clustered (numTpSal)
);

/*==============================================================*/
/* Index : TYPE_SALARIE_PK                                      */
/*==============================================================*/
create unique clustered index TYPE_SALARIE_PK on Type_Salarie (
numTpSal ASC
);

/*==============================================================*/
/* Table : Utiliser                                             */
/*==============================================================*/
create or replace table Utiliser 
(
   numVhc               integer                        not null,
   numDemenagement      integer                        not null,
   constraint PK_UTILISER primary key clustered (numVhc, numDemenagement)
);

/*==============================================================*/
/* Index : UTILISER_PK                                          */
/*==============================================================*/
create unique clustered index UTILISER_PK on Utiliser (
numVhc ASC,
numDemenagement ASC
);

/*==============================================================*/
/* Index : UTILISER_FK                                          */
/*==============================================================*/
create index UTILISER_FK on Utiliser (
numVhc ASC
);

/*==============================================================*/
/* Index : UTILISER2_FK                                         */
/*==============================================================*/
create index UTILISER2_FK on Utiliser (
numDemenagement ASC
);

/*==============================================================*/
/* Table : Vehicule                                             */
/*==============================================================*/
create or replace table Vehicule 
(
   numVhc               integer                        not null,
   immatVhc             char(9)                        null,
   dateMiseCircVhc      date                           null,
   volumeUtileVhc       float                          null,
   nbPlacesVhc          integer                        null,
   tpVhc                varchar(100)                   null,
   marqueVhc            varchar(100)                   null,
   ptacVhc              float                          null,
   frequenceEntretienVhc integer                        null,
   constraint PK_VEHICULE primary key clustered (numVhc)
);

/*==============================================================*/
/* Index : VEHICULE_PK                                          */
/*==============================================================*/
create unique clustered index VEHICULE_PK on Vehicule (
numVhc ASC
);

alter table Absence
   add constraint FK_ABSENCE_AVOIR_SALARIE foreign key (numSal)
      references Salarie (numSal)
      on update restrict
      on delete restrict;

alter table Agence
   add constraint FK_AGENCE_DIRIGER_SALARIE foreign key (numSal)
      references Salarie (numSal)
      on update restrict
      on delete restrict;

alter table Demenagement
   add constraint FK_DEMENAGE_CORRESPON_TYPE_FOR foreign key (numTpForm)
      references Type_Formule (numTpForm)
      on update restrict
      on delete restrict;

alter table Demenagement
   add constraint FK_DEMENAGE_ORGANISER_CLIENT foreign key (numClient)
      references Client (numClient)
      on update restrict
      on delete restrict;

alter table Gerer
   add constraint FK_GERER_GERER_DEMENAGE foreign key (numDemenagement)
      references Demenagement (numDemenagement)
      on update restrict
      on delete restrict;

alter table Gerer
   add constraint FK_GERER_GERER2_TYPE_SAL foreign key (numTpSal)
      references Type_Salarie (numTpSal)
      on update restrict
      on delete restrict;

alter table Immobilisation
   add constraint FK_IMMOBILI_CONCERNER_VEHICULE foreign key (numVhc)
      references Vehicule (numVhc)
      on update restrict
      on delete restrict;

alter table Immobilisation
   add constraint FK_IMMOBILI_ETRE_GARAGE foreign key (numGarage)
      references Garage (numGarage)
      on update restrict
      on delete restrict;

alter table Parcourir
   add constraint FK_PARCOURI_PARCOURIR_VEHICULE foreign key (numVhc)
      references Vehicule (numVhc)
      on update restrict
      on delete restrict;

alter table Parcourir
   add constraint FK_PARCOURI_PARCOURIR_SALARIE foreign key (numSal)
      references Salarie (numSal)
      on update restrict
      on delete restrict;

alter table Parcourir
   add constraint FK_PARCOURI_PARCOURIR_DEMENAGE foreign key (numDemenagement)
      references Demenagement (numDemenagement)
      on update restrict
      on delete restrict;

alter table Parenter
   add constraint FK_PARENTER_PARENTER_SALARIE foreign key (numSal)
      references Salarie (numSal)
      on update restrict
      on delete restrict;

alter table Parenter
   add constraint FK_PARENTER_PARENTER2_ENFANT foreign key (numEnfant)
      references Enfant (numEnfant)
      on update restrict
      on delete restrict;

alter table Presenter
   add constraint FK_PRESENTE_PRESENTER_SALARIE foreign key (numSal)
      references Salarie (numSal)
      on update restrict
      on delete restrict;

alter table Presenter
   add constraint FK_PRESENTE_PRESENTER_AGENCE foreign key (numAg)
      references Agence (numAg)
      on update restrict
      on delete restrict;

alter table Salarie
   add constraint FK_SALARIE_APPARTENI_TYPE_SAL foreign key (numTpSal)
      references Type_Salarie (numTpSal)
      on update restrict
      on delete restrict;

alter table Utiliser
   add constraint FK_UTILISER_UTILISER_VEHICULE foreign key (numVhc)
      references Vehicule (numVhc)
      on update restrict
      on delete restrict;

alter table Utiliser
   add constraint FK_UTILISER_UTILISER2_DEMENAGE foreign key (numDemenagement)
      references Demenagement (numDemenagement)
      on update restrict
      on delete restrict;

