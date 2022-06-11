DROP TABLE IF EXISTS Studente CASCADE;
DROP TABLE IF EXISTS Docente CASCADE;
DROP TABLE IF EXISTS Modulo CASCADE;
DROP TABLE IF EXISTS Esame CASCADE;
DROP TABLE IF EXISTS Corso_Laurea CASCADE;
DROP TABLE IF EXISTS Dipartimento CASCADE;
DROP TABLE IF EXISTS Sede CASCADE;
DROP TABLE IF EXISTS Sede_Dipartimento CASCADE;

CREATE TABLE Corso_Laurea(
	codice char(6) PRIMARY KEY,
	nome varchar(50) NOT NULL,
	descrizione TEXT 
);

CREATE TABLE Studente(
	
	matricola char(6) PRIMARY KEY,
	corso_laurea char(6) NOT NULL REFERENCES Corso_Laurea,
	nome varchar(50) NOT NULL,
	cognome varchar(50) NOT NULL,
	data_nascita date CHECK(data_nascita >= '1960-01-01'),
	codice_fiscale char(16) NOT NULL
);

CREATE TABLE Dipartimento(
	codice char(6) PRIMARY KEY,
	nome varchar(50) NOT NULL
);

CREATE TABLE Docente(

	matricola char(6) PRIMARY KEY,
	dipartimento char(6) NOT NULL REFERENCES Dipartimento,
	nome varchar(50) NOT NULL,
	cognome varchar(50) NOT NULL,
	data_nascita date CHECK(data_nascita > '1960-01-01'),
	codice_fiscale char(16) NOT NULL UNIQUE
);


CREATE TABLE Modulo(

	codice char(6) PRIMARY KEY,
	nome varchar(50) NOT NULL,
	descrizione TEXT,
	cfu int CHECK (cfu >= 6 AND cfu<= 12)
);

CREATE TABLE Esame(
	
	matricola_studente char(6) NOT NULL,
	codice_modulo char(6) NOT NULL,
	matricola_docente char(6) NOT NULL,
	data_esame date CHECK (data_esame >= '2021-01-01' AND data_esame <= '2021-12-31'),
	voto int CHECK(voto >= '18' AND voto <= '30'),
	note TEXT,
	
	FOREIGN KEY(matricola_studente)
		REFERENCES Studente(matricola),
	FOREIGN KEY(codice_modulo)
		REFERENCES Modulo(codice),
	FOREIGN KEY(matricola_docente)
		REFERENCES Docente(matricola)

);

CREATE TABLE Sede(
	codice char(6) PRIMARY KEY,
	indirizzo varchar(50) NOT NULL,
	citta varchar(50) NOT NULL
);

CREATE TABLE Sede_Dipartimento(
	
	codice_sede char(6) NOT NULL,
	codice_dipartimento char(6) NOT NULL,
	note TEXT,
	PRIMARY KEY (codice_sede, codice_dipartimento),
	FOREIGN KEY (codice_sede)
		REFERENCES Sede(codice),
	FOREIGN KEY (codice_dipartimento)
		REFERENCES Dipartimento (codice)
);



INSERT INTO Corso_Laurea(codice,nome,descrizione)
 VALUES('INFO','Informatica',NULL);
INSERT INTO Corso_Laurea(codice,nome,descrizione)
 VALUES('ICD','Informatica e Comunicazione Digitale',NULL);


INSERT INTO Studente (matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	VALUES ('744009','ICD','Francesco','Farina','2001-03-10','FRNFNC01C10A048G');	
INSERT INTO Studente (matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	VALUES ('432321','ICD','Marco','Caraccio','2000-06-21','DFMDML21121DE43A');
INSERT INTO Studente (matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	VALUES ('123456','ICD','Lautaro','Martinez','1999-02-19','ALMNDE1921AADWE6');
INSERT INTO Studente (matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	VALUES ('232121','INFO','Giovanni','Marchighiano','2001-08-23','ADKWK1923AL43JFG');
INSERT INTO Studente (matricola,corso_laurea,nome,cognome,data_nascita,codice_fiscale)
	VALUES ('233132','INFO','Manuel','Piccolo','2001-10-11','MNLPXCC0121KLEW8');
	
	

	
	
INSERT INTO Dipartimento(codice,nome)
	VALUES('INFO','EX FACOLTA DEGLI STUDI DI FISICA');
INSERT INTO Dipartimento(codice,nome)
	VALUES('ARG','FACOLTA DI MILANO');
INSERT INTO Dipartimento(codice,nome)
	VALUES('BUL','UNIVERSITA DI BARI');
INSERT INTO Dipartimento(codice,nome)
	VALUES('ANG','UNIVERSITA VICINO BARI');


INSERT INTO Docente (matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	VALUES('212111','INFO','Carlo','Magno','1984-02-13','MGLCRN0122121176');
INSERT INTO Docente (matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	VALUES('321211','INFO','Gennaro','Vessio','1976-05-12','GNVLDS2193GNL031');
INSERT INTO Docente (matricola,dipartimento,nome,cognome,data_nascita,codice_fiscale)
	VALUES('231121','BUL','Genni','Fragnelli','1960-03-19','GNVLDS2193GNL032');

	
	
INSERT INTO Modulo(codice,nome,descrizione,cfu)
	VALUES('000001','Basi di Dati', NULL, '9');
INSERT INTO Modulo(codice,nome,descrizione,cfu)
	VALUES('000002','Calcolo Numerico', NULL, '6');
INSERT INTO Modulo(codice,nome,descrizione,cfu)
	VALUES('000003','Ingegneria del Software', NULL, '12');

	
INSERT INTO Esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto,note)
	VALUES('123456','000001','212111','2021-02-15','29',NULL);	
INSERT INTO Esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto,note)
	VALUES('432321','000001','212111','2021-02-15','27',NULL);	
INSERT INTO Esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto,note)
	VALUES('744009','000001','212111','2021-02-15','21',NULL);	
INSERT INTO Esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto,note)
	VALUES('123456','000001','212111','2021-03-01','30',NULL);
INSERT INTO Esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto,note)
	VALUES('432321','000001','212111','2021-03-01','28',NULL);
INSERT INTO Esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto,note)
	VALUES('744009','000002','321211','2021-03-01','28',NULL);
INSERT INTO Esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto,note)
	VALUES('744009','000003','231121','2021-03-01','30',NULL);
INSERT INTO Esame(matricola_studente,codice_modulo,matricola_docente,data_esame,voto,note)
	VALUES('744009','000003','231121','2021-03-01','18',NULL);


INSERT INTO Sede (codice,indirizzo,citta)
	VALUES('INFO','Ruggiero 3', 'Taranto');
INSERT INTO Sede(codice,indirizzo,citta)
	VALUES('ARG','Paolo 12','Milano');
INSERT INTO Sede(codice,indirizzo,citta)
	VALUES('BUL','Giovanni 2','Brindisi');
INSERT INTO Sede(codice,indirizzo,citta)
	VALUES('ANG','Carmelo 3','Brindisi');
	
	


/*QUERY1 Mostrare nome e descrizione di tutti i moduli da 9 CFU*/ 

SELECT nome,descrizione
FROM Modulo
WHERE cfu = '9'

/*QUERY2 Mostrare matricola, nome e cognome dei docenti che hanno più di 60 anni*/ 

SELECT matricola,nome,cognome
FROM Docente
WHERE data_nascita <= current_timestamp - interval '60 years'

/*QUERY3 Mostrare nome, cognome e nome del dipartimento di ogni docente, ordinati dal più giovane al più anziano.*/ 
	
SELECT Docente.nome,cognome,Dipartimento.nome
FROM Docente, Dipartimento
WHERE Docente.dipartimento = Dipartimento.codice
ORDER BY data_nascita DESC

/*QUERY4 Mostrare città e indirizzo di ogni sede del dipartimento di codice "INFO"*/

SELECT s.citta,s.indirizzo
FROM Sede s, Sede_Dipartimento sd
WHERE s.codice = sd.codice_sede AND sd.codice_dipartimento = 'INFO'

	
/*QUERY5 Mostrare nome del dipartimento, città e indirizzo di ogni sede di ogni dipartimento,
ordinate alfabeticamente prima per nome dipartimento, poi per nome città e infine per indirizzo.*/

SELECT d.nome,s.citta,s.indirizzo
FROM Dipartimento d, Sede s
WHERE d.codice = s.codice
ORDER BY s.indirizzo /*d.nome,s.citta*/ 

/*QUERY6 Mostrare il nome di ogni dipartimento che ha una sede a Bari*/

SELECT d.nome
FROM Dipartimento d, Sede s
WHERE s.citta ='Bari' AND d.codice = s.codice
GROUP BY d.nome
HAVING COUNT(*)=1 


/*QUERY7 Mostrare il nome di ogni dipartimento che non ha sede a Brindisi.*/

SELECT  d.nome,s.citta
FROM Dipartimento d, sede s
WHERE d.codice = s.codice
EXCEPT
SELECT d.nome,s.citta
FROM Dipartimento d, Sede s
WHERE s.citta = 'Brindisi' AND d.codice = s.codice


/*QUERY8 Mostrare media, numero esami sostenuti e totale CFU acquisiti dello studente con matricola 123456.*/

SELECT AVG(e.voto)  AS media_esami, COUNT(md.codice)  AS num_esami, SUM(md.cfu)  AS totale_cfu
FROM Modulo md, Esame e, Studente s
WHERE md.codice = e.codice_modulo AND e.matricola_studente = s.matricola AND s.matricola = '123456'


/*QUERY9 Mostrare nome, cognome, nome del corso di laurea, 
media e numero esami sostenuti dello studente con matricola 123456.*/

SELECT s.nome, s.cognome,cs.nome,s.matricola, AVG(e.voto) AS media_esami, COUNT(md.codice) AS esami_sostenuti
FROM Studente s, Corso_Laurea cs, Esame e, Modulo md
WHERE cs.nome = s.corso_laurea AND  s.matricola = e.matricola_studente AND e.codice_modulo = md.codice  
GROUP BY s.nome, s.cognome,cs.nome,s.matricola
HAVING s.matricola='123456'



/*QUERY10 Mostrare codice, nome e voto medio di ogni modulo, ordinati dalla media più alta alla più bassa.*/

SELECT md.codice, md.nome, AVG(e.voto) AS media_modulo
FROM Modulo md, Esame e
WHERE md.codice = e.codice_modulo 
GROUP BY md.codice, md.nome
ORDER BY media_modulo DESC


/*QUERY11? Mostrare nome e cognome del docente, nome e descrizione del modulo per ogni docente
ed ogni modulo di cui quel docente abbia tenuto almeno un esame; 
il risultato deve includere anche i docenti che non abbiano tenuto alcun esame,
in quel caso rappresentati con un'unica tupla in cui nome e descrizione del modulo avranno valore NULL.*/

SELECT d.nome,d.cognome,md.nome,md.descrizione,md.codice, COUNT(md.codice) >=1 AS Ha_tenuto_almeno_un_esame
FROM Docente d, Modulo md, Esame e
WHERE d.matricola = e.matricola_docente AND e.codice_modulo = md.codice
GROUP BY d.nome,d.cognome,md.nome,md.descrizione,md.codice
 
 
 
 /*QUERY12 Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente.*/

SELECT s.matricola,s.nome,s.cognome,s.data_nascita, AVG(voto) AS media, COUNT(e.voto) AS esami_sostenuti
FROM Studente s, Esame e
WHERE s.matricola = e.matricola_studente
GROUP BY s.matricola,s.nome,s.cognome,s.data_nascita


/*QUERY13 Mostrare matricola, nome, cognome, data di nascita,
media e numero esami sostenuti di ogni studente del corso di laurea di codice "ICD"
che abbia media maggiore di 27.*/

SELECT s.matricola,s.nome,s.cognome,s.data_nascita,s.corso_laurea, AVG(e.voto) AS media, COUNT(e.voto) AS esami_sostenuti
FROM Studente s, Esame e
WHERE s.matricola = e.matricola_studente
GROUP BY s.matricola,s.nome,s.cognome,s.data_nascita,s.corso_laurea
HAVING s.corso_laurea = 'ICD' AND AVG(e.voto) > '27'

/*QUERY14? Mostrare nome, cognome e data di nascita di tutti gli studenti 
che ancora non hanno superato nessun esame.*/

SELECT s.nome,s.cognome,s.data_nascita
FROM Studente s, Esame e
GROUP BY s.nome,s.cognome,s.data_nascita
EXCEPT
SELECT s.nome,s.cognome,s.data_nascita
FROM Studente s, Esame e
GROUP BY s.nome,s.cognome,s.data_nascita
HAVING  COUNT(e.voto)>=1 


/*QUERY15? Mostrare la matricola di tutti gli studenti 
che hanno superato almeno un esame e che hanno preso sempre voti maggiori di 26.*/

SELECT s.matricola,e.voto, COUNT(e.voto) >=1 AS almeno_un_esame_superato
FROM Studente s, Esame e
WHERE s.matricola=e.matricola_studente  
GROUP BY s.matricola,e.voto
HAVING e.voto > '26'


/*QUERY16? Mostrare, per ogni modulo, il numero degli studenti che hanno preso tra 18 e 21, 
quelli che hanno preso tra 22 e 26 e quelli che hanno preso tra 27 e 30 (con un'unica interrogazione).*/

SELECT md.codice,COUNT(e.voto>='18' AND e.voto<='21') AS voto_21, COUNT(e.voto>='22' AND e.voto<='26') AS voto_26, COUNT(e.voto>='27' AND e.voto<='30')  AS voto_30
FROM Esame e, Modulo md
WHERE e.codice_modulo = md.codice
GROUP BY md.codice











