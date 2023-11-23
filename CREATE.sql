CREATE TABLE Artists (
	ArtistID SERIAL PRIMARY KEY,
	artist_name VARCHAR(255)
);

CREATE TABLE Genres (
	GenreID SERIAL PRIMARY KEY,
	genre_name VARCHAR(255)
);

CREATE TABLE artists_genres (
	ID SERIAL PRIMARY KEY,
	ArtistID SERIAL,
	GenreID SERIAL,
	FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
	FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE Albums (
	AlbumID SERIAL PRIMARY KEY,
	album_name VARCHAR(255),
	release_year INT
);

CREATE TABLE Artist_Albums (
	ID SERIAL PRIMARY KEY,
	ArtistID SERIAL,
	AlbumID SERIAL,
	FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
	FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

CREATE TABLE Track_list (
    TrackID SERIAL PRIMARY KEY,
    track_name VARCHAR(255),
    Duration INT,
    AlbumID SERIAL,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

CREATE TABLE Compilations (
    CompilationID SERIAL PRIMARY KEY,
    Compilation_name VARCHAR(255),
    ReleaseYear INT
);

CREATE TABLE Track_Compilations (
    ID SERIAL PRIMARY KEY,
    TrackID SERIAL,
    CompilationID SERIAL,
    FOREIGN KEY (TrackID) REFERENCES Track_list(TrackID),
    FOREIGN KEY (CompilationID) REFERENCES Compilations(CompilationID)
);