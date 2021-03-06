SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP SCHEMA IF EXISTS smartappschematest CASCADE;
CREATE SCHEMA smartappschematest;

ALTER SCHEMA smartappschematest OWNER TO postgres;

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA smartappschematest;
COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
SET search_path = smartappschematest, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

CREATE TABLE access_mode (endpoint integer,access_mode text NOT NULL);
ALTER TABLE access_mode OWNER TO postgres;
CREATE TABLE data_type (endpoint integer,data_type text NOT NULL);
ALTER TABLE data_type OWNER TO postgres;
CREATE TABLE endpoint (id integer NOT NULL,url text NOT NULL,type text,description text,prj_code integer,mirror text);
ALTER TABLE endpoint OWNER TO postgres;
CREATE TABLE indicator_initiative_ass (endpoint integer,code text);
ALTER TABLE indicator_initiative_ass OWNER TO postgres;
CREATE TABLE indicators (code text NOT NULL,description text,vocabulary text,methodologies text,parameters text,uom text NOT NULL);
ALTER TABLE indicators OWNER TO postgres;
CREATE TABLE initiative (prj_code integer NOT NULL,name text,website text,status text,project_leader text,project_partners text,startdate date,enddate date,description text,geographicalscope text,geographicalscope_details text,conditions_access_use text,conditions_access_use_details text,barriers text,lessons_learnt text,useful_links text);
ALTER TABLE initiative OWNER TO postgres;
CREATE TABLE output_format (endpoint integer,output_format text NOT NULL);
ALTER TABLE output_format OWNER TO postgres;
CREATE TABLE vocabularies (name text NOT NULL,url text,comments text,domain text,prj_code integer NOT NULL);
ALTER TABLE vocabularies OWNER TO postgres;

INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (0,'https://apps.who.int/iris/rest/bitstreams/1272502/retrieve','downloadable file','provides guidance to Member States on implementation of global surveillance of COVID-19. The objectives of this global surveillance are: 1. to monitor trends of the disease where human to human transmission occurs;2. rapidly detect new cases in countries where the virus is not circulating;3. to provide epidemiological information to conduct risk assessments at the national, regional and global level; and to provide epidemiological information to guide preparedness and response measures.\r\n',1,'');	
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (1,'https://covid19.who.int/WHO-COVID-19-global-data.csv','downloadable file','provides different indicators values per day and by country',1,'');	
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (2,'https://www.who.int/docs/default-source/coronaviruse/weekly-reporting-of-new-cases-of-covid-19.xlsx?sfvrsn=885f86a7_2','downloadable file','provides template for weekly reporting of new cases of COVID-19 in accordance to guidelines',1,'');
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (3,'https://covid19.who.int/','online dashboard','possibility to query by country, indicators etc ...',1,'');	
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (4,'https://www.ecdc.europa.eu/en/cases-2019-ncov-eueea','Overview','COVID-19 data',2,'');	
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (5,'https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide','downloadable file','daily number of new reported cases of COVID-19 by country worldwide',2,'');	
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (6,'https://github.com/CSSEGISandData/COVID-19/blob/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv','downloadable file','Confirmed Covid 19 cases worldwide',3,'');	
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (7,'https://github.com/CSSEGISandData/COVID-19/blob/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv','downloadable file','Covid 19 deaths worldwide',3,'');	
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (8,'https://github.com/CSSEGISandData/COVID-19/blob/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv','downloadable file','Covid 19 recoveries worldwide',3,'');
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (9,'https://covidsta.hft-stuttgart.de/server/v1.1','SensorThings API','Covid 19 Cases worldwide',5,'');	
INSERT INTO endpoint (id, url, type, description, prj_code, mirror) VALUES (10,'http://www.covid19dashboard.org/','Dashboard','Covid 19 Cases worldwide',5,'');	
INSERT INTO indicator_initiative_ass (endpoint, code) VALUES (9,'Cases24H');
INSERT INTO indicator_initiative_ass (endpoint, code) VALUES (9,'Deaths24H');
INSERT INTO indicator_initiative_ass (endpoint, code) VALUES (9,'Recov24H');
INSERT INTO indicator_initiative_ass (endpoint, code) VALUES (10,'Cases24H');
INSERT INTO indicator_initiative_ass (endpoint, code) VALUES (10,'Deaths24H');
INSERT INTO indicator_initiative_ass (endpoint, code) VALUES (10,'Recov24H');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('CasesTot','Cases - cumulative total','GeoCovidWatch','\N','\N','nr of cases');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('CasesTot/M','Cases - cumulative total per 1 million population','GeoCovidWatch','\N','\N','nr of cases/1million population');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('Cases7D','Cases - newly reported in last 7 days','GeoCovidWatch','\N','\N','nr of cases/7day');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('Cases24H','Cases - newly reported in last 24 hours','GeoCovidWatch','\N','\N','nr of cases/day');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('DeathsTot','Deaths - cumulative total','GeoCovidWatch','\N','\N','nr of cases');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('DeathsTot/M','Deaths - cumulative total per 1 million population','GeoCovidWatch','\N','\N','nr of cases/1million population');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('Deaths7D','Deaths - newly reported in last 7 days','GeoCovidWatch','\N','\N','nr of cases/7day');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('Deaths24H','Deaths - newly reported in last 24 hours','GeoCovidWatch','\N','\N','nr of cases/day');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('TransClass','Transmission Classification (community transmission / clusters of cases)','GeoCovidWatch','\N','\N','transmission type');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('RecovTot','Recovered - cumulative total','GeoCovidWatch','\N','\N','nr of cases');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('RecovTot/M','Recovered - cumulative total per 1 million population','GeoCovidWatch','\N','\N','nr of cases/1million population');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('Recov7D','Recovered - newly reported in last 7 days','GeoCovidWatch','\N','\N','nr of cases/7day');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('Recov24H','Recovered - newly reported in last 24 hours','GeoCovidWatch','\N','\N','nr of cases/day');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('CasesHosp','# Cases in Hospital','GeoCovidWatch','\N','\N','nr of cases');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('CasesICU','# Cases in ICU','GeoCovidWatch','\N','\N','nr of cases/1million population');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('PCR/D','# PCR Tests / day','GeoCovidWatch','\N','\N','nr of tests/day');
INSERT INTO indicators (code, description, vocabulary, methodologies, parameters, uom) VALUES ('PCR/D/M','# PCR Tests / day by 1M pop','GeoCovidWatch','\N','\N','nr of tests/day/1million population');
INSERT INTO initiative (prj_code, name, website, status, project_leader, project_partners, startdate, enddate, description, geographicalscope, geographicalscope_details, conditions_access_use, conditions_access_use_details, barriers, lessons_learnt, useful_links) VALUES (0,'EDP for COVID-19','https://www.europeandataportal.eu/en/covid-19/overview','closed','EC','',null,'2020-06-30','The European Data Portal has run until the end of June 2020 a dedicated section for COVID-19 with the purpose of providing a better understanding of the current global emergency. In this section, we aimed to empower citizens by presenting relevant datasets, data-related initiatives and editorial pieces on the topic. The dedicated section is no longer maintained but is available until the end of July, and will later be moved to the Impact & Studies section of the website.','Europe','','','','','','https://www.europeandataportal.eu/en/covid-19/datasets');
INSERT INTO initiative (prj_code, name, website, status, project_leader, project_partners, startdate, enddate, description, geographicalscope, geographicalscope_details, conditions_access_use, conditions_access_use_details, barriers, lessons_learnt, useful_links) VALUES (1,'WHO - Global COVID-19 Dashboard','https://covid19.who.int','ongoing','World Health Organisation (WHO)','','2020-01-01',null,'','World','','','','','','');						
INSERT INTO initiative (prj_code, name, website, status, project_leader, project_partners, startdate, enddate, description, geographicalscope, geographicalscope_details, conditions_access_use, conditions_access_use_details, barriers, lessons_learnt, useful_links) VALUES (2,'European Center for Disease Control (ECDC)','https://www.ecdc.europa.eu/en/covid-19-pandemic','ongoing','European Center for Disease Control (ECDC)','',null,null,'','Europe','','','','','','https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide');
INSERT INTO initiative (prj_code, name, website, status, project_leader, project_partners, startdate, enddate, description, geographicalscope, geographicalscope_details, conditions_access_use, conditions_access_use_details, barriers, lessons_learnt, useful_links) VALUES (3,'Johns Hopkins Coronavirus Resource Center','https://coronavirus.jhu.edu/','ongoing','Johns Hopkins University of Medicine','',null,null,'','World','','','','','','');						
INSERT INTO initiative (prj_code, name, website, status, project_leader, project_partners, startdate, enddate, description, geographicalscope, geographicalscope_details, conditions_access_use, conditions_access_use_details, barriers, lessons_learnt, useful_links) VALUES (4,'Robert Koch Institute COVID-19','https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/nCoV.html','ongoing','Robert Koch Institute','',null,null,'','Germany','','','','','','https://experience.arcgis.com/experience/478220a4c454480e823b17327b2bf1d4');
INSERT INTO initiative (prj_code, name, website, status, project_leader, project_partners, startdate, enddate, description, geographicalscope, geographicalscope_details, conditions_access_use, conditions_access_use_details, barriers, lessons_learnt, useful_links) VALUES (5,'CovidSta','https://covidsta.hft-stuttgart.de/server/','ongoing','Technical University Stuttgart','DataCove e.U.','2020-01-03',null,'COVID-19 SensorThings Server built with "Fraunhofer Open-source SensorThings Server" (FROST) by Thunyathep Santhanavanich (JOE) PhD candidate','World','','','','','','');						
INSERT INTO output_format (endpoint, output_format) VALUES (9, 'Output format 1');
INSERT INTO output_format (endpoint, output_format) VALUES (9, 'Output format 2');
INSERT INTO output_format (endpoint, output_format) VALUES (5, 'Output format 3');
INSERT INTO output_format (endpoint, output_format) VALUES (5, 'Output format 4');
INSERT INTO output_format (endpoint, output_format) VALUES (2, 'Output format 5');
INSERT INTO output_format (endpoint, output_format) VALUES (2, 'Output format 6');
INSERT INTO output_format (endpoint, output_format) VALUES (1, 'Output format 7');
INSERT INTO output_format (endpoint, output_format) VALUES (3, 'Output format 8');
INSERT INTO access_mode (endpoint, access_mode) VALUES (9, 'Access mode 1');
INSERT INTO access_mode (endpoint, access_mode) VALUES (4, 'Access mode 2');
INSERT INTO access_mode (endpoint, access_mode) VALUES (2, 'Access mode 3');
INSERT INTO access_mode (endpoint, access_mode) VALUES (1, 'Access mode 4');
INSERT INTO access_mode (endpoint, access_mode) VALUES (5, 'Access mode 5');
INSERT INTO access_mode (endpoint, access_mode) VALUES (6, 'Access mode 6');
INSERT INTO access_mode (endpoint, access_mode) VALUES (7, 'Access mode 7');
INSERT INTO access_mode (endpoint, access_mode) VALUES (9, 'Access mode 8');
INSERT INTO data_type (endpoint, data_type) VALUES (9, 'Data type 1');
INSERT INTO data_type (endpoint, data_type) VALUES (9, 'Data type 2');
INSERT INTO data_type (endpoint, data_type) VALUES (9, 'Data type 3');
INSERT INTO data_type (endpoint, data_type) VALUES (2, 'Data type 4');
INSERT INTO data_type (endpoint, data_type) VALUES (2, 'Data type 5');
INSERT INTO data_type (endpoint, data_type) VALUES (1, 'Data type 6');
INSERT INTO data_type (endpoint, data_type) VALUES (4, 'Data type 7');
INSERT INTO data_type (endpoint, data_type) VALUES (5, 'Data type 8');
INSERT INTO vocabularies (name, url, comments, domain, prj_code) VALUES ('GeoCovidWatch','https://www.go-peg.eu/','Dummy Catchall for GeoCovidWatch','Covid Related Data',0);
INSERT INTO vocabularies (name, url, comments, domain, prj_code) VALUES ('TestWatch','https://www.go-peg.eu/','Dummy Catchall for TestWatch','Test Related Data',0);

ALTER TABLE ONLY endpoint ADD CONSTRAINT endpoint_pkey PRIMARY KEY (id);
ALTER TABLE ONLY indicators ADD CONSTRAINT indicators_pkey PRIMARY KEY (code);
ALTER TABLE ONLY initiative ADD CONSTRAINT initiative_pkey PRIMARY KEY (prj_code);
ALTER TABLE ONLY vocabularies ADD CONSTRAINT vocabularies_pkey PRIMARY KEY (name);
ALTER TABLE ONLY access_mode ADD CONSTRAINT access_mode_endpoint_fkey FOREIGN KEY (endpoint) REFERENCES endpoint(id);
ALTER TABLE ONLY data_type ADD CONSTRAINT data_type_endpoint_fkey FOREIGN KEY (endpoint) REFERENCES endpoint(id);
ALTER TABLE ONLY endpoint ADD CONSTRAINT endpoint_prj_code_fkey FOREIGN KEY (prj_code) REFERENCES initiative(prj_code);
ALTER TABLE ONLY indicator_initiative_ass ADD CONSTRAINT indicator_initiative_ass_code_fkey FOREIGN KEY (code) REFERENCES indicators(code);
ALTER TABLE ONLY indicator_initiative_ass ADD CONSTRAINT indicator_initiative_ass_endpoint_fkey FOREIGN KEY (endpoint) REFERENCES endpoint(id);
ALTER TABLE ONLY indicators ADD CONSTRAINT indicators_vocabulary_fkey FOREIGN KEY (vocabulary) REFERENCES vocabularies(name);
ALTER TABLE ONLY output_format ADD CONSTRAINT output_format_endpoint_fkey FOREIGN KEY (endpoint) REFERENCES endpoint(id);
