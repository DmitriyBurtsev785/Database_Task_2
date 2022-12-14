create table if not exists Genre (
	id SERIAL primary key,
	name VARCHAR(40) not null
);


create table if not exists Singer (
	id SERIAL primary key,
	name VARCHAR(40) not null
);


create table if not exists Album (
	id SERIAL primary key,
	name VARCHAR(40) not null,
	year_of_issue integer not null
);	




create table if not exists SingerGenre (
	genre_id integer references Genre(id),
	singer_id integer references Singer(id),
	constraint pk primary key (genre_id, singer_id)
);



create table if not exists SingerAlbum (
	singer_id integer references Singer(id),
	album_id integer references Album(id),
	constraint lk primary key (singer_id, album_id) 
);



create table if not exists Track (
	id serial primary key,
	album_id integer not null references Album(id),
	name varchar(40) not null,
	duration timestamp not null
);


create table if not exists Compilation (
	id serial primary key,
	name varchar(40) not null,
	year_of_issue integer not null
);

create table if not exists TrackCompilation (
	track_id integer references Track(id),
	compilation_id integer references Compilation(id),
	constraint nk primary key (track_id, compilation_id)
);	
