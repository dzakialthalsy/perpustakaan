create database perpustakaan;

-- -----------------------------------------------------
-- Table 'perpustakaan'.'peminjaman'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS 'perpustakaan'.'peminjaman' (
    'id' INT NOT NULL AUTO_INCREMENT,
    'tanggal' DATE NULL,
    PRIMARY KEY ('id')
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table 'perpustakaan'.'buku'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS 'perpustakaan'.'buku' (
    'id' INT NOT NULL AUTO_INCREMENT,
    'judul' VARCHAR(100) NULL,
    PRIMARY KEY ('id')
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS 'perpustakaan'.'dipinjam' (
    'peminjaman_id' INT NOT NULL,
    'buku_id' INT NOT NULL,
    'hari' INT(2) NOT NULL,
    PRIMARY KEY ('peminjaman_id', 'buku_id'),
    INDEX 'fk_peminjaman_has_buku_buku1_idx' ('buku_id' ASC),
    INDEX 'fk_peminjaman_has_buku_peminjaman_idx' ('peminjaman_id'
    ASC),
    CONSTRAINT 'fk_peminjaman_has_buku_peminjaman'
    FOREIGN KEY ('peminjaman_id')
    REFERENCES 'perpustakaan'.'peminjaman' ('id')
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT 'fk_peminjaman_has_buku_buku1'
    FOREIGN KEY ('buku_id')
    REFERENCES 'perpustakaan'.'buku' ('id')
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;
