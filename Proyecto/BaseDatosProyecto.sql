USE proyecto;

CREATE TABLE CAMPEONATO (
    id_campeonato   INT             PRIMARY KEY AUTO_INCREMENT,
    nombre          VARCHAR(100)    NOT NULL,
    fecha_inicio    DATE            NOT NULL,
    fecha_fin       DATE            NOT NULL,
    ubicacion       VARCHAR(200)    NOT NULL,
    estado          VARCHAR(10) 	NOT NULL DEFAULT 'futuro', -- futuro, en curso, finalizado,,
    descripcion     VARCHAR(200)
);

-- No he metido en la clave primaria edad porque los pesos cambian tambien por edad por lo que no puedes coincidir
CREATE TABLE CATEGORIA (           
    id_campeonato	INT				NOT NULL,			
    nombre          VARCHAR(100)    NOT NULL,
    modalidad            VARCHAR(6)		NOT NULL, -- kumite, kata
    genero          CHAR			NOT NULL,-- (M) masculino, (F) femenino
    peso_maximo     DECIMAL(4,2)	NOT NULL,
    edad_minima     INT             NOT NULL,
    edad_maxima     INT             NOT NULL,
	CONSTRAINT FK_CATEGORIA_CAMPEONATO FOREIGN KEY (id_campeonato) REFERENCES CAMPEONATO(id_campeonato),
    PRIMARY KEY(id_campeonato, modalidad, genero, peso_maximo)
);

CREATE TABLE COMPETIDOR (
    id_competidor           INT             PRIMARY KEY AUTO_INCREMENT,
    nombre                  VARCHAR(50)     NOT NULL,
    apellidos               VARCHAR(100)    NOT NULL,
    dni                     VARCHAR(20)     NOT NULL,
    fecha_nacimiento        DATE            NOT NULL,
    genero                  CHAR			NOT NULL, -- (M) masculino, (F) femenino
    club                    VARCHAR(100)    NOT NULL,
    federacion_autonomica   VARCHAR(100)    NOT NULL
);

CREATE TABLE CATEGORIA_COMPETIDOR(
	id_competidor	INT 			NOT NULL,
    id_campeonato	INT				NOT NULL,
    modalidad       VARCHAR(6)		NOT NULL, -- kumite, kata
    genero          CHAR			NOT NULL,-- (M) masculino, (F) femenino
    peso_maximo     DECIMAL(4,2)	NOT NULL,
	PRIMARY KEY(id_compeditor,id_campeonato,tipo,genero,peso_maximo),
    CONSTRAINT FK_CC_CATEGORIA FOREIGN KEY (id_campeonato, modalidad, genero, peso_maximo) REFERENCES CATEGORIA(id_campeonato, modalidad, genero, peso_maximo),
	CONSTRAINT FK_CATEGORIA_COMPETIDOR_COMPETIDOR FOREIGN KEY (id_competidor) REFERENCES COMPETIDOR(id_competidor)
);

CREATE TABLE COMBATE (
   ronda                   		VARCHAR(50) NOT NULL, -- 'final', 'semifinal', 'cuartos', '1/8', '1/16', etc.
   id_competidor_rojo      		INT			NOT NULL,
   id_competidor_azul      		INT			NOT NULL,
   numero_tatami				INT			NOT NULL,
   puntuacion_rojo         		INT         DEFAULT 0,
   puntuacion_azul         		INT         DEFAULT 0,
   senshu                  		VARCHAR(7)  DEFAULT 'ninguno', -- rojo, azul, ninguno
   penalizacion_actual_rojo 	VARCHAR(12) DEFAULT 'ninguna', -- ninguna, chui 1, chui 2, chui 3, hansoku-chui, hansoku
   penalizacion_actual_azul 	VARCHAR(12) DEFAULT 'ninguna', -- ninguna, chui 1, chui 2, chui 3, hansoku-chui, hansoku
   estado                  		VARCHAR(10) DEFAULT 'pendiente', -- pediente, en curso, finalizado
   hora_programada         		TIME		NOT NULL,
   hora_inicio_real        		DATETIME 	NOT NULL,
   duracion_segundos       		INT			NOT NULL,
   observaciones           		TEXT,  
   PRIMARY KEY(id_competidor_rojo, id_competidor_azul, numero_tatami),
   CONSTRAINT FK_COMBATE_COMPETIDOR_ROJO FOREIGN KEY (id_competidor_rojo) REFERENCES COMPETIDOR(id_competidor),
   CONSTRAINT FK_COMBATE_COMPETIDOR_AZUL FOREIGN KEY (id_competidor_azul) REFERENCES COMPETIDOR(id_competidor)
);

CREATE TABLE ARBITRO (
    id_arbitro          INT             PRIMARY KEY AUTO_INCREMENT,
    nombre              VARCHAR(50)     NOT NULL,
    apellidos           VARCHAR(100)    NOT NULL,
    licencia            VARCHAR(50)     NOT NULL UNIQUE,
    categoria_arbitral  VARCHAR(50)     NOT NULL, -- 'Provincial', 'Regional', 'Nacional', 'Internacional'.
    activo              BOOLEAN         DEFAULT TRUE
);

CREATE TABLE CLASIFICACION(
	id_clasificacion	INT 				PRIMARY KEY,
    nombre_categoria	VARCHAR(100)		NOT NULL,
	nombre_competidor	VARCHAR(100)		NOT NULL,
	puntos				INT					NOT NULL
);