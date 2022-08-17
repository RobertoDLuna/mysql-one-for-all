DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;
	# tabela de planos
  CREATE TABLE SpotifyClone.plans(
      plan_id INT NOT NULL AUTO_INCREMENT,
      plan_name  VARCHAR(100) NOT NULL,
      plan_price DECIMAL(10,2) NOT NULL,
      PRIMARY KEY(plan_id)
  ) engine = InnoDB;
  # populando tabela de planos
  INSERT INTO SpotifyClone.plans(plan_name, plan_price)
  VALUES
	('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);
    
    
  #tabela de usuarios
  CREATE TABLE SpotifyClone.users(
      user_id INT AUTO_INCREMENT NOT NULL,
      user_name VARCHAR(100) NOT NULL,
      user_age INT NOT NULL,
      plan_id INT NOT NULL,
      signature_date DATE NOT NULL,
      PRIMARY KEY(user_id),
      FOREIGN KEY(plan_id) REFERENCES plans(plan_id)
  ) engine = InnoDB;
	#populando tabela de usuarios
  INSERT INTO SpotifyClone.users (user_name, user_age, plan_id, signature_date)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');
    
    
    #tabela de artistas
  CREATE TABLE SpotifyClone.artist(
      artist_id INT AUTO_INCREMENT NOT NULL,
      artist_name VARCHAR(100) NOT NULL,
      PRIMARY KEY(artist_id)
  ) engine = InnoDB;  
	#populando tabela de artistas
  INSERT INTO SpotifyClone.artist (artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
    
    #tabela de seguidores
   CREATE TABLE SpotifyClone.following(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,
      PRIMARY KEY(user_id, artist_id),
      FOREIGN KEY(user_id) REFERENCES users(user_id),
      FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
  ) engine = InnoDB;
   INSERT INTO SpotifyClone.following (user_id, artist_id)
   VALUES
    (1,1),
    (1,2),
    (1,3),
    (2,1),
    (2,3),
    (3,2),
    (4,4),
    (5,5),
    (5,6),
    (6,6),
    (6,1),
    (7,6),
    (9,3),
    (10,2);
    #Tabela de albuns
   CREATE TABLE SpotifyClone.album(
      album_id INT AUTO_INCREMENT NOT NULL,
      album_name VARCHAR(30) NOT NULL,
      artist_id INT NOT NULL,
      PRIMARY KEY(album_id),
      FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
  ) engine = InnoDB;
  #populando tabela de albuns
   INSERT INTO SpotifyClone.album (album_name, artist_id)
   VALUES
    ('Renaissance', 1),
    ('Jazz', 2),
    ('Hot Space', 2),
    ('Falso Brilhante', 3),
    ('Vento de Maio', 3),
    ('QVVJFA?', 4),
    ('Somewhere Far Beyond', 5),
    ('I Put A Spell On You', 6);
    
    #Tabela de canções
   CREATE TABLE SpotifyClone.songs(
      song_id INT AUTO_INCREMENT NOT NULL,
      song_name VARCHAR(100) NOT NULL,
      album_id INT NOT NULL,
      release_year YEAR NOT NULL,
      duration_song INT NOT NULL,
      PRIMARY KEY(song_id),
      FOREIGN KEY(album_id) REFERENCES album(album_id)
  ) engine = InnoDB;
  #populando tabela de canções
   INSERT INTO SpotifyClone.songs (song_name, album_id, duration_song, release_year)
   VALUES
    ('BREAK MY SOUL', 1, 279,2022),
    ("VIRGO'S GROOVE", 1,369, 2022),
    ('ALIEN SUPERSTAR', 1, 116, 2022),
    ("Don't Stop Me Now", 2, 203, 1978),
    ('Underpressure', 3, 152, 1982),
    ('Como Nossos Pais', 4, 105, 1998),
    ('O Medo de Amar é o Medo de ser Livre', 5, 207, 2001),
    ('Samba em Paris', 6, 267, 2003),
    ("The Bard's Song", 7, 244, 2007),
    ('Feeling Good', 8, 100, 2012);
    
    #tabela de historico
   CREATE TABLE SpotifyClone.history(
      user_id INT NOT NULL,
      song_id INT NOT NULL,
      play_date DATETIME NOT NULL,
      PRIMARY KEY(user_id, song_id),
      FOREIGN KEY(user_id) REFERENCES users(user_id),
      FOREIGN KEY(song_id) REFERENCES songs(song_id)
  ) engine = InnoDB;
  #populando tabela de historico
   INSERT INTO SpotifyClone.history(user_id, song_id, play_date)
   VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:30:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');