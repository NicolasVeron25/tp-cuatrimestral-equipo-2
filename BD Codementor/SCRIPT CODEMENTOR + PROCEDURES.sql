CREATE DATABASE CODEMENTOR
GO
USE CODEMENTOR

CREATE TABLE CATEGORIAS(
  IDCATEGORIA INT PRIMARY KEY IDENTITY(1,1),
    NOMBRE VARCHAR(150) UNIQUE  NOT NULL
)
GO
CREATE TABLE CURSOS(
    IDCURSO INT PRIMARY KEY IDENTITY(1,1),
    NOMBRE VARCHAR(150) UNIQUE NOT NULL,
    DESCRIPCION VARCHAR(1700) NOT NULL,
    REQUISITOS VARCHAR(300) NOT NULL,
    IMPORTE MONEY NOT NULL,
    URL_PORTADA VARCHAR(1700) UNIQUE NOT NULL,
    IDCATEGORIA INT NOT NULL,
    FECHA_CREACION DATETIME DEFAULT GETDATE(),
    CONSTRAINT Fk_Cursos_Categorias FOREIGN KEY (IDCATEGORIA) REFERENCES CATEGORIAS(IDCATEGORIA)
)
GO 

CREATE TABLE UNIDADES(
 IDUNIDAD INT PRIMARY KEY IDENTITY(1,1),
 NUMERO INT NOT NULL ,
 NOMBRE VARCHAR (70) NOT NULL,
 DESCRIPCION VARCHAR(300) NOT NULL,
 IDCURSO INT  NOT NULL
 CONSTRAINT Fk_Unidades_Cursos FOREIGN KEY (IDCURSO) REFERENCES CURSOS(IDCURSO)
)
GO
CREATE TABLE CLASES(
 IDCLASE INT PRIMARY KEY IDENTITY(1,1),
 IDUNIDAD INT NOT NULL,
 NUMERO INT NOT NULL,
 DESCRIPCION VARCHAR(300) NOT NULL,
 DURACION INT NOT NULL,
 URL_VIDEO VARCHAR(1000) NOT NULL
 CONSTRAINT Fk_Clases_Unidades FOREIGN KEY (IDUNIDAD) REFERENCES UNIDADES(IDUNIDAD)

)
GO

CREATE TABLE LENGUAJES (
    IDLENGUAJE INT PRIMARY KEY IDENTITY(1,1),
    NOMBRE VARCHAR(50) UNIQUE  NOT NULL
)
GO
CREATE TABLE LENGUAJESXCURSO(
    IDLENGUAJE INT NOT NULL,
    IDCURSO INT NOT NULL,
    PRIMARY KEY (IDLENGUAJE,IDCURSO),
 CONSTRAINT Fk_LenguajesxCurso_Lenguajes FOREIGN KEY (IDLENGUAJE) REFERENCES LENGUAJES(IDLENGUAJE),
 CONSTRAINT Fk_LenguajesxCurso_Curso FOREIGN KEY (IDCURSO) REFERENCES CURSOS(IDCURSO)

)
GO
CREATE TABLE USUARIOS (
    IDUSUARIO INT PRIMARY KEY IDENTITY(1,1),
    EMAIL VARCHAR (400) UNIQUE NOT NULL,
    PASS VARCHAR(100) NOT NULL,
    ES_ADMIN BIT DEFAULT 0,
    FECHA_CREACION DATETIME DEFAULT GETDATE()
)
GO

CREATE TABLE PAISES
(
     IDPAIS INT PRIMARY KEY
    ,NOMBRE VARCHAR(50)
    ,CODIGOPAIS_2 CHAR(2)
    ,CODIGOPAIS_3 CHAR(3)    
)

GO
CREATE TABLE INFORMACION_USUARIO(
  IDUSUARIO INT PRIMARY KEY ,
  NOMBRE VARCHAR(100) NOT NULL,
  APELLIDO VARCHAR(100) NOT NULL,
  FECHA_NACIMIENTO DATETIME NOT NULL,
  IDPAIS INT NOT NULL,
  CELULAR VARCHAR(30)  NOT NULL,
  SEXO CHAR NOT NULL,
CONSTRAINT Chk_Sexo CHECK (SEXO IN ('M', 'F','m','f')),

  URL_FOTOPERFIL VARCHAR  (1000)  NULL
 CONSTRAINT Fk_Info_Usuario FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(IDUSUARIO),
 CONSTRAINT Fk_Info_Pais FOREIGN KEY (IDPAIS) REFERENCES PAISES(IDPAIS)

)
GO
CREATE TABLE INSCRIPCIONES(
 IDINSCRIPCION INT PRIMARY KEY IDENTITY(1,1),
 IDCURSO INT NOT NULL,
 IDUSUARIO INT NOT NULL,
 FECHA DATE NOT NULL DEFAULT GETDATE(),
 CONSTRAINT Fk_Inscripciones_Cursos FOREIGN KEY (IDCURSO) REFERENCES CURSOS(IDCURSO),
 CONSTRAINT Fk_Inscripciones_Usuarios FOREIGN KEY (IDUsuario) REFERENCES USUARIOS(IDUSUARIO)

)
GO
CREATE TABLE RESEÑAS(
 IDRESEÑA INT PRIMARY KEY IDENTITY(1,1),
 IDINSCRIPCION INT NOT NULL,
 IDCURSO INT NOT NULL,
 PUNTAJE INT NOT NULL,
 DESCRIPCION VARCHAR(500) NULL,
 CONSTRAINT Fk_Reseñas_Inscripcion FOREIGN KEY (IDINSCRIPCION) REFERENCES INSCRIPCIONES(IDINSCRIPCION),
 CONSTRAINT Fk_Reseñas_Curso FOREIGN KEY (IDCURSO) REFERENCES CURSOS(IDCURSO)

)

GO
CREATE TABLE CERTIFICACIONES(
 IDCERTIFICACIONES INT PRIMARY KEY IDENTITY(1,1),
 IDINSCRIPCION INT NOT NULL,
 CONSTRAINT Fk_Certificaciones_Inscripcion FOREIGN KEY (IDINSCRIPCION) REFERENCES INSCRIPCIONES(IDINSCRIPCION)

)
GO

CREATE TABLE PREGUNTAS(
 IDPREGUNTA INT PRIMARY KEY IDENTITY(1,1),
 IDCURSO INT NOT NULL,
 IDUSUARIO INT NOT NULL,
 FECHA DATETIME DEFAULT GETDATE(),
 TITULO VARCHAR(150) NOT NULL,
 CUERPO VARCHAR (1700) NOT NULL
 CONSTRAINT Fk_Preguntas_Cursos FOREIGN KEY (IDCURSO) REFERENCES CURSOS(IDCURSO),
 CONSTRAINT Fk_Preguntas_Usuarios FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(IDUSUARIO)

)
GO
CREATE TABLE RESPUESTAS(
 IDRESPUESTA INT PRIMARY KEY IDENTITY(1,1),
 IDPREGUNTA INT NOT NULL,
 FECHA DATETIME DEFAULT GETDATE(),
 CUERPO VARCHAR(1000) NOT NULL,
 CONSTRAINT Fk_Respuestas_Preguntas FOREIGN KEY (IDPREGUNTA) REFERENCES PREGUNTAS(IDPREGUNTA)
 
)

CREATE TABLE UNIDADES_FINALIZADAS(
 IDUNIDAD INT NOT NULL,
 IDUSUARIO INT NOT NULL ,
 PRIMARY KEY (IDUNIDAD,IDUSUARIO),
 CONSTRAINT Fk_UnidadesFinalizadas_Usuarios FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(IDUSUARIO),
 CONSTRAINT Fk_UnidadesFinalizadas_Unidades FOREIGN KEY (IDUNIDAD) REFERENCES UNIDADES(IDUNIDAD)
) 

--PROCEDURES 
-- IMPORTANTE : USAR TRANSACTION. MAS CUANDO HAY MAS DE UNA TAREA INVOLUCRADA Y DEPENDENCIAS
--OUTPUT -- ME DEVUELVE EL ID DEL INSERTADO . EL DE USUARIO ES EL MISMO PARA AMBOS.

GO 
CREATE OR ALTER PROCEDURE SP_INSERTUSUARIO(
    @Email VARCHAR(400),
    @Pass VARCHAR(100),
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @FechaNacimiento DATE,
    @IdPais INT,
    @Celular VARCHAR(30),
    @Sexo CHAR(1)
    --@UrlFotoPerfil VARCHAR(1000) 
)
AS BEGIN
    
    BEGIN TRY
        BEGIN TRANSACTION;

        -- TABLA USUARIOS
        INSERT INTO USUARIOS (EMAIL, PASS)
        VALUES (@Email, @Pass);

       DECLARE @ID INT ;
        SELECT @ID = IDUSUARIO FROM USUARIOS WHERE EMAIL = @Email;

        -- Insertar en la tabla INFORMACION_USUARIO
        INSERT INTO INFORMACION_USUARIO (IDUSUARIO, NOMBRE, APELLIDO, FECHA_NACIMIENTO, IDPAIS, CELULAR, SEXO) output inserted.IDUSUARIO
        VALUES (@ID, @Nombre, @Apellido, @FechaNacimiento, @IdPais, @Celular, @Sexo);

        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
       
        ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END

GO