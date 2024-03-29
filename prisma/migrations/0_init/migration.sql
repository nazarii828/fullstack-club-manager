-- CreateTable
CREATE TABLE "Veteran" (
    "id" SERIAL NOT NULL,
    "firstName" VARCHAR(64) NOT NULL DEFAULT '',
    "lastName" VARCHAR(64) NOT NULL DEFAULT '',
    "emailAddress" VARCHAR(128) NOT NULL DEFAULT 'email@example.com',
    "dateOfBirth" VARCHAR(64) NOT NULL DEFAULT '',
    "homeAddress" TEXT NOT NULL DEFAULT '',
    "weightCat" VARCHAR(64) NOT NULL DEFAULT '',
    "ageCat" VARCHAR(64) NOT NULL DEFAULT '',
    "gradation" VARCHAR(128) NOT NULL DEFAULT '',
    "phoneNo" VARCHAR(32) NOT NULL DEFAULT '',

    CONSTRAINT "Veteran_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Law322" (
    "id" SERIAL NOT NULL,
    "clubName" TEXT NOT NULL DEFAULT '',
    "fullName" VARCHAR(64) NOT NULL DEFAULT '',
    "emailAddress" TEXT NOT NULL DEFAULT 'email@example.com',
    "phoneNo" TEXT NOT NULL DEFAULT '',
    "noRegisteredAthletes" INTEGER NOT NULL,
    "noParticipatingAthletes" INTEGER NOT NULL,
    "noRegisteredJuniors" INTEGER NOT NULL,
    "noParticipatingJuniors" INTEGER NOT NULL,

    CONSTRAINT "Law322_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Club" (
    "id" SERIAL NOT NULL,
    "clubName" TEXT NOT NULL DEFAULT '',
    "clubCounty" VARCHAR(64) NOT NULL DEFAULT '',
    "clubAddress" TEXT NOT NULL DEFAULT '',
    "clubContactPerson" TEXT NOT NULL DEFAULT '',
    "clubEmail" VARCHAR(128) NOT NULL DEFAULT 'email@example.com',
    "clubAfiliatFRJ" TEXT NOT NULL DEFAULT '',
    "clubAfiliatAJJ" TEXT NOT NULL DEFAULT '',
    "clubCoachOneName" TEXT NOT NULL DEFAULT '',
    "clubCoachTwoName" TEXT NOT NULL DEFAULT '',
    "clubCoachThreeName" TEXT NOT NULL DEFAULT '',
    "clubWebAddress" TEXT NOT NULL DEFAULT '',
    "clubFbAddress" TEXT NOT NULL DEFAULT '',
    "clubSocialAccounts" TEXT NOT NULL DEFAULT '',
    "dojoOneAddress" TEXT NOT NULL DEFAULT '',
    "dojoOneContactPerson" TEXT NOT NULL DEFAULT '',
    "dojoOneEmailAddress" TEXT NOT NULL DEFAULT '',
    "dojoOneTatamiMP" TEXT NOT NULL DEFAULT '',
    "dojoOneAgeGroups" TEXT NOT NULL DEFAULT '',
    "dojoTwoAddress" TEXT NOT NULL DEFAULT '',
    "dojoTwoContactPerson" TEXT NOT NULL DEFAULT '',
    "dojoTwoEmailAddress" TEXT NOT NULL DEFAULT '',
    "dojoTwoTatamiMP" TEXT NOT NULL DEFAULT '',
    "dojoTwoAgeGroups" TEXT NOT NULL DEFAULT '',
    "dojoThreeAddress" TEXT NOT NULL DEFAULT '',
    "dojoThreeContactPerson" TEXT NOT NULL DEFAULT '',
    "dojoThreeEmailAddress" TEXT NOT NULL DEFAULT '',
    "dojoThreeTatamiMP" TEXT NOT NULL DEFAULT '',
    "dojoThreeAgeGroups" TEXT NOT NULL DEFAULT '',
    "clubExtraInfo" TEXT NOT NULL DEFAULT '',
    "clubVerified" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Club_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Coach" (
    "id" SERIAL NOT NULL,
    "fullName" TEXT NOT NULL DEFAULT '',
    "phoneNo" TEXT NOT NULL DEFAULT '',
    "emailAddress" VARCHAR(128) NOT NULL DEFAULT 'email@example.com',
    "coachNationality" VARCHAR(64) NOT NULL DEFAULT '',
    "coachClub" TEXT NOT NULL DEFAULT '',
    "dateOfBirth" VARCHAR(64) NOT NULL DEFAULT '',
    "placeOfWork" TEXT NOT NULL DEFAULT '',
    "domainOfWork" TEXT NOT NULL DEFAULT '',
    "workResponsabilities" TEXT NOT NULL DEFAULT '',
    "workPeriod" TEXT NOT NULL DEFAULT '',
    "occupiedFunction" VARCHAR(256) NOT NULL DEFAULT '',
    "coachQualification" VARCHAR(256) NOT NULL DEFAULT '',
    "obtainedDegree" VARCHAR(256) NOT NULL DEFAULT '',
    "otherSkills" TEXT NOT NULL DEFAULT '',
    "blackBelt" VARCHAR(10) NOT NULL DEFAULT '',
    "coachPublications" TEXT NOT NULL DEFAULT '',
    "coachProfessionalActivity" TEXT NOT NULL DEFAULT '',
    "coachResults" TEXT NOT NULL DEFAULT '',
    "coachExtraInfo" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Coach_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Athlete" (
    "id" SERIAL NOT NULL,
    "clubName" TEXT NOT NULL DEFAULT '',
    "fullName" TEXT NOT NULL DEFAULT '',
    "dateOfBirth" VARCHAR(64) NOT NULL DEFAULT '',
    "athleteCNP" VARCHAR(64) NOT NULL DEFAULT '',
    "weightCat" VARCHAR(64) NOT NULL DEFAULT '',
    "passedExam" VARCHAR(18) NOT NULL DEFAULT '',
    "belt" VARCHAR(18) NOT NULL DEFAULT '',
    "euroRegion" INTEGER NOT NULL DEFAULT 0,
    "examinationType" VARCHAR(18) NOT NULL DEFAULT '',
    "coachName" TEXT NOT NULL DEFAULT '',
    "athleteGender" VARCHAR(18) NOT NULL DEFAULT '',

    CONSTRAINT "Athlete_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Euroregion" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL DEFAULT '',

    CONSTRAINT "Euroregion_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Veteran_id_key" ON "Veteran"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Law322_id_key" ON "Law322"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Club_id_key" ON "Club"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Coach_id_key" ON "Coach"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Athlete_id_key" ON "Athlete"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Euroregion_id_key" ON "Euroregion"("id");

