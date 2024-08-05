CREATE TABLE `jel_demanda` (
  `n_id_demanda` int PRIMARY KEY AUTO_INCREMENT,
  `b_jel_en_representacion` int(1) COMMENT 'Es en representacion de alguien mas',
  `s_jel_representa` varchar(100),
  `s_jel_hechos` varchar(100),
  `s_jel_agravios` varchar(100),
  `s_jel_normas` varchar(100),
  `b_forma_presentacion_demanda` int(1),
  `b_pruebas` int(1),
  `b_firmado` int(1),
  `tipo_derecho` varchar(256),
  `b_asignado` varchar(100),
  `acciones` varchar(100)
);

CREATE TABLE `jel_demanda_archivo` (
  `n_id_documentos` int PRIMARY KEY AUTO_INCREMENT,
  `n_id_demanda` int,
  `n_id_documento` int
);

CREATE TABLE `ssg_cat_tribunal` (
  `s_id_cve_tribunal` varchar(10) PRIMARY KEY,
  `s_tribunal` varchar(255)
);

CREATE TABLE `ssg_cfg_params` (
  `s_x` varchar(10)
);

CREATE TABLE `ssg_cat_tipo_asuntos` (
  `s_cve_tipo_asunto` varchar(20) PRIMARY KEY COMMENT 'JEL, JLDC,...',
  `s_tipo_asunto` varchar(255)
);

CREATE TABLE `inst_cat_sexo` (
  `n_id_sexo` int(1) AUTO_INCREMENT COMMENT 'Usar los sexos del catálog de SISGA-E TE',
  `s_sexo` varchar(25) COMMENT 'Incluir No aplica,...',
  PRIMARY KEY (`n_id_sexo`, `s_sexo`)
);

CREATE TABLE `ssg_cat_tipos_involucrados` (
  `n_id_tipo_involucrado` int PRIMARY KEY AUTO_INCREMENT,
  `s_tipo_involucrado` varchar(100)
);

CREATE TABLE `ssg_rel_medio_impugnacion_involucrados` (
  `n_id_medio_impugnacion_involucrados` int PRIMARY KEY AUTO_INCREMENT,
  `n_id_medio_impugnacion` int NOT NULL,
  `n_id_tipo_involucrado` int NOT NULL,
  `n_id_sexo` int(1) NOT NULL,
  `s_involucrado` varchar(255)
);

CREATE TABLE `ssg_cat_tipos_acuerdos` (
  `n_id_tipo_acuerdo` int PRIMARY KEY AUTO_INCREMENT,
  `s_tipo_acuerdo` varchar(100)
);

CREATE TABLE `ssg_rel_medios_acuerdos` (
  `n_id_acuerdo` int PRIMARY KEY AUTO_INCREMENT,
  `n_id_medio_impugnacion` int,
  `s_tipos_de_Acuerdo` varchar(255) COMMENT 'Colocar todos los ID''s de los diferentes acuerdos, separado por ,',
  `d_fecha_acuerdo` datetime,
  `d_fecha_sga` datetime,
  `d_fecha_actuaria` datetime,
  `s_observaciones` text,
  `s_nombre_acuerdo` varchar(255),
  `n_id_acordo_area` int,
  `n_id_acordo_num_empleado` int,
  `n_id_sg_area` int,
  `n_id_sg_num_empleado` int,
  `s_tmp_id_documento` varchar(10)
);

CREATE TABLE `ssg_cat_tipos_turnados` (
  `n_id_tipo_turnado` int PRIMARY KEY AUTO_INCREMENT,
  `s_tipo_turnado` varchar(60) COMMENT 'Turno, Returno'
);

CREATE TABLE `ssg_rel_medios_turnados` (
  `n_id_medio_impugnacion` int,
  `n_id_acuerdo` int,
  `n_id_turnado_area` int,
  `n_id_turnado_num_empleado` int,
  `d_fecha_turnado` datetime,
  `s_tipo_turnado` int,
  `d_fecha_turno` datetime,
  `d_Fecha_entrega_ponencia` datetime,
  `n_id_empleado_recibe` int,
  PRIMARY KEY (`n_id_medio_impugnacion`, `n_id_acuerdo`)
);

CREATE TABLE `ssg_cat_autoridades_responsables` (
  `n_id_autoridad` int PRIMARY KEY AUTO_INCREMENT,
  `s_autoridad` varchar(255)
);

CREATE TABLE `ssg_cat_via_recepcion` (
  `d_id_via_recepcion` int PRIMARY KEY AUTO_INCREMENT,
  `s_via_recepcion` varchar(100)
);

CREATE TABLE `inst_empleados` (
  `n_id_num_empleado` int PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE `inst_cat_areas` (
  `n_id_cat_area` int PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE `ssg_cat_areas_turnables` (
  `n_id_cat_area` int,
  `n_id_num_empleado` int,
  `b_activo` int(1),
  PRIMARY KEY (`n_id_cat_area`, `n_id_num_empleado`)
);

CREATE TABLE `ssg_cat_domicilios` ( /*Sería pertinente cambiar el nombre a domicilios_guardados, ya que no es un catálogo como tal*/
  `n_id_domicilio` int PRIMARY KEY AUTO_INCREMENT,
  `s_estado` varchar(50),
  `s_municipio` varchar(50),
  `s_colonia` varchar(100),
  `s_codigo_postal` varchar(5) COMMENT 'Agregar catálog',
  `n_id_activo` int(1)
);

CREATE TABLE `ssg_medios_autoridades` (
  `n_id_medio_impugnacion` int,
  `n_id_autoridad` int,
  PRIMARY KEY (`n_id_medio_impugnacion`, `n_id_autoridad`)
);

CREATE TABLE `ssg_medio_impugnacion` (
  `n_id_medio_impugnacion` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Campo FOLIO',
  `d_fecha_recepcion` datetime COMMENT 'Campo FECHA Y HORA',
  `s_cve_tribunal` varchar(10) COMMENT 'TECDMX',
  `s_cve_tipo_asunto` varchar(10),
  `n_consecutivo_expediente` int COMMENT 'Servicio. Consultar tabla de configuración para conocer el último número',
  `n_anio_expediente` int(4) COMMENT 'Año expediente',
  `s_fojas_recepcion` varchar(100),
  `s_asunto_sg` varchar(100),
  `n_id_num_empleado_recibe` int,
  `s_sg_observaciones` varchar(255),
  `s_acto_impugnado` text,
  `n_id_via_recepcion` int,
  `n_id_domicilio` int,
  `consecutivo_aviso` int,
  `n_id_tipo_eleccion` int,/*Falta agregar la llave foranea*/
  `cargo_remite` varchar(200),
  `numero_oficio` int,
  `persona_suscribe` varchar(100),
  `fecha_oficio` datetime
);

CREATE TABLE `eel_cat_tipo_documento` (
  `n_id_tipo_documento` int PRIMARY KEY AUTO_INCREMENT,
  `s_tipo_documento` varchar(10)
);

CREATE TABLE `eel_documentos` (
  `n_id_documento` int PRIMARY KEY AUTO_INCREMENT,
  `n_id_demanda` int,
  `n_id_medio_impugnacion` int,
  `n_id_tipo_documento` int,
  `d_fecha_documento` datetime,
  `s_fileformat` varchar(4),
  `s_hash_sha256` varchar(64),
  `s_aws_disk` varchar(40),
  `s_aws_path_repositorio` varchar(255),
  `s_aws_filename` varchar(255),
  `s_local_disk` varchar(40),
  `s_local_path_repositorio` varchar(255),
  `s_local_filename` varchar(255),
  `d_fecha_creacion` timestamp
);

CREATE UNIQUE INDEX `idx_s_cve_tribunal_unique` ON `ssg_cat_tribunal` (`s_id_cve_tribunal`);

CREATE UNIQUE INDEX `idx_s_cve_tipo_asunto_unique` ON `ssg_medio_impugnacion` (`s_cve_tipo_asunto`);

CREATE UNIQUE INDEX `idx_n_consecutivo_exp_unique` ON `ssg_medio_impugnacion` (`n_consecutivo_expediente`);

CREATE UNIQUE INDEX `idx_n_anio_expediente_unique` ON `ssg_medio_impugnacion` (`n_anio_expediente`);

ALTER TABLE `jel_demanda_archivo` ADD FOREIGN KEY (`n_id_demanda`) REFERENCES `jel_demanda` (`n_id_demanda`);

ALTER TABLE `jel_demanda_archivo` ADD FOREIGN KEY (`n_id_documento`) REFERENCES `eel_documentos` (`n_id_documento`);

ALTER TABLE `ssg_rel_medio_impugnacion_involucrados` ADD FOREIGN KEY (`n_id_medio_impugnacion`) REFERENCES `ssg_medio_impugnacion` (`n_id_medio_impugnacion`);

ALTER TABLE `ssg_rel_medio_impugnacion_involucrados` ADD FOREIGN KEY (`n_id_tipo_involucrado`) REFERENCES `ssg_cat_tipos_involucrados` (`n_id_tipo_involucrado`);

ALTER TABLE `ssg_rel_medio_impugnacion_involucrados` ADD FOREIGN KEY (`n_id_sexo`) REFERENCES `inst_cat_sexo` (`n_id_sexo`);

ALTER TABLE `ssg_rel_medios_acuerdos` ADD FOREIGN KEY (`n_id_medio_impugnacion`) REFERENCES `ssg_medio_impugnacion` (`n_id_medio_impugnacion`);

ALTER TABLE `ssg_rel_medios_acuerdos` ADD FOREIGN KEY (`n_id_acordo_area`) REFERENCES `ssg_cat_areas_turnables` (`n_id_cat_area`);

ALTER TABLE `ssg_rel_medios_acuerdos` ADD FOREIGN KEY (`n_id_acordo_num_empleado`) REFERENCES `ssg_cat_areas_turnables` (`n_id_cat_area`);

ALTER TABLE `ssg_rel_medios_acuerdos` ADD FOREIGN KEY (`n_id_sg_area`) REFERENCES `ssg_cat_areas_turnables` (`n_id_cat_area`);

ALTER TABLE `ssg_rel_medios_acuerdos` ADD FOREIGN KEY (`n_id_sg_num_empleado`) REFERENCES `ssg_cat_areas_turnables` (`n_id_cat_area`);

ALTER TABLE `ssg_rel_medios_turnados` ADD FOREIGN KEY (`n_id_medio_impugnacion`) REFERENCES `ssg_medio_impugnacion` (`n_id_medio_impugnacion`);

ALTER TABLE `ssg_rel_medios_turnados` ADD FOREIGN KEY (`n_id_acuerdo`) REFERENCES `ssg_rel_medios_acuerdos` (`n_id_acuerdo`);

ALTER TABLE `ssg_rel_medios_turnados` ADD FOREIGN KEY (`n_id_turnado_area`) REFERENCES `ssg_cat_areas_turnables` (`n_id_cat_area`);

ALTER TABLE `ssg_rel_medios_turnados` ADD FOREIGN KEY (`n_id_turnado_num_empleado`) REFERENCES `ssg_cat_areas_turnables` (`n_id_cat_area`);

ALTER TABLE `ssg_rel_medios_turnados` ADD FOREIGN KEY (`s_tipo_turnado`) REFERENCES `ssg_cat_tipos_turnados` (`n_id_tipo_turnado`);

ALTER TABLE `ssg_rel_medios_turnados` ADD FOREIGN KEY (`n_id_empleado_recibe`) REFERENCES `inst_empleados` (`n_id_num_empleado`);

ALTER TABLE `ssg_cat_areas_turnables` ADD FOREIGN KEY (`n_id_cat_area`) REFERENCES `inst_cat_areas` (`n_id_cat_area`);

ALTER TABLE `ssg_cat_areas_turnables` ADD FOREIGN KEY (`n_id_num_empleado`) REFERENCES `inst_empleados` (`n_id_num_empleado`);

ALTER TABLE `ssg_medios_autoridades` ADD FOREIGN KEY (`n_id_medio_impugnacion`) REFERENCES `ssg_medio_impugnacion` (`n_id_medio_impugnacion`);

ALTER TABLE `ssg_medios_autoridades` ADD FOREIGN KEY (`n_id_autoridad`) REFERENCES `ssg_cat_autoridades_responsables` (`n_id_autoridad`);

ALTER TABLE `ssg_medio_impugnacion` ADD FOREIGN KEY (`s_cve_tribunal`) REFERENCES `ssg_cat_tribunal` (`s_id_cve_tribunal`);

ALTER TABLE `ssg_medio_impugnacion` ADD FOREIGN KEY (`n_id_num_empleado_recibe`) REFERENCES `inst_empleados` (`n_id_num_empleado`);

ALTER TABLE `ssg_medio_impugnacion` ADD FOREIGN KEY (`n_id_via_recepcion`) REFERENCES `ssg_cat_via_recepcion` (`d_id_via_recepcion`);

ALTER TABLE `ssg_medio_impugnacion` ADD FOREIGN KEY (`n_id_domicilio`) REFERENCES `ssg_cat_domicilios` (`n_id_domicilio`);

ALTER TABLE `eel_documentos` ADD FOREIGN KEY (`n_id_demanda`) REFERENCES `ssg_medio_impugnacion` (`n_id_medio_impugnacion`);

ALTER TABLE `eel_documentos` ADD FOREIGN KEY (`n_id_medio_impugnacion`) REFERENCES `ssg_medio_impugnacion` (`n_id_medio_impugnacion`);

ALTER TABLE `eel_documentos` ADD FOREIGN KEY (`n_id_tipo_documento`) REFERENCES `eel_cat_tipo_documento` (`n_id_tipo_documento`);
