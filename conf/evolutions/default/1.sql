# --- !Ups
CREATE TABLE POLLS (
  ID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NAME VARCHAR NOT NULL,
  SLUG VARCHAR NOT NULL UNIQUE,
  DESCRIPTION VARCHAR NOT NULL);

CREATE INDEX ON POLLS(SLUG);

CREATE TABLE ALTERNATIVES (
  ID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NAME VARCHAR NOT NULL,
  POLL_ID BIGINT NOT NULL REFERENCES POLLS(ID) ON DELETE CASCADE
);

CREATE TABLE VOTES (
  ID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  USER VARCHAR NOT NULL,
  POLL_ID BIGINT NOT NULL REFERENCES POLLS(ID) ON DELETE CASCADE
);

CREATE TABLE notes (
  ID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  VOTE_ID BIGINT NOT NULL REFERENCES VOTES(ID) ON DELETE CASCADE,
  VALUE INTEGER DEFAULT 50 NOT NULL,
  ALTERNATIVE_ID BIGINT NOT NULL REFERENCES ALTERNATIVES(ID)
);

# --- !Downs
DROP TABLE ALTERNATIVES;
DROP TABLE NOTES;
DROP TABLE VOTES;
DROP TABLE POLLS;
