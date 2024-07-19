-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-07-19 14:17:09.828

-- tables
-- Table: Consultas
CREATE TABLE Consultas (
    id int  NOT NULL,
    nombres varchar(80)  NOT NULL,
    apellidos varchar(80)  NOT NULL,
    telefono char(9)  NOT NULL,
    correo varchar(100)  NOT NULL,
    motivo text  NOT NULL,
    mensaje text  NOT NULL,
    CONSTRAINT Consultas_pk PRIMARY KEY (id)
);

-- Table: Curso
CREATE TABLE Curso (
    ID_Curso int  NOT NULL,
    Nombre_Curso int  NOT NULL,
    Nivel_Curso int  NOT NULL,
    Year_Escolar int  NOT NULL,
    CONSTRAINT Curso_pk PRIMARY KEY (ID_Curso)
);

-- Table: Estudiante
CREATE TABLE Estudiante (
    ID_Estudiante int  NOT NULL,
    Nombre int  NOT NULL,
    Apellido int  NOT NULL,
    Fecha_Nacimiento datetime  NOT NULL,
    Genero int  NOT NULL,
    Direccion int  NOT NULL,
    Telefono int  NOT NULL,
    Correo_Electronico int  NOT NULL,
    ID_Curso int  NOT NULL,
    Padres_Tutor_Correo_Electronico int  NOT NULL,
    Padres_Tutor_ID_Padre_Tutor int  NOT NULL,
    CONSTRAINT Estudiante_pk PRIMARY KEY (ID_Estudiante)
);

-- Table: FECHAS_CIVICAS
CREATE TABLE FECHAS_CIVICAS (
    ID int  NOT NULL,
    FECHA date  NOT NULL,
    NOMBRE varchar(100)  NOT NULL,
    DESCRIPCION varchar(500)  NOT NULL,
    TIPO_FECHA varchar(200)  NOT NULL,
    ACTIVO char(1)  NOT NULL,
    CONSTRAINT FECHAS_CIVICAS_pk PRIMARY KEY (ID)
);

-- Table: Matricula
CREATE TABLE Matricula (
    ID_Matricula int  NOT NULL,
    ID_Estudiante int  NOT NULL,
    ID_Curso int  NOT NULL,
    Fecha_Matricula int  NOT NULL,
    Estado_Matricula int  NOT NULL,
    Estudiante_ID_Estudiante int  NOT NULL,
    Curso_ID_Curso int  NOT NULL,
    CONSTRAINT Matricula_pk PRIMARY KEY (ID_Estudiante)
);

-- Table: Padres_Tutor
CREATE TABLE Padres_Tutor (
    ID_Padre_Tutor int  NOT NULL,
    Nombre int  NOT NULL,
    Apellido int  NOT NULL,
    Direccion int  NOT NULL,
    Telefono int  NOT NULL,
    Correo_Electronico int  NOT NULL,
    CONSTRAINT Padres_Tutor_pk PRIMARY KEY (Correo_Electronico,ID_Padre_Tutor)
);

-- Table: Pago
CREATE TABLE Pago (
    ID_Pago int  NOT NULL,
    ID_Matricula int  NOT NULL,
    Monto_Pagado int  NOT NULL,
    Fecha_Pagado int  NOT NULL,
    Metodo_Pago int  NOT NULL,
    Matricula_ID_Estudiante int  NOT NULL,
    CONSTRAINT Pago_pk PRIMARY KEY (ID_Matricula)
);

-- foreign keys
-- Reference: Estudiante_Padres_Tutor (table: Estudiante)
ALTER TABLE Estudiante ADD CONSTRAINT Estudiante_Padres_Tutor FOREIGN KEY Estudiante_Padres_Tutor (Padres_Tutor_Correo_Electronico,Padres_Tutor_ID_Padre_Tutor)
    REFERENCES Padres_Tutor (Correo_Electronico,ID_Padre_Tutor);

-- Reference: Matricula_Curso (table: Matricula)
ALTER TABLE Matricula ADD CONSTRAINT Matricula_Curso FOREIGN KEY Matricula_Curso (Curso_ID_Curso)
    REFERENCES Curso (ID_Curso);

-- Reference: Matricula_Estudiante (table: Matricula)
ALTER TABLE Matricula ADD CONSTRAINT Matricula_Estudiante FOREIGN KEY Matricula_Estudiante (Estudiante_ID_Estudiante)
    REFERENCES Estudiante (ID_Estudiante);

-- Reference: Pago_Matricula (table: Pago)
ALTER TABLE Pago ADD CONSTRAINT Pago_Matricula FOREIGN KEY Pago_Matricula (Matricula_ID_Estudiante)
    REFERENCES Matricula (ID_Estudiante);

-- End of file.

