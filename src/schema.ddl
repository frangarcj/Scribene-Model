
    create table T_CATEGORIA (
        id int8 not null,
        descripcion varchar(255),
        primary key (id)
    );

    create table T_DOCUMENTO (
        id int8 not null,
        nombreFichero varchar(255),
        primary key (id)
    );

    create table T_ERROR (
        id int8 not null,
        contexto varchar(255),
        documento_id int8,
        patronError_patron varchar(255),
        primary key (id)
    );

    create table T_NORMATIVA (
        id int8 not null,
        descripcion varchar(255),
        ejemploUso varchar(255),
        fuente varchar(255),
        categoria_id int8,
        primary key (id)
    );

    create table T_PATRONERROR (
        patron varchar(255) not null,
        normativa_id int8,
        primary key (patron)
    );

    alter table T_ERROR 
        add constraint FK19AAE3D8D619773 
        foreign key (documento_id) 
        references T_DOCUMENTO;

    alter table T_ERROR 
        add constraint FK19AAE3D2D267A06 
        foreign key (patronError_patron) 
        references T_PATRONERROR;

    alter table T_NORMATIVA 
        add constraint FK3681B33A22C89313 
        foreign key (categoria_id) 
        references T_CATEGORIA;

    alter table T_PATRONERROR 
        add constraint FK74B604EF90D9D9D3 
        foreign key (normativa_id) 
        references T_NORMATIVA;

    create sequence hibernate_sequence;
