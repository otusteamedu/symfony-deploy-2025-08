<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251005041601 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE phone_user DROP CONSTRAINT fk_6e97845bbf396750
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE email_user DROP CONSTRAINT fk_12a5f6ccbf396750
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE phone_user
        SQL);
        $this->addSql(<<<'SQL'
            DROP TABLE email_user
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE "user" ADD email VARCHAR(255) DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE "user" ADD phone VARCHAR(255) DEFAULT NULL
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            CREATE TABLE phone_user (phone VARCHAR(255) NOT NULL, id BIGINT NOT NULL, PRIMARY KEY(id))
        SQL);
        $this->addSql(<<<'SQL'
            CREATE TABLE email_user (email VARCHAR(255) NOT NULL, id BIGINT NOT NULL, PRIMARY KEY(id))
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE phone_user ADD CONSTRAINT fk_6e97845bbf396750 FOREIGN KEY (id) REFERENCES "user" (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE email_user ADD CONSTRAINT fk_12a5f6ccbf396750 FOREIGN KEY (id) REFERENCES "user" (id) ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE "user" DROP email
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE "user" DROP phone
        SQL);
    }
}
